FROM node:16-alpine3.16

COPY . /app_web

ENV PATH /app_web/node_modules/.bin:$PATH

WORKDIR /app_web

RUN npm install --force
RUN npm install -g serve

RUN npm run build

ENTRYPOINT [ "serve", "-s", "build"]