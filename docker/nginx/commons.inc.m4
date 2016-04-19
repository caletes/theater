# Create 'me' group whith gid 1000 and 'me' user in this group with uid 1000
RUN groupadd -f -g 1000 me && useradd -u 1000 -g me me

# Allow nginx to run with 'me' user
RUN chown -R me:me /var/cache/nginx
