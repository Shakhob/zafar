FROM php:8.1-fpm

RUN apt-get update \
    && apt-get install -y curl git zip libpq-dev \
    && docker-php-ext-install pdo pdo_mysql pdo_pgsql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www

# Устанавливаем пользователю www-data UID и GID равные 1000
RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

# Копируем скрипт в контейнер
COPY init.sh /usr/local/bin/init.sh

# Даем права на выполнение скрипта
RUN chmod +x /usr/local/bin/init.sh

# Используем скрипт как точку входа в контейнер
ENTRYPOINT ["/usr/local/bin/init.sh"]
