# FROM node:15.5.0-alpine

# ARG WORKDIR
# RUN apk add --no-cache python make g++
# ENV HOME=/${WORKDIR} \
#     LANG=C.UTF-8 \
#     TZ=Asia/Tokyo \
#     HOST=0.0.0.0

# WORKDIR ${HOME}

FROM node:15.5.0-alpine

WORKDIR ${WORKDIR}

ENV HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    HOST=0.0.0.0

COPY package*.json ./

RUN apk update && \
    apk upgrade && \
    apk add --no-cache python make g++ && \
    yarn install
# RUN yarn install

COPY . ./

RUN /bin/sh -c yarn run build

EXPOSE ${FRONT_PORT}

# CMD ["yarn", "run", "start"]
