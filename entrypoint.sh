#!/bin/bash
set -e

echo "🚀 Resetando configuração do Pi-hole..."

# Para o Pi-hole se estiver rodando
pkill -f pihole-FTL || true

# Remove TODOS os arquivos de configuração e banco de dados
rm -rf /etc/pihole/*.db
rm -rf /etc/pihole/*.conf
rm -rf /etc/pihole/setupVars.conf
rm -rf /etc/pihole/pihole-FTL.db

# Cria o arquivo de configuração com a senha
cat > /etc/pihole/setupVars.conf << EOF
WEBPASSWORD=${WEBPASSWORD:-admin123}
PIHOLE_DNS_1=1.1.1.1
PIHOLE_DNS_2=8.8.8.8
DNSMASQ_LISTENING=all
EOF

echo "✅ Arquivo de configuração criado com senha: ${WEBPASSWORD:-admin123}"

# Inicia o Pi-hole
exec /usr/local/bin/pihole start
