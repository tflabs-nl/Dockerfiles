FROM ubuntu:hirsute

ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

COPY postfix-prepare.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/postfix-prepare.sh
RUN /bin/bash /usr/local/bin/postfix-prepare.sh
RUN rm -rf /usr/local/bin/postfix-prepare.sh

RUN groupadd -g 5000 vmail
RUN useradd -m -d /var/vmail -s /bin/false -u 5000 -g vmail vmail

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
postfix postfix-mysql postfix-doc mariadb-client openssl rkhunter binutils dovecot-imapd dovecot-pop3d dovecot-mysql dovecot-sieve patch nano dovecot-lmtpd cron

###COPY CRONJOB TO CORRECT LOCATION

COPY root.cron /var/spool/cron/crontabs/root

###CREATE CONFIG MAPS FOR ALL THE postfix/mysql-* files

COPY postfix/main.cf /etc/postfix/main.cf
COPY postfix/master.cf /etc/postfix/master.cf
COPY postfix/dynamicmaps.cf /etc/postfix/dynamicmaps.cf
COPY postfix/postfix-files.d/mysql.files /etc/postfix/postfix-files.d/mysql.files

###CREATE CONFIG MAP dovecot/dovecot-sql.conf.ext

COPY dovecot/dovecot.conf /etc/dovecot/dovecot.conf
COPY dovecot/dovecot-dict-auth.conf.ext /etc/dovecot/dovecot-dict-auth.conf.ext
COPY dovecot/dovecot-dict-sql.conf.ext /etc/dovecot/dovecot-dict-sql.conf.ext
COPY dovecot/conf.d /etc/dovecot/conf.d


VOLUME ["/var/ssl", "/etc/postfix/configs", "/var/vmail"]	

###ENTRYPOINT ["/bin/bash"]

ENTRYPOINT ["entrypoint.sh"]

CMD ["sh"]