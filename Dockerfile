FROM node:22

RUN apt update && apt install -y \
  vim \
  screen \
  zsh \
  net-tools \
  telnet \
  iputils-ping \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /root/test

COPY --chown=root:root [".", "."]

RUN npm install -g pm2 serve

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
