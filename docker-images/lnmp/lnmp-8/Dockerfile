FROM alpine:3.15
COPY entryport.sh /entryport.sh
RUN apk update && apk add nginx curl php8-fpm php8-opcache \
	php8-exif php8-soap php8-openssl php8-gmp php8-intl php8-sodium php8-json php8-dom php8-zip php8-apcu \
	php8-bcmath php8-gd php8-gettext php8-bz2 php8-iconv php8-curl php8-ctype php8-mbstring php8-tokenizer \
	php8-simplexml php8-xmlreader php8-xmlwriter php8-xml php8-fileinfo php8-session \
	php8-pdo php8-mysqli php8-sqlite3 php8-pdo_mysql php8-pdo_sqlite \
	php8-pecl-igbinary php8-pecl-mcrypt php8-pecl-imagick php8-sockets && \
	ln -s /etc/php8 /etc/php && \
	ln -s /usr/sbin/php-fpm8 /bin/php-fpm && \
	ln -s /usr/lib/php8 /usr/lib/php && \
	chmod +x /entryport.sh
CMD /entryport.sh
EXPOSE 80

