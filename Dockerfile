# Use the official PHP image with Apache
FROM php:7.3-apache
ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# Install system dependencies
RUN apt-get update
RUN apt-get install -y \
  git \
  curl \
  zip \
  unzip \
  libzip-dev \
  libpng-dev \
  libjpeg-dev \
  libfreetype6-dev \
  libonig-dev \
  libssl-dev
RUN docker-php-ext-install pdo_mysql mbstring zip gd
RUN install-php-extensions gd xdebug

# Install Bun (JavaScript/TypeScript runtime)
RUN curl -fsSL https://bun.sh/install | bash

# Add Bun to the system PATH
ENV BUN_INSTALL="/root/.bun"
ENV PATH="${BUN_INSTALL}/bin:${PATH}"

# Enable mod_rewrite for URL rewriting if needed
RUN a2enmod rewrite

# Copy custom Apache configuration file
COPY demo.apache.conf /etc/apache2/sites-available/000-default.conf
COPY docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/

# Set working directory
WORKDIR /var/www/html

# Install Composer (PHP dependency manager)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy existing application directory contents
COPY ./src /var/www/html

# Ensure the apache user owns the files
RUN chown -R www-data:www-data /var/www/html

# Expose port 80 to the outside world
EXPOSE 80

# Start Apache server in the foreground
CMD ["apache2-foreground"]