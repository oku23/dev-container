ARG NODE_VERSION=20
FROM node:${NODE_VERSION}-bullseye

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=1000

RUN apt-get update \
  && apt-get install -y --no-install-recommends git curl build-essential \
  && install -m 0755 -d /etc/apt/keyrings \
  && curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
     | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
     | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && curl -fsSL https://download.docker.com/linux/debian/gpg \
     -o /etc/apt/keyrings/docker.asc \
  && chmod a+r /etc/apt/keyrings/docker.asc \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian bullseye stable" \
     | tee /etc/apt/sources.list.d/docker.list > /dev/null \
  && apt-get update \
  && apt-get install -y gh docker-ce-cli \
  && apt-get install -y sudo \
  && groupadd -g 999 docker 2>/dev/null || true \
  && usermod -aG docker node \
  && echo "node ALL=(root) NOPASSWD: /bin/chmod 666 /var/run/docker.sock" \
     > /etc/sudoers.d/node-docker \
  && chmod 0440 /etc/sudoers.d/node-docker \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

USER node
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin
