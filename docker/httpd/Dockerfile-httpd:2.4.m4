FROM httpd:2.4

# Create 'me' group whith gid 1000 and 'me' user in this group with uid 1000
RUN groupadd -f -g 1000 me && useradd -u 1000 -g me me

# Allow apache to run with 'me' user
RUN chown -R me:me /usr/local/apache2

EXPOSE 1080
