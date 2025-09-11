ARG NODE_VERSION=20
FROM node:${NODE_VERSION}-bullseye

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USERNAME \
  && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
  && apt-get update \
  && apt-get install -y --no-install-recommends git curl build-essential \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

USER $USERNAME
ENV NPM_CONFIG_PREFIX=/home/$USERNAME/.npm-global
ENV PATH=$PATH:/home/$USERNAME/.npm-global/bin
