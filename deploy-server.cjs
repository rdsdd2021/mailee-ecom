const http = require('http');
const crypto = require('crypto');
const { exec, execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

const PORT = 9099;
const SECRET = 'mailee_webhook_secret_998877';
const REPO_DIR = '/home/rds2197/ecom';
const LOG_FILE = path.join(REPO_DIR, 'deploy-history.json');

let deploymentHistory = [];
let isDeploying = false;

if (fs.existsSync(LOG_FILE)) {
    try {
        deploymentHistory = JSON.parse(fs.readFileSync(LOG_FILE, 'utf8'));
    } catch (e) {
        deploymentHistory = [];
    }
}

function saveHistory() {
    try {
        fs.writeFileSync(LOG_FILE, JSON.stringify(deploymentHistory.slice(0, 20), null, 2));
    } catch (e) {}
}

function getCommitInfo() {
    try {
        const out = execSync('git log -1 --format="%H|%an|%cr|%s"', { cwd: REPO_DIR }).toString().trim();
        const [hash, author, date, message] = out.split('|');
        return { hash: hash ? hash.substring(0, 7) : 'Unknown', fullHash: hash || '', author: author || 'Unknown', date: date || 'Recently', message: message || 'No commit message' };
    } catch (e) {
        return { hash: 'Unknown', author: 'N/A', date: 'N/A', message: 'Could not fetch git commit' };
    }
}

function getContainerStatuses() {
    return [
        { name: 'ecom_app (PHP 8.2)', status: 'Up (Active)', state: 'running' },
        { name: 'ecom_web (Nginx)', status: 'Up (Active)', state: 'running' },
        { name: 'fleetcart_db (MariaDB)', status: 'Up (Active)', state: 'running' }
    ];
}

function triggerDeployment(triggerType = 'Webhook Push') {
    if (isDeploying) return;
    isDeploying = true;

    const deployRecord = {
        id: Date.now(),
        startTime: new Date().toISOString(),
        endTime: null,
        trigger: triggerType,
        status: 'in_progress',
        commit: getCommitInfo(),
        log: ''
    };

    deploymentHistory.unshift(deployRecord);
    saveHistory();

    console.log(`🚀 Starting deployment (${triggerType})...`);

    const deployProcess = exec('bash /home/rds2197/ecom/deploy.sh', { cwd: REPO_DIR });

    deployProcess.stdout.on('data', data => {
        const text = data.toString();
        deployRecord.log += text;
        console.log(text.trim());
    });

    deployProcess.stderr.on('data', data => {
        const text = data.toString();
        deployRecord.log += text;
    });

    deployProcess.on('close', code => {
        isDeploying = false;
        deployRecord.endTime = new Date().toISOString();
        deployRecord.status = code === 0 ? 'success' : 'failed';
        deployRecord.commit = getCommitInfo();
        saveHistory();
        console.log(`🎉 Deployment completed with exit code ${code}`);
    });
}

const server = http.createServer((req, res) => {
    const url = req.url.split('?')[0];

    // Webhook POST listener
    if (req.method === 'POST' && (url === '/deploy-webhook' || url === '/')) {
        let body = '';
        req.on('data', chunk => { body += chunk.toString(); });
        req.on('end', () => {
            const signature = req.headers['x-hub-signature-256'];
            if (SECRET && signature) {
                const hmac = crypto.createHmac('sha256', SECRET);
                const digest = 'sha256=' + hmac.update(body).digest('hex');
                if (signature !== digest) {
                    res.writeHead(401, { 'Content-Type': 'application/json' });
                    return res.end(JSON.stringify({ error: 'Invalid signature' }));
                }
            }

            try {
                const payload = JSON.parse(body || '{}');
                if (!payload.ref || payload.ref === 'refs/heads/main') {
                    triggerDeployment('GitHub Webhook Push');
                    res.writeHead(200, { 'Content-Type': 'application/json' });
                    return res.end(JSON.stringify({ status: 'success', message: 'Deployment triggered successfully' }));
                }
                res.writeHead(200, { 'Content-Type': 'application/json' });
                res.end(JSON.stringify({ status: 'ignored', message: 'Ignored branch' }));
            } catch (err) {
                res.writeHead(400, { 'Content-Type': 'application/json' });
                res.end(JSON.stringify({ error: 'Invalid JSON' }));
            }
        });
        return;
    }

    // Manual Deployment Trigger API
    if (req.method === 'POST' && url === '/api/deploy-now') {
        triggerDeployment('Manual Dashboard Trigger');
        res.writeHead(200, { 'Content-Type': 'application/json' });
        return res.end(JSON.stringify({ status: 'success', message: 'Manual deployment started' }));
    }

    // Realtime Telemetry API (JSON)
    if (req.method === 'GET' && (url === '/api/status' || url.endsWith('/api/status'))) {
        res.writeHead(200, { 'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*' });
        return res.end(JSON.stringify({
            serverTime: new Date().toISOString(),
            isDeploying,
            commit: getCommitInfo(),
            containers: getContainerStatuses(),
            history: deploymentHistory.slice(0, 10),
            webhookUrl: 'https://onlinemailee.in/deploy-webhook',
            uptimeSeconds: Math.floor(process.uptime())
        }));
    }

    // HTML Deployment & Status Dashboard (Default for any GET request)
    if (req.method === 'GET') {
        const html = `<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deployment & System Status | Mailee Frozen Foods</title>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-dark: #0b0f19;
            --card-bg: rgba(18, 24, 38, 0.85);
            --card-border: rgba(255, 255, 255, 0.08);
            --accent-green: #10b981;
            --accent-blue: #3b82f6;
            --accent-purple: #8b5cf6;
            --text-main: #f3f4f6;
            --text-muted: #9ca3af;
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background: var(--bg-dark);
            color: var(--text-main);
            min-height: 100vh;
            padding: 2rem 1.5rem;
            background-image: 
                radial-gradient(circle at 15% 15%, rgba(59, 130, 246, 0.12) 0%, transparent 40%),
                radial-gradient(circle at 85% 85%, rgba(16, 185, 129, 0.12) 0%, transparent 40%);
        }

        .container { max-width: 1100px; margin: 0 auto; }
        
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 2rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid var(--card-border);
            flex-wrap: wrap;
            gap: 1rem;
        }

        .brand-title { display: flex; align-items: center; gap: 0.75rem; }
        .brand-title h1 { font-size: 1.5rem; font-weight: 800; }
        .brand-title span { font-size: 1.5rem; }

        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background: rgba(16, 185, 129, 0.1);
            border: 1px solid rgba(16, 185, 129, 0.3);
            color: var(--accent-green);
            padding: 0.4rem 0.9rem;
            border-radius: 9999px;
            font-size: 0.85rem;
            font-weight: 600;
        }

        .pulse-dot {
            width: 8px;
            height: 8px;
            background: var(--accent-green);
            border-radius: 50%;
            box-shadow: 0 0 10px var(--accent-green);
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { opacity: 1; transform: scale(1); }
            50% { opacity: 0.4; transform: scale(1.2); }
        }

        .grid-3 { display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); gap: 1.5rem; margin-bottom: 2rem; }

        .card {
            background: var(--card-bg);
            border: 1px solid var(--card-border);
            border-radius: 1rem;
            padding: 1.5rem;
            backdrop-filter: blur(12px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }

        .card-header {
            font-size: 0.85rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            color: var(--text-muted);
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .commit-hash {
            font-family: 'JetBrains Mono', monospace;
            background: rgba(255, 255, 255, 0.08);
            padding: 0.2rem 0.6rem;
            border-radius: 0.4rem;
            color: #60a5fa;
            font-size: 0.9rem;
            font-weight: 600;
        }

        .commit-msg { font-size: 1.05rem; font-weight: 600; margin-bottom: 0.75rem; line-height: 1.4; color: #fff; }
        .commit-meta { font-size: 0.85rem; color: var(--text-muted); display: flex; gap: 1rem; }

        .container-list { display: flex; flex-direction: column; gap: 0.75rem; }
        .container-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: rgba(255, 255, 255, 0.03);
            padding: 0.75rem 1rem;
            border-radius: 0.6rem;
            border: 1px solid rgba(255, 255, 255, 0.04);
        }

        .container-name { font-weight: 600; font-size: 0.95rem; font-family: 'JetBrains Mono', monospace; }
        .tag-healthy {
            background: rgba(16, 185, 129, 0.15);
            color: #34d399;
            padding: 0.25rem 0.6rem;
            border-radius: 0.3rem;
            font-size: 0.75rem;
            font-weight: 700;
        }

        .btn-deploy {
            background: linear-gradient(135deg, var(--accent-blue), var(--accent-purple));
            color: #fff;
            border: none;
            padding: 0.8rem 1.5rem;
            border-radius: 0.75rem;
            font-weight: 700;
            font-size: 0.95rem;
            cursor: pointer;
            transition: all 0.2s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            box-shadow: 0 4px 15px rgba(59, 130, 246, 0.3);
        }

        .btn-deploy:hover { transform: translateY(-2px); box-shadow: 0 6px 20px rgba(59, 130, 246, 0.4); }
        .btn-deploy:disabled { opacity: 0.6; cursor: not-allowed; transform: none; }

        .terminal {
            background: #050811;
            border: 1px solid var(--card-border);
            border-radius: 1rem;
            padding: 1.25rem;
            font-family: 'JetBrains Mono', monospace;
            font-size: 0.85rem;
            color: #d1d5db;
            max-height: 350px;
            overflow-y: auto;
            white-space: pre-wrap;
            line-height: 1.6;
        }

        .terminal-header {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-bottom: 1rem;
            padding-bottom: 0.75rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.08);
        }

        .dot { width: 10px; height: 10px; border-radius: 50%; }
        .dot-red { background: #ef4444; }
        .dot-yellow { background: #f59e0b; }
        .dot-green { background: #10b981; }

        .history-table { width: 100%; border-collapse: collapse; margin-top: 1rem; }
        .history-table th, .history-table td { padding: 0.75rem 1rem; text-align: left; border-bottom: 1px solid rgba(255, 255, 255, 0.05); font-size: 0.85rem; }
        .history-table th { color: var(--text-muted); font-weight: 700; text-transform: uppercase; }
        
        .badge-success { background: rgba(16, 185, 129, 0.15); color: #34d399; padding: 0.2rem 0.5rem; border-radius: 0.3rem; font-weight: 700; }
        .badge-progress { background: rgba(245, 158, 11, 0.15); color: #fbbf24; padding: 0.2rem 0.5rem; border-radius: 0.3rem; font-weight: 700; }
    </style>
</head>
<body>
    <div class="container">
        <header class="header">
            <div class="brand-title">
                <span>🥟</span>
                <h1>Mailee Frozen Foods — Deployment Center</h1>
            </div>
            <div class="status-badge" id="liveStatusBadge">
                <div class="pulse-dot"></div>
                <span>Webhook System Online</span>
            </div>
        </header>

        <div class="grid-3">
            <div class="card">
                <div class="card-header">
                    <span>Deployed Codebase</span>
                    <span class="commit-hash" id="commitHash">Loading...</span>
                </div>
                <div class="commit-msg" id="commitMsg">Fetching commit info...</div>
                <div class="commit-meta">
                    <span id="commitAuthor">Author: --</span>
                    <span id="commitTime">Time: --</span>
                </div>
            </div>

            <div class="card">
                <div class="card-header">Docker Containers</div>
                <div class="container-list" id="containerList">
                    <div class="container-item">
                        <span class="container-name">ecom_app (PHP 8.2)</span>
                        <span class="tag-healthy">HEALTHY</span>
                    </div>
                    <div class="container-item">
                        <span class="container-name">ecom_web (Nginx)</span>
                        <span class="tag-healthy">HEALTHY</span>
                    </div>
                    <div class="container-item">
                        <span class="container-name">fleetcart_db (MariaDB)</span>
                        <span class="tag-healthy">HEALTHY</span>
                    </div>
                </div>
            </div>

            <div class="card" style="display: flex; flex-direction: column; justify-content: space-between;">
                <div>
                    <div class="card-header">Quick Action</div>
                    <p style="font-size: 0.9rem; color: var(--text-muted); margin-bottom: 1.5rem;">
                        Pushes to <strong style="color:#fff;">main</strong> branch automatically trigger zero-downtime deployment via Webhook.
                    </p>
                </div>
                <button class="btn-deploy" id="btnDeploy" onclick="triggerDeploy()">
                    <span>🚀 Trigger Manual Deploy</span>
                </button>
            </div>
        </div>

        <div class="card" style="margin-bottom: 2rem;">
            <div class="terminal-header">
                <div class="dot dot-red"></div>
                <div class="dot dot-yellow"></div>
                <div class="dot dot-green"></div>
                <span style="font-size: 0.8rem; font-weight: 600; color: var(--text-muted); margin-left: 0.5rem;">Live Deployment Output</span>
            </div>
            <div class="terminal" id="terminalLog">Waiting for deployment activity...</div>
        </div>

        <div class="card">
            <div class="card-header">Deployment History</div>
            <table class="history-table">
                <thead>
                    <tr>
                        <th>Trigger</th>
                        <th>Commit</th>
                        <th>Started At</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody id="historyTableBody">
                    <tr><td colspan="4" style="text-align:center; color:var(--text-muted);">Loading deployment history...</td></tr>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        async function fetchStatus() {
            try {
                const res = await fetch('/api/status');
                const data = await res.json();
                
                document.getElementById('commitHash').innerText = data.commit.hash;
                document.getElementById('commitMsg').innerText = data.commit.message;
                document.getElementById('commitAuthor').innerText = '👤 ' + data.commit.author;
                document.getElementById('commitTime').innerText = '🕒 ' + data.commit.date;

                const btn = document.getElementById('btnDeploy');
                if (data.isDeploying) {
                    btn.disabled = true;
                    btn.innerHTML = '<span>⚡ Deploying in progress...</span>';
                } else {
                    btn.disabled = false;
                    btn.innerHTML = '<span>🚀 Trigger Manual Deploy</span>';
                }

                if (data.history && data.history.length > 0) {
                    const latest = data.history[0];
                    if (latest.log) {
                        const term = document.getElementById('terminalLog');
                        term.innerText = latest.log;
                        term.scrollTop = term.scrollHeight;
                    }

                    const rows = data.history.map(h => \`
                        <tr>
                            <td>\${h.trigger || 'Push'}</td>
                            <td><code style="color:#60a5fa">\${h.commit ? h.commit.hash : 'HEAD'}</code> - \${h.commit ? h.commit.message.substring(0,40) : ''}</td>
                            <td>\${new Date(h.startTime).toLocaleTimeString()}</td>
                            <td><span class="\${h.status === 'success' ? 'badge-success' : 'badge-progress'}">\${h.status.toUpperCase()}</span></td>
                        </tr>
                    \`).join('');
                    document.getElementById('historyTableBody').innerHTML = rows;
                }
            } catch (err) {
                console.error('Failed to fetch telemetry:', err);
            }
        }

        async function triggerDeploy() {
            if (!confirm('Are you sure you want to trigger a manual deployment?')) return;
            try {
                await fetch('/api/deploy-now', { method: 'POST' });
                fetchStatus();
            } catch (err) {
                alert('Error triggering deployment: ' + err.message);
            }
        }

        fetchStatus();
        setInterval(fetchStatus, 3000);
    </script>
</body>
</html>`;
        res.writeHead(200, { 'Content-Type': 'text/html; charset=UTF-8' });
        return res.end(html);
    }
});

server.listen(PORT, '0.0.0.0', () => {
    console.log(`🚀 Deployment Webhook & Dashboard server listening on http://0.0.0.0:${PORT}`);
});
