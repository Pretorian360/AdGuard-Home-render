FROM adguard/adguardhome:latest

# Expõe as portas necessárias
EXPOSE 8080/tcp 53/udp 53/tcp

# Comando de inicialização simples, sem healthcheck
CMD ["/opt/adguardhome/AdGuardHome", "-s", "run", "--bind-port", "8080", "--no-check-update"]
