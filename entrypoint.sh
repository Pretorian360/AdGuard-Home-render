#!/bin/sh
set -e

echo "Iniciando AdGuard Home no Render..."

# Tenta executar com permissões diferentes
exec /opt/adguardhome/AdGuardHome -s run --bind-port 8080 --no-check-update
