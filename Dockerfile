FROM teddysun/xray:latest

# Copy file config chứa các "chữ ảo" (Placeholders) vào container
COPY config.json /etc/xray/config.json

# Viết đè lại lệnh khởi động (ENTRYPOINT) của container
# Nó sẽ chạy lệnh sed để đổi chữ ảo thành Biến Môi Trường (Variables), sau đó mới gọi Xray chạy.
ENTRYPOINT ["/bin/sh", "-c", "sed -i \"s/SECRET_UUID_PLACEHOLDER/$UUID/g; s/SECRET_HOST_PLACEHOLDER/$HOST/g; s/SECRET_PASSWORD_PLACEHOLDER/$PROXY_PASS/g\" /etc/xray/config.json && /usr/bin/xray run -config /etc/xray/config.json"]
