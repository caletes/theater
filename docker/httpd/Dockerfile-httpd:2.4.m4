FROM httpd:2.4

include(`../add-me-user.inc.m4')

# Allow apache to run with 'me' user
RUN chown -R me:me /usr/local/apache2
