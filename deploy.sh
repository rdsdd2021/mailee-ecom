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
sudo chown -R www-data:www-data storage bootstrap/cache || chown -R www-data:www-data storage bootstrap/cache || true
sudo chmod -R 777 storage bootstrap/cache || chmod -R 777 storage bootstrap/cache || true

# Ensure containers are running
echo "🐳 Rebuilding and starting Docker services..."
docker compose up -d --build

# Run Laravel optimizations inside container
echo "⚡ Running Laravel optimizations..."
docker compose exec -T ecom_app php artisan config:clear || true
docker compose exec -T ecom_app php artisan cache:clear || true
docker compose exec -T ecom_app php artisan view:clear || true

echo "🎉 Deployment finished successfully! Site active at https://onlinemailee.in"
