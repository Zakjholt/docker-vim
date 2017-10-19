FROM mhart/alpine-node

USER root

RUN apk update && apk add ca-certificates && update-ca-certificates && apk add openssl && apk add git && apk add vim

RUN addgroup -g 1000 user \
  && adduser -D -G user -u 1000 user


USER user
RUN mkdir -p ~/.vim/autoload

RUN wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O ~/.vim/autoload/plug.vim
RUN wget https://raw.githubusercontent.com/zakjholt/dotfiles/master/.vimrc -O ~/.vimrc

RUN vim +PlugInstall +qall
VOLUME [ "/mnt/workspace" ]
WORKDIR /mnt/workspace
CMD vim .
