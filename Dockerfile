FROM pihole/pihole:latest

# Configurações
ENV TZ=America/Sao_Paulo \
    WEB_PORT=80 \
    PIHOLE_DNS_=1.1.1.1;8.8.8.8 \
    WEBPASSWORD=admin123 \
    DNSMASQ_LISTENING=all \
    DNSMASQ_USER=root

# Cria o arquivo de configuração ANTES de iniciar
RUN mkdir -p /etc/pihole && \
    echo "WEBPASSWORD=$WEBPASSWORD" > /etc/pihole/setupVars.conf && \
    echo "PIHOLE_DNS_1=1.1.1.1" >> /etc/pihole/setupVars.conf && \
    echo "PIHOLE_DNS_2=8.8.8.8" >> /etc/pihole/setupVars.conf && \
    echo "DNSMASQ_LISTENING=all" >> /etc/pihole/setupVars.conf

# Portas
EXPOSE 80/tcp 443/tcp 53/udp 53/tcp

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD wget -qO- http://localhost:80/admin/ || exit 1

# Comando padrão
CMD ["/usr/local/bin/pihole", "start"]
