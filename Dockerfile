FROM adguard/adguardhome:latest

# Mantém tudo padrão
EXPOSE 80/tcp 443/tcp

# Healthcheck na interface web
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD wget -qO- http://localhost:80/ || exit 1

# Comando padrão
CMD ["/opt/adguardhome/AdGuardHome", "-s", "run"]
