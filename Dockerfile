FROM php:8.2-fpm

# Copy composer.lock and composer.json
# COPY composer.lock composer.json /var/www/

# ARG user
# ARG uid

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    libonig-dev \
    libzip-dev \
    libgd-dev \
    libicu-dev

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
#Mine

# Install extensions
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl
RUN docker-php-ext-configure gd --with-external-gd
RUN docker-php-ext-install gd

# RUN docker-php-ext-configure intl --with-external-intl
RUN docker-php-ext-install intl


# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add user for laravel application
# RUN groupadd -g 1000 www
# RUN useradd -u 1000 -ms /bin/bash -g www www

# Create system user to run Composer and Artisan Commands
# RUN useradd -G www-data,root -u $uid -d /home/$user $user
# RUN mkdir -p /home/$user/.composer && \
#     chown -R $user:$user /home/$user

# Copy existing application directory contents
COPY ./callerpro /var/www

# Copy existing application directory permissions
# COPY --chown=www-data:www-data ./callerpro /var/www
RUN chmod -R 777 /var/www/storage
RUN chown -R root:root /var/www

# Change current user to www
# USER $user

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]

# COPY ./devops-scripts/start.sh /start.sh

# CMD ["/start.sh"]