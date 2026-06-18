#!/bin/bash
set -e

echo "🚀 Iniciando Pi-hole no Render..."

# Remove arquivos antigos que podem estar corrompidos
rm -rf /etc/pihole/*.db
rm -rf /etc/pihole/*.conf
rm -rf /etc/lighttpd/conf-enabled/*

# Cria diretórios necessários
mkdir -p /etc/pihole
mkdir -p /var/www/html/admin

# Cria o arquivo de configuração
cat > /etc/pihole/setupVars.conf << EOF
WEBPASSWORD=${WEBPASSWORD:-admin123}
PIHOLE_DNS_1=1.1.1.1
PIHOLE_DNS_2=8.8.8.8
DNSMASQ_LISTENING=all
EOF

echo "✅ Senha configurada: ${WEBPASSWORD:-admin123}"

# Força a reinstalação da interface web
echo "🔧 Reinstalando interface web..."
pihole checkout web master || echo "⚠️ Não foi possível reinstalar a interface"

# Inicia o Pi-hole
exec /usr/local/bin/pihole start
