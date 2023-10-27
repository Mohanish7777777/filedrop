# => Build container
FROM node:20-alpine as build

# set version label
ARG BUILD_DATE
ARG VERSION

ARG VITE_APP_NAME

LABEL build_version="filedrop version: ${VERSION}, Build Date: ${BUILD_DATE}"

WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY . /app

RUN apk add --no-cache bash
RUN corepack yarn install && corepack yarn build && corepack yarn cache clean

EXPOSE 5000

CMD ["corepack", "yarn", "start:prod"]
