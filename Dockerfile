FROM adguard/adguardhome:latest

# Adiciona capacidades necessárias
RUN apk add --no-cache libcap && \
    setcap 'cap_net_bind_service=+ep' /opt/adguardhome/AdGuardHome

# Portas
EXPOSE 53/tcp 53/udp 80/tcp 443/tcp

# Healthcheck
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:80/ || exit 1

# Executa como root para ter permissões
USER root
CMD ["/opt/adguardhome/AdGuardHome", "-s", "run", "--no-check-update"]
