WORKDIR /var/www

# zlib1g package and zip php extension is for composer
# git is for bower
RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    git-core

RUN docker-php-ext-install \
    zip


# Create 'me' group whith gid 1000 and 'me' user in this group with uid 1000
RUN groupadd -f -g 1000 me && useradd -u 1000 -g me me

# Create home for 'me' user for composer caches
RUN mkdir /home/me && chown me:me /home/me

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_5.x | /bin/bash -
RUN apt-get install -y nodejs

# Install Bower
RUN npm install -g bower

# Install Grunt
RUN npm install -g grunt-cli
