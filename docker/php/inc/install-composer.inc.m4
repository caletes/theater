# Install composer

# zlib1g package is for zip php extension
RUN apt-get install -y \
    zlib1g-dev
# zip php extension is for composer
RUN docker-php-ext-install \
    zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
