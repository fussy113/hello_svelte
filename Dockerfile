FROM centos:latest

WORKDIR /root

RUN yum -y update
RUN yum -y install git gcc-c++

RUN git clone http://github.com/creationix/nvm.git /root/.nvm
RUN sh /root/.nvm/install.sh
RUN export NVM_DIR="$HOME/.nvm"
RUN echo "[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh" >> $HOME/.bashrc
RUN source ./.bashrc && nvm install lts/erbium && nvm use lts/erbium

EXPOSE 5000
