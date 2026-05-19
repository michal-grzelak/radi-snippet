FROM quay.io/fedora/fedora:44

RUN dnf5 -y install webkit2gtk4.1-devel \
  openssl-devel \
  curl \
  wget \
  file \
  libappindicator-gtk3-devel \
  librsvg2-devel \
  libxdo-devel

RUN dnf5 -y install xdg-utils \
  at-spi2-core

RUN dnf5 -y group install "c-development"

RUN dnf5 -y install git

RUN dnf5 -y install chezmoi
