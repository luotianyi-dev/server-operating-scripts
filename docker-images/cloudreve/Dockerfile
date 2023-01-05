FROM debian:11-slim
RUN apt update && apt install -y tzdata ca-certificates curl
COPY cloudreve /cloudreve
CMD ["/cloudreve", "-c", "/config/cloudreve.ini"]

