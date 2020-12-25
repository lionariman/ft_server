# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: keuclide <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/20 17:16:52 by keuclide          #+#    #+#              #
#    Updated: 2020/12/25 12:00:46 by keuclide         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && \
    apt-get install -y wget nginx vim mariadb-server \
    php7.3 php-mysql php-fpm php-pdo php-gd php-cli php-mbstring

WORKDIR /var/www/

RUN wget https://wordpress.org/latest.tar.gz && \
    wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz && \
    tar -xvf phpMyAdmin-5.0.4-english.tar.gz && tar -xvf latest.tar.gz && \
    rm -rf phpMyAdmin-5.0.4-english.tar.gz latest.tar.gz && \
    mv phpMyAdmin-5.0.4-english phpmyadmin && \
    mkdir /var/www/phpmyadmin/tmp && chmod 777 /var/www/phpmyadmin/tmp

WORKDIR /etc/nginx/ssl/

RUN openssl req -newkey rsa:4096 -x509 -sha256 \
    -days 1 -nodes -out crt.crt -keyout key.key \
    -subj "/C=RU/ST=Tatarstan/L=Kazan/O=Ecole 42/OU=Ignis/CN=localhost"

COPY srcs/wp-config.php /var/www/wordpress/
COPY srcs/config.inc.php /var/www/phpmyadmin/
COPY srcs/nginx.conf /etc/nginx/sites-available/
COPY srcs/lion.sql /etc/nginx/sql/
COPY srcs/run.sh /

WORKDIR /

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled

CMD bash run.sh