FROM alpine:3.15
COPY entryport.sh /entryport.sh
RUN apk update && apk add nginx curl php7-fpm php7-opcache \
	php7-exif php7-soap php7-openssl php7-gmp php7-intl php7-sodium php7-json php7-dom php7-zip php7-apcu \
	php7-bcmath php7-gd php7-gettext php7-bz2 php7-iconv php7-curl php7-ctype php7-mbstring php7-tokenizer \
	php7-simplexml php7-xmlreader php7-xmlwriter php7-xml php7-fileinfo php7-session \
	php7-pdo php7-mysqli php7-sqlite3 php7-pdo_mysql php7-pdo_sqlite \
	php7-pecl-igbinary php7-pecl-mcrypt php7-pecl-imagick php7-sockets && \
	ln -s /etc/php7 /etc/php && \
	ln -s /usr/sbin/php-fpm7 /bin/php-fpm && \
	ln -s /usr/lib/php7 /usr/lib/php && \
	chmod +x /entryport.sh
CMD /entryport.sh
EXPOSE 80

