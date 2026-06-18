#!/bin/bash
set -e

echo "🚀 Forçando configuração do Pi-hole..."

# Remove o arquivo antigo se existir
rm -f /etc/pihole/setupVars.conf

# Cria o arquivo com a senha correta
cat > /etc/pihole/setupVars.conf << EOF
WEBPASSWORD=${WEBPASSWORD:-admin123}
PIHOLE_DNS_1=1.1.1.1
PIHOLE_DNS_2=8.8.8.8
DNSMASQ_LISTENING=all
EOF

# Mostra a senha configurada (para debug)
echo "✅ Senha configurada: ${WEBPASSWORD:-admin123}"

# Inicia o Pi-hole
exec /usr/local/bin/pihole start
