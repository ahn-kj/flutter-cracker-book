FROM node:12.22.1-buster-slim

ENV PORT 4004

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY . .

RUN npm install

EXPOSE $PORT

CMD PORT=$PORT npm run start