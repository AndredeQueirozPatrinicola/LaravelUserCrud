FROM php:8.1
RUN apt-get update -y && apt-get install -y openssl zip unzip git libonig-dev
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install mysqli pdo mbstring
WORKDIR /app
COPY . /app
RUN composer install
EXPOSE 8000