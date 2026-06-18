FROM pihole/pihole:latest

# Configurações
ENV TZ=America/Sao_Paulo \
    WEB_PORT=80 \
    PIHOLE_DNS_=1.1.1.1;8.8.8.8 \
    WEBPASSWORD=admin123 \
    DNSMASQ_LISTENING=all \
    DNSMASQ_USER=root

# Copia o entrypoint customizado
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Portas
EXPOSE 80/tcp 443/tcp 53/udp 53/tcp

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD wget -qO- http://localhost:80/admin/ || exit 1

# Usa o entrypoint customizado
ENTRYPOINT ["/entrypoint.sh"]
