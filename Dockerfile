# FROM ubuntu:bionic
FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive

# Packages
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y \
    locales \
    git \
    vim \
    wget \
    zsh

# Locale setup
RUN \
  sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
  dpkg-reconfigure --frontend=noninteractive locales && \
  update-locale LANG=en_US.utf8

ENV LANG en_US.utf8
ENV LANGUAGE en_US.utf8
ENV LC_ALL en_US.utf8

# OhMyZSH setup
RUN \
  wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true && \
  chsh -s /bin/zsh

COPY .zshrc /root/
COPY .vimrc /root/
COPY .gitconfig /root/

# Vim setup
RUN \
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
  mkdir ~/.vim/tmp && \
  vim "+silent PluginInstall" "+silent qall"
