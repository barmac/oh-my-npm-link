FROM alpine:3.14
RUN apk add --no-cache jq
RUN apk add --no-cache zsh
SHELL [ "/bin/zsh", "-c" ]
COPY oh-my-npm-link.zsh .

RUN autoload -Uz compinit && compinit && source ./oh-my-npm-link.zsh
