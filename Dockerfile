FROM adguard/adguardhome:latest

# Portas
EXPOSE 53/tcp 53/udp 80/tcp 443/tcp

# Volumes com caminhos fixos (não use variáveis aqui)
VOLUME ["/opt/adguardhome/conf", "/opt/adguardhome/work"]

# Healthcheck
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:80/ || exit 1

# Use variáveis apenas no CMD
CMD ["/opt/adguardhome/AdGuardHome", "-s", "run", "--no-check-update"]
