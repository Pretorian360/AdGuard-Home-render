#!/bin/bash
set -e

# Verifica se é a primeira execução
if [ ! -f /etc/pihole/setupVars.conf ]; then
    echo "📝 Primeira execução - Configurando Pi-hole..."
    
    # Define a senha
    if [ -n "$WEBPASSWORD" ]; then
        pihole -a -p "$WEBPASSWORD"
    else
        # Senha padrão se não definida
        pihole -a -p admin123
    fi
    
    # Marca que já foi configurado
    touch /etc/pihole/.configured
fi

# Inicia o Pi-hole
exec /usr/local/bin/pihole start
