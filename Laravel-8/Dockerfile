FROM ubuntu:hirsute

ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
      nano \
      git \
      unzip \
      libicu-dev \
      zlib1g-dev \
      libxml2 \
      libxml2-dev \
      libreadline-dev \
      supervisor \
      cron \
      sudo \
      libzip-dev \
	  php8.0-mbstring php8.0-xml php8.0-fpm php8.0-zip php8.0-common php8.0-fpm php8.0-cli unzip curl php8.0-curl php8.0-mysql mysql-client nginx \
	&& curl -s https://getcomposer.org/installer | php8.0 \
	&& mv composer.phar /usr/local/bin/composer \
    && rm -rf /var/www/html \
    && chmod -R 755 /var/www \
    && chown -R www-data:www-data /var/www \
    && ln -s /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/ \
    && rm -rf /tmp/* \
    && rm -rf /var/list/apt/* \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
	&& update-rc.d nginx defaults \
	&& update-rc.d php8.0-fpm defaults \ 
	&& update-rc.d nginx enable \
	&& update-rc.d php8.0-fpm enable \
	&& rm -rf /etc/nginx/sites-enabled/default \
	&& sed -i "s|post_max_size = 8M|post_max_size = 128M |g" /etc/php/8.0/fpm/php.ini \
	&& sed -i "s|upload_max_filesize = 2M|upload_max_filesize = 100M |g" /etc/php/8.0/fpm/php.ini


COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh
	
VOLUME ["/etc/nginx/sites-available", "/var/www", "/var/log/nginx"]

ENTRYPOINT ["entrypoint.sh"]

CMD ["sh"]

EXPOSE 80
EXPOSE 443