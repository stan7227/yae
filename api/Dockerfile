FROM ruby:2.7.2-alpine

ARG WORKDIR
ARG RUNTIME_PACKAGES="nodejs tzdata postgresql-dev postgresql git"
ARG DEV_PACKAGES="build-base curl-dev"

ENV HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo


WORKDIR ${HOME}

COPY Gemfile ${HOME}/Gemfile
COPY Gemfile.lock ${HOME}/Gemfile.lock

COPY package.json .
COPY yarn.lock .

RUN apk update && \
    apk upgrade && \
    apk add --no-cache ${RUNTIME_PACKAGES} && \
    apk add --virtual build-dependencies --no-cache ${DEV_PACKAGES} && \
    apk add --no-cache yarn tzdata libxml2-dev curl-dev make gcc libc-dev g++ imagemagick6-dev && \
    bundle install -j4 && \
    yarn install && \
    apk del build-dependencies

COPY . ./

CMD ["rails", "server", "-b", "0.0.0.0"]


# FROM ruby:2.7.2-alpine

# # ARG WORKDIR
# ARG RUNTIME_PACKAGES="nodejs tzdata postgresql-dev postgresql git"
# ARG DEV_PACKAGES="build-base curl-dev"

# ENV RAILS_ENV=production \
# # ENV HOME=/${WORKDIR} \
#     LANG=C.UTF-8 \
#     TZ=Asia/Tokyo


# WORKDIR app

# COPY Gemfile app/Gemfile
# COPY Gemfile.lock app/Gemfile.lock

# COPY package.json .
# COPY yarn.lock .

# RUN apk update && \
#     apk upgrade && \
#     apk add --no-cache ${RUNTIME_PACKAGES} && \
#     apk add --virtual build-dependencies --no-cache ${DEV_PACKAGES} && \
#     apk add --no-cache yarn tzdata libxml2-dev curl-dev make gcc libc-dev g++ imagemagick6-dev && \
#     bundle install -j4 && \
#     yarn install && \
#     apk del build-dependencies

# COPY . ./

# RUN mkdir -p tmp/sockets
# RUN mkdir -p tmp/pids

# # RUN groupadd nginx
# # RUN useradd -g nginx nginx
# # ADD nginx/nginx.conf /etc/nginx/nginx.conf

# # Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
# VOLUME /app/public
# VOLUME /app/tmp

# CMD bash -c "rm -f tmp/pids/server.pid && bundle exec puma -C config/puma.rb"
