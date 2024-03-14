#!/bin/bash

# Перемещаемся в каталог fifa
# shellcheck disable=SC2164
cd /var/www/fifa

# Запускаем php init и передаем ввод сразу, чтобы выбрать Development режим и ответить на вопрос инициализации
echo -e "0\nyes" | php init 0 --interactive=0

# Устанавливаем composer зависимости
composer install

# Запускаем php-fpm
exec php-fpm
