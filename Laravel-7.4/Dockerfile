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
	  php-mbstring php-xml php-fpm php-zip php-common php-fpm php-cli unzip curl php-curl php-mysql mysql-client nginx wget \
	&& curl -s https://getcomposer.org/installer | php \
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
	&& update-rc.d php7.4-fpm defaults \ 
	&& update-rc.d nginx enable \
	&& update-rc.d php7.4-fpm enable \
	&& rm -rf /etc/nginx/sites-enabled/default \
	&& sed -i "s|post_max_size = 8M|post_max_size = 128M |g" /etc/php/7.4/fpm/php.ini \
	&& sed -i "s|upload_max_filesize = 2M|upload_max_filesize = 100M |g" /etc/php/7.4/fpm/php.ini

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && apt update && apt install -y ./google-chrome-stable_current_amd64.deb

COPY entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh
	
VOLUME ["/etc/nginx/sites-available", "/var/www", "/var/log/nginx"]

ENTRYPOINT ["entrypoint.sh"]

CMD ["sh"]


EXPOSE 80
EXPOSE 443