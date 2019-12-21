FROM debian:stable-slim
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && apt-get upgrade -y && \
 DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends isc-dhcp-relay && \
apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 67/udp
ENTRYPOINT ["dhcrelay", "-d"]
CMD ["--help"]