FROM adguard/adguardhome:latest

# O Render já injeta as variáveis do .env
# Não precisa definir ENV aqui, elas virão do ambiente

# Portas
EXPOSE 53/tcp 53/udp 80/tcp 443/tcp

# Volumes (usando as variáveis do .env)
VOLUME ["${ADGUARD_HOME_CONF_DIR}", "${ADGUARD_HOME_WORK_DIR}"]

# Healthcheck
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:${BIND_PORT:-80}/ || exit 1

# Script de entrada que usa as ENVs
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
