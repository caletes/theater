include(`../../add-me-user.inc.m4')

# Allow nginx to run with 'me' user
RUN chown -R me:me /var/cache/nginx
