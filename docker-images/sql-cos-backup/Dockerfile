FROM alpine:3.15
COPY exec /exec-continer
RUN apk update && apk add --no-cache curl mariadb-client && \
	chmod +x /exec-continer/* && \
	cp /exec-continer/coscli-linux-amd64 /usr/local/bin/coscli && cp /exec-continer/backup.sh /backup.sh
CMD ["/backup.sh"]

