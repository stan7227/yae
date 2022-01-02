FROM node:15.5.0-alpine

ARG WORKDIR
RUN apk add --no-cache python make g++
ENV HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    HOST=0.0.0.0

WORKDIR ${HOME}
