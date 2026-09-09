# 🥟 Mailee Frozen Foods - E-Commerce Platform

Official web application repository for **Mailee Frozen Foods**, delivering authentic Himalayan frozen momos, french fries, spring rolls, flaky parathas, and VIP passes across Siliguri, Darjeeling, Jalpaiguri, and North Bengal.

🌐 **Live Website**: [https://onlinemailee.in](https://onlinemailee.in)

---

## 🛠️ Technology Stack & Architecture

- **Backend / Core**: PHP 8.2, Laravel 11, FleetCart v4.7.2
- **Database**: MariaDB 10.6
- **Web Server**: Nginx + FPM containerized architecture
- **Reverse Proxy**: Nginx Proxy Manager with SSL termination (Cloudflare DNS)
- **CI/CD**: GitHub Actions (Syntax validation + automated zero-downtime SSH deployment)

---

## 🚀 Deployment & Operations

### Single-Command Deployment
To manually trigger a deployment on the production server:
```bash
./deploy.sh
```

### Docker Containers
- `ecom_app`: PHP 8.2-FPM container running FleetCart application code.
- `ecom_web`: Nginx web server container serving assets and proxying requests to `ecom_app`.
- `fleetcart_db`: MariaDB 10.6 container storing products, categories, pages, and order details.

---

## 🔄 CI/CD Pipeline Configuration

Automated CI/CD is powered by **GitHub Actions** ([.github/workflows/ci-cd.yml](.github/workflows/ci-cd.yml)):
- **Syntax Check**: Validates PHP syntax across all custom modules on Pull Requests & pushes.
- **SSH Deployment**: Deploys latest changes to production server automatically when pushed to the `main` branch.
