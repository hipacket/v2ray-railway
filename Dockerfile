FROM teddysun/xray:latest

# Copy config vào đúng đường dẫn
COPY config.json /etc/xray/config.json

CMD ["xray", "run", "-c", "/etc/xray/config.json"]