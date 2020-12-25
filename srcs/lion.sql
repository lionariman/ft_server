# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    lion.sql                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: keuclide <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/25 06:05:12 by keuclide          #+#    #+#              #
#    Updated: 2020/12/25 09:31:00 by keuclide         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CREATE DATABASE lion_db;
GRANT ALL ON lion_db.* TO 'lion'@'localhost' IDENTIFIED BY '123' WITH GRANT OPTION;
FLUSH PRIVILEGES;