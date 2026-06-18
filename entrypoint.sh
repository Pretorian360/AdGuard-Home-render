#!/bin/bash
set -e

echo "🚀 Forçando configuração do Pi-hole..."

# Força a senha a cada inicialização
echo "WEBPASSWORD=$WEBPASSWORD" > /etc/pihole/setupVars.conf
echo "PIHOLE_DNS_1=1.1.1.1" >> /etc/pihole/setupVars.conf
echo "PIHOLE_DNS_2=8.8.8.8" >> /etc/pihole/setupVars.conf
echo "DNSMASQ_LISTENING=all" >> /etc/pihole/setupVars.conf

# Inicia o Pi-hole
exec /usr/local/bin/pihole start
