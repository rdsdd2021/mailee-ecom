const http = require('http');
const crypto = require('crypto');
const { exec } = require('child_process');

const PORT = 9099;
const SECRET = 'mailee_webhook_secret_998877';

const server = http.createServer((req, res) => {
    if (req.method === 'POST' && (req.url === '/deploy-webhook' || req.url === '/')) {
        let body = '';

        req.on('data', chunk => {
            body += chunk.toString();
        });

        req.on('end', () => {
            const signature = req.headers['x-hub-signature-256'];
            
            if (SECRET && signature) {
                const hmac = crypto.createHmac('sha256', SECRET);
                const digest = 'sha256=' + hmac.update(body).digest('hex');

                if (signature !== digest) {
                    console.error('❌ Webhook signature mismatch');
                    res.writeHead(401, { 'Content-Type': 'application/json' });
                    return res.end(JSON.stringify({ error: 'Invalid signature' }));
                }
            }

            try {
                const payload = JSON.parse(body || '{}');
                console.log(`📩 Received GitHub Webhook event for ref: ${payload.ref || 'push'}`);

                if (!payload.ref || payload.ref === 'refs/heads/main') {
                    console.log('🚀 Triggering automated deployment script...');
                    
                    exec('bash /home/rds2197/ecom/deploy.sh', (error, stdout, stderr) => {
                        if (error) {
                            console.error(`❌ Deployment error: ${error.message}`);
                            return;
                        }
                        console.log(`✅ Deployment output:\n${stdout}`);
                    });

                    res.writeHead(200, { 'Content-Type': 'application/json' });
                    return res.end(JSON.stringify({ status: 'success', message: 'Deployment triggered successfully' }));
                } else {
                    res.writeHead(200, { 'Content-Type': 'application/json' });
                    return res.end(JSON.stringify({ status: 'ignored', message: `Branch ${payload.ref} ignored` }));
                }
            } catch (err) {
                console.error('❌ Error parsing payload:', err);
                res.writeHead(400, { 'Content-Type': 'application/json' });
                return res.end(JSON.stringify({ error: 'Invalid JSON payload' }));
            }
        });
    } else if (req.method === 'GET') {
        res.writeHead(200, { 'Content-Type': 'application/json' });
        res.end(JSON.stringify({ status: 'online', service: 'Mailee Deployment Webhook' }));
    } else {
        res.writeHead(404, { 'Content-Type': 'application/json' });
        res.end(JSON.stringify({ error: 'Not found' }));
    }
});

server.listen(PORT, '0.0.0.0', () => {
    console.log(`🚀 Deployment Webhook server listening on http://0.0.0.0:${PORT}`);
});
