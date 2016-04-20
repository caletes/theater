# Git is for bower
RUN apt-get install -y \
    git-core

# Install bower
RUN npm install -g bower
