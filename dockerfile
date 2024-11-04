# Dockerfile
FROM php:8.1-fpm

# Install dependencies
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev unzip git
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd pdo pdo_mysql

# Set working directory
WORKDIR /var/www

# Copy project files
COPY ./laravel-app /var/www

# # Install Composer
# COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
# RUN composer install

# Expose port
EXPOSE 9000

CMD ["php-fpm"]