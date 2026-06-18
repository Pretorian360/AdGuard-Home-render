FROM ghcr.io/linuxserver/adguardhome:latest

# Define variáveis
ENV PUID=1000 \
    PGID=1000 \
    TZ=America/Sao_Paulo \
    WEB_PORT=8080

# Portas
EXPOSE 8080/tcp 53/udp 53/tcp

# Healthcheck simplificado
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
  CMD wget -qO- http://localhost:8080/ || exit 1

CMD ["/init"]
