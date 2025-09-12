ARG NODE_VERSION=20
FROM node:${NODE_VERSION}-bullseye

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=1000


RUN apt-get update \
  && apt-get install -y --no-install-recommends git curl build-essential \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

USER node
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin
