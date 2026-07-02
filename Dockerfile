FROM teddysun/xray:latest

# Copy file config vào container
COPY config.json /etc/xray/config.json

# Đổi toàn bộ các chữ ảo thành Biến môi trường
ENTRYPOINT ["/bin/sh", "-c", "sed -i \"s/SECRET_USER_PLACEHOLDER/$PROXY_USER/g; s/SECRET_PASSWORD_PLACEHOLDER/$PROXY_PASS/g\" /etc/xray/config.json && /usr/bin/xray run -config /etc/xray/config.json"]
