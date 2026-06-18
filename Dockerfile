FROM pihole/pihole:latest

# Configurações via variáveis de ambiente
ENV TZ=America/Sao_Paulo \
    WEB_PORT=80 \
    PIHOLE_DNS_=1.1.1.1;8.8.8.8 \
    WEBPASSWORD=admin123 \
    DNSMASQ_LISTENING=all \
    DNSMASQ_USER=root

# Portas
EXPOSE 80/tcp 443/tcp 53/udp 53/tcp

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD wget -qO- http://localhost:80/admin/ || exit 1

# Comando padrão do Pi-hole
CMD ["/usr/local/bin/pihole", "start"]
