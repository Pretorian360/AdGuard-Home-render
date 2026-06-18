FROM adguard/adguardhome:latest

# Portas padrão
EXPOSE 53/tcp 53/udp 80/tcp 443/tcp

# Health check para o Render
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:80/ || exit 1

# Inicia o AdGuard Home
CMD ["/opt/adguardhome/AdGuardHome", "-s", "run", "--no-check-update"]
