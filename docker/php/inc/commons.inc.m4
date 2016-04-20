RUN apt-get update

include(`../../add-me-user.inc.m4')

# Create home for 'me' user for composer caches
RUN mkdir /home/me && chown me:me /home/me

WORKDIR /var/www

include(`install-composer.inc.m4')
include(`install-nodejs.inc.m4')
include(`install-bower.inc.m4')
include(`install-gruntcli.inc.m4')
