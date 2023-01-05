FROM alpine:3.15
COPY src /lugo
WORKDIR /lugo
RUN apk update && \
	apk add --no-cache python3 curl py-pip && \
	pip3 install -r requirements.txt && \
	mkdir -p /config && \
	cp -v config.toml /config/config.toml
ENV CONFIG_FILE=/config/config.toml
CMD ["/lugo/run.sh"]
EXPOSE 80
