# Utiliser une image PHP avec FPM (FastCGI Process Manager)
FROM php:8.1-fpm

# Installer les dépendances pour les extensions PHP et Composer
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev git unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd

# Copier Composer depuis l'image officielle Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copier tout le code dans le répertoire de travail
COPY . /var/www/html/

# Définir le répertoire de travail
WORKDIR /var/www/html

# Installer les dépendances PHP via Composer
RUN composer install --no-interaction --prefer-dist

# Exposer le port 9000 pour PHP-FPM
EXPOSE 9000

CMD ["php-fpm"]
