FROM adguard/adguardhome:latest

# Define variáveis de ambiente
ENV BIND_PORT=8080 \
    BIND_HOST=0.0.0.0 \
    ADGUARD_HOME_LOG_LEVEL=info

# Portas
EXPOSE 8080/tcp 53/udp 53/tcp

# Healthcheck com timeout maior
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD wget -qO- http://localhost:8080/ || exit 1

# Comando simplificado
CMD ["/opt/adguardhome/AdGuardHome", "-s", "run", "--bind-port", "8080", "--no-check-update"]
