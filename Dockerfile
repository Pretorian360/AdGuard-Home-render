FROM adguard/adguardhome:edge

# Portas
EXPOSE 8080/tcp 53/udp 53/tcp

# Define variáveis de ambiente
ENV BIND_PORT=8080 \
    BIND_HOST=0.0.0.0

# Comando simplificado
CMD ["--bind-port", "8080", "--no-check-update"]
