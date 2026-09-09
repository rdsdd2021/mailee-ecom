# 🥟 Mailee Frozen Foods - E-Commerce Platform

Official repository and technical documentation for **Mailee Frozen Foods** (`https://onlinemailee.in`). This guide provides everything required for ongoing maintenance, development, container orchestration, database administration, and CI/CD operations.

---

## 📌 Table of Contents
1. [System Overview & Tech Stack](#-system-overview--tech-stack)
2. [Architecture & Infrastructure](#-architecture--infrastructure)
3. [Directory & Project Structure](#-directory--project-structure)
4. [Local Development & Docker Setup](#-local-development--docker-setup)
5. [Database Administration & Seeding](#-database-administration--seeding)
6. [Permissions & Storage Rules](#-permissions--storage-rules)
7. [Nginx, Cloudflare & Domain Setup](#-nginx-cloudflare--domain-setup)
8. [CI/CD & Automated Deployments](#-cicd--automated-deployments)
9. [Maintenance & Troubleshooting Guide](#-maintenance--troubleshooting-guide)

---

## 🚀 System Overview & Tech Stack

Mailee Frozen Foods is an e-commerce platform built on **FleetCart v4.7.2** (Laravel 11 framework) tailored for wholesale and retail distribution of frozen foods (Momos, Spring Rolls, French Fries, Parathas, VIP Pass) across Siliguri, Darjeeling, Jalpaiguri, and North Bengal.

| Layer | Component | Version / Technology |
| :--- | :--- | :--- |
| **Framework** | Laravel / FleetCart | Laravel 11.x / FleetCart v4.7.2 |
| **Runtime** | PHP | 8.2-FPM (Alpine Docker base) |
| **Database** | MariaDB | 10.6 |
| **Web Server** | Nginx | 1.25 Alpine (Reverse proxied) |
| **Edge & SSL** | Cloudflare & NPM | SSL termination, DNS Proxy |
| **Orchestration** | Docker Compose | Compose v2 (Bridge + External proxy net) |
| **CI/CD** | GitHub Actions | Automated SSH Deployment |

---

## 🏗️ Architecture & Infrastructure

The application runs in three isolated Docker containers managed via `docker-compose.yml`:

```
                    [ User Request ]
                           │
             [ Cloudflare DNS (SSL Proxied) ]
                           │
             [ Nginx Proxy Manager (Port 80/443) ]
                           │
             ┌─────────────┴─────────────┐
             │   proxy_network (Bridge)  │
             └─────────────┬─────────────┘
                           │
                     ┌─────▼─────┐
                     │ ecom_web  │  (Nginx Alpine - Port 8085:80)
                     └─────┬─────┘
                           │ FastCGI (Pass to ecom_app:9000)
                     ┌─────▼─────┐
                     │ ecom_app  │  (PHP 8.2-FPM - App Code)
                     └─────┬─────┘
                           │ MySQL Connection (Port 3306)
                     ┌─────▼─────┐
                     │fleetcart_db│ (MariaDB 10.6 - Persistent Volume)
                     └───────────┘
```

---

## 📁 Directory & Project Structure

```
/home/rds2197/ecom/
├── app/                        # Application core logic & HTTP controllers
├── bootstrap/                  # Framework initialization & cached configs
├── config/                     # Application configuration settings
├── database/                   # Migrations, seeders, and schema files
├── docker/                     # Container configurations
│   ├── Dockerfile              # PHP 8.2-FPM build file with dependencies
│   ├── entrypoint.sh          # Container startup & permission enforcer
│   └── nginx.conf              # Nginx server configuration
├── modules/                    # FleetCart modular subsystems (Product, Order, Page, User, etc.)
├── public/                     # Public root (index.php, CSS, JS, uploaded images)
├── resources/                  # Blade views, assets, and translation strings
├── routes/                     # Application web and API route definitions
├── storage/                    # Logs, file uploads, compiled Blade views
├── .env.example                # Safe environment template
├── .gitignore                  # Git tracking rules (excludes .env & zip assets)
├── docker-compose.yml          # Container orchestration definition
├── deploy.sh                   # Automated deployment script
├── seed_mailee.php             # Custom product & catalog seed script
├── create_mailee_pages.php     # Custom CMS pages generator (About, Contact, Media)
├── setup_menus_and_sections.php# Primary menu and homepage layout builder
├── update_banners.php          # Banner & promo image configuration
└── README.md                   # Project documentation
```

---

## 💻 Local Development & Docker Setup

### Prerequisites
- Docker Engine 24+ & Docker Compose v2+
- Git 2.40+

### Step-by-Step Setup Instructions

1. **Clone the Repository**:
   ```bash
   git clone git@github.com:rdsdd2021/mailee-ecom.git /home/rds2197/ecom
   cd /home/rds2197/ecom
   ```

2. **Configure Environment File**:
   Copy `.env.example` to `.env` and fill in production database credentials:
   ```bash
   cp .env.example .env
   ```
   Ensure `.env` contains:
   ```ini
   APP_NAME="FleetCart"
   APP_ENV=production
   APP_DEBUG=false
   APP_URL="https://onlinemailee.in"

   DB_CONNECTION=mysql
   DB_HOST=fleetcart_db
   DB_PORT=3306
   DB_DATABASE=fleetcart_db
   DB_USERNAME=fleetcart_user
   DB_PASSWORD=fleetcart_password
   ```

3. **Ensure External Network Exists**:
   ```bash
   docker network create proxy_network || true
   ```

4. **Build & Launch Docker Stack**:
   ```bash
   docker compose up -d --build
   ```

5. **Verify Running Containers**:
   ```bash
   docker compose ps
   ```

---

## 🗄️ Database Administration & Seeding

The database service runs in `fleetcart_db` with data stored persistently in the volume `fleetcart_db_data`.

### Database Credentials
- **Database**: `fleetcart_db`
- **Username**: `fleetcart_user`
- **Password**: `fleetcart_password`
- **Root Password**: `fleetcart_root_password`

### Direct Database Access
To connect directly via Docker MySQL client:
```bash
docker compose exec fleetcart_db mysql -ufleetcart_user -pfleetcart_password fleetcart_db
```

### Custom Utility Scripts
The codebase includes custom PHP scripts to populate catalog, custom pages, and visual features:

| Script | Purpose | Execution Command |
| :--- | :--- | :--- |
| `seed_mailee.php` | Populates products (Momos, Fries, Parathas, VIP Pass), categories, pricing | `docker compose exec ecom_app php seed_mailee.php` |
| `create_mailee_pages.php` | Creates CMS pages (About Us, Contact Us, Media & Press, Privacy Policy) | `docker compose exec ecom_app php create_mailee_pages.php` |
| `setup_menus_and_sections.php` | Builds primary navigation, footers, and homepage feature sliders | `docker compose exec ecom_app php setup_menus_and_sections.php` |
| `attach_category_photos.php` | Binds generated media assets to catalog categories | `docker compose exec ecom_app php attach_category_photos.php` |
| `update_banners.php` | Configures homepage promotional banner sections | `docker compose exec ecom_app php update_banners.php` |

---

## 🔒 Permissions & Storage Rules

> [!IMPORTANT]
> **Critical Permission Constraint**: FleetCart and Laravel Flysystem require `storage/` and `bootstrap/cache/` directories to have explicit `www-data` ownership and write access inside the PHP-FPM container.

If permissions become restricted, web requests will throw `500 Server Error` or Flysystem visibility exceptions.

### Permission Fix Command
Whenever you update code or pull fresh git changes, always run:
```bash
sudo chown -R www-data:www-data storage bootstrap/cache
sudo chmod -R 777 storage bootstrap/cache
```
*(This command is automatically executed inside `docker/entrypoint.sh` and `deploy.sh`.)*

---

## 🌐 Nginx, Cloudflare & Domain Setup

- **Domain**: `onlinemailee.in` / `www.onlinemailee.in`
- **Server IP**: `103.82.158.106`
- **Internal Web Port**: `8085`

### Nginx Proxy Manager Setup
1. Proxy Host Destination: `http://103.82.158.106:8085` or container hostname `ecom_web:80`.
2. Enable **Websockets Support** & **Block Common Exploits**.
3. SSL: Cloudflare Origin Certificate / Let's Encrypt with HTTP-to-HTTPS redirect.

### Cloudflare DNS Configuration
- `onlinemailee.in` -> A record -> `103.82.158.106` (Proxied)
- `www.onlinemailee.in` -> CNAME record -> `onlinemailee.in` (Proxied)

---

## 🔄 CI/CD & Automated Deployments

Automated deployment is configured via **GitHub Actions** in [.github/workflows/ci-cd.yml](.github/workflows/ci-cd.yml).

### Workflow Triggers
- **Push to `main`**: Runs syntax checks and automatically triggers SSH deployment to the production server.
- **Pull Request to `main`**: Runs PHP syntax validation without modifying production.

### Required GitHub Secrets
Configure these in GitHub -> **Settings** -> **Secrets and variables** -> **Actions**:

1. `SERVER_HOST`: `103.82.158.106`
2. `SERVER_USER`: `rds2197`
3. `SERVER_SSH_KEY`: The SSH private key corresponding to `~/.ssh/authorized_keys` on the server.

### Manual One-Click Deployment
To deploy manually on the server:
```bash
cd /home/rds2197/ecom
./deploy.sh
```

---

## 🛠️ Maintenance & Troubleshooting Guide

### 1. Clear Application & View Cache
If changes to templates, config, or routes do not appear immediately on the website:
```bash
docker compose exec ecom_app php artisan config:clear
docker compose exec ecom_app php artisan cache:clear
docker compose exec ecom_app php artisan view:clear
```

### 2. View Application Logs
To inspect real-time Laravel errors:
```bash
docker compose exec ecom_app tail -f storage/logs/laravel.log
```

To view Docker service logs:
```bash
docker compose logs -f ecom_app
docker compose logs -f ecom_web
docker compose logs -f fleetcart_db
```

### 3. Restart All Services
```bash
docker compose down && docker compose up -d
```

### 4. Database Dump & Backup
To create an emergency backup of the production database:
```bash
docker compose exec fleetcart_db mysqldump -ufleetcart_user -pfleetcart_password fleetcart_db > mailee_db_backup_$(date +%Y%m%d_%H%M%S).sql
```

To restore from a backup:
```bash
docker compose exec -T fleetcart_db mysql -ufleetcart_user -pfleetcart_password fleetcart_db < mailee_db_backup.sql
```

---

*Maintained by the Mailee Engineering Team.*
