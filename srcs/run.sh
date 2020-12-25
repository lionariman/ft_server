# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    run.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: keuclide <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/25 06:05:15 by keuclide          #+#    #+#              #
#    Updated: 2020/12/25 06:05:19 by keuclide         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!bin/bash/

service mysql start
mariadb < /etc/nginx/sql/lion.sql
service nginx start
service php7.3-fpm start

bash