FROM alpine:latest

RUN apk -U add --no-cache wget
RUN wget https://github.com/fatedier/frp/releases/download/v0.37.0/frp_0.37.0_linux_amd64.tar.gz --no-check-certificate
RUN tar -xzvf frp_0.37.0_linux_amd64.tar.gz

RUN cp frp_0.37.0_linux_amd64/frpc /usr/bin/

RUN chmod +x /usr/bin/frpc && \
        mkdir /etc/frp

CMD ["/usr/bin/frpc", "-c", "/etc/frp/frpc.ini"]
