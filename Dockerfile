FROM adguard/adguardhome:edge

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 8080/tcp 53/udp 53/tcp

ENTRYPOINT ["/entrypoint.sh"]
