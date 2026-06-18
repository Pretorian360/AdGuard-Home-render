FROM adguard/adguardhome:latest

# Expoe portas padrão
EXPOSE 53/tcp 53/udp 80/tcp 443/tcp 784/udp 853/tcp 8853/udp 5443/tcp

# Diretório de dados persistente
VOLUME ["/opt/adguardhome/conf", "/opt/adguardhome/work"]

CMD ["/opt/adguardhome/AdGuardHome", "-s", "run", "--no-check-update"]
