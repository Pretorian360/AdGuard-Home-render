#!/bin/bash
set -e

echo "🚀 Configurando Pi-hole..."

# Aguarda o Pi-hole iniciar
/usr/local/bin/pihole start &

# Aguarda alguns segundos para o serviço iniciar
sleep 15

# Define a senha via comando
echo "🔑 Definindo senha via comando pihole..."
echo "${WEBPASSWORD:-admin123}" | pihole -a -p || echo "⚠️ Comando falhou, continuando..."

# Mantém o container rodando
wait
