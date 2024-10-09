FROM node:20.18.0
COPY . /app

WORKDIR /app

RUN  npm install -g pnpm \
  && pnpm prepare:docker \
  && pnpm config set node-linker hoisted \
  && pnpm install

VOLUME /app/data

ENV CQPS_DOCKER=1 TZ=Asia/Shanghai

CMD [ "node", "index.mjs" ]
