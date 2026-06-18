FROM pihole/pihole:latest

# Configurações do Pi-hole
ENV TZ=America/Sao_Paulo \
    WEB_PORT=8080 \
    PIHOLE_DNS_=1.1.1.1;8.8.8.8 \
    WEBPASSWORD=admin123 \
    DNSMASQ_LISTENING=all

# Portas
EXPOSE 8080/tcp 53/udp 53/tcp

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD wget -qO- http://localhost:8080/admin/ || exit 1

# Entrypoint do Pi-hole
CMD ["/usr/local/bin/pihole", "start"]
