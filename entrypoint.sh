#!/bin/bash
set -e

echo "🚀 Iniciando Pi-hole no Render..."

# Cria o diretório de configuração
mkdir -p /etc/pihole

# Cria o arquivo de configuração com a senha
cat > /etc/pihole/setupVars.conf << EOF
WEBPASSWORD=${WEBPASSWORD:-admin123}
PIHOLE_DNS_1=1.1.1.1
PIHOLE_DNS_2=8.8.8.8
DNSMASQ_LISTENING=all
EOF

echo "✅ Configuração criada com senha: ${WEBPASSWORD:-admin123}"

# Inicia o Pi-hole
exec /usr/local/bin/pihole start
