#!/bin/bash
set -e

echo "🚀 Starting Mailee E-commerce Deployment..."

# Navigate to project directory
CD_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$CD_DIR"

# Pull latest code if in a git repo
if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "📦 Pulling latest changes from git..."
    git pull origin main || true
fi

# Ensure correct permissions on storage and bootstrap/cache
echo "🔐 Setting permissions..."
mkdir -p storage/framework/{sessions,views,cache} storage/logs bootstrap/cache
chmod -R 777 storage bootstrap/cache || true

# Ensure containers are running
echo "🐳 Rebuilding and starting Docker services..."
docker compose up -d --build
docker compose exec -T ecom_web nginx -s reload || true

# Fix container permissions as root
docker compose exec -u 0 -T ecom_app chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache || true
docker compose exec -u 0 -T ecom_app chmod -R 777 /var/www/html/storage /var/www/html/bootstrap/cache || true

# Run Laravel optimizations inside container as www-data user
echo "⚡ Running Laravel optimizations..."
docker compose exec -u www-data -T ecom_app php artisan config:clear || true
docker compose exec -u www-data -T ecom_app php artisan cache:clear || true
docker compose exec -u www-data -T ecom_app php artisan view:clear || true

echo "🎉 Deployment finished successfully! Site active at https://onlinemailee.in"
