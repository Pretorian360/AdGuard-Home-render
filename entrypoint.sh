#!/bin/bash
set -e

echo "🚀 Iniciando Pi-hole no Render..."

# Verifica se o Pi-hole já está configurado
if [ ! -f /etc/pihole/setupVars.conf ]; then
    echo "📝 Primeira execução - Configurando Pi-hole..."
    
    # Aguarda o Pi-hole iniciar
    sleep 5
    
    # Define a senha
    if [ -n "$WEBPASSWORD" ]; then
        echo "🔑 Definindo senha do Pi-hole..."
        pihole -a -p "$WEBPASSWORD" || echo "⚠️ Senha já definida ou erro ao definir"
    fi
    
    # Marca que já foi configurado
    touch /etc/pihole/.configured
fi

# Inicia o Pi-hole
exec /usr/local/bin/pihole start
