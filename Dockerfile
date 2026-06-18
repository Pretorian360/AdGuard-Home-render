FROM adguard/adguardhome:latest

# Portas
EXPOSE 53/tcp 53/udp 80/tcp 443/tcp

# Healthcheck
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:80/ || exit 1

# Executa como root (necessário para porta 53)
USER root

# Configura permissões e inicia
CMD ["sh", "-c", "chown -R root:root /opt/adguardhome && /opt/adguardhome/AdGuardHome -s run --no-check-update"]
