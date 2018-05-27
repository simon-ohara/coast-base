FROM ubuntu:bionic

# Packages
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y \
    build-essential \
    git \
    locales \
    software-properties-common \
    vim \
    wget \
    zsh

# Locale setup
RUN \
  locale-gen en_US.UTF-8 && \
  update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

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
