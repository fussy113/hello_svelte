# 本番運用まで想定したもの
FROM node:12.14.1-alpine3.11 AS base

WORKDIR /root/app

# buildの時に必要なファイルをcopyできる
COPY ./ ./

# installなんかもここでできる
RUN npm install

EXPOSE 5000

FROM node:12.14.1-alpine3.11  AS dev

COPY . .

# docker runの際にコンテナでどんなコマンドを実行するかを指定できる(わざわざshellに入る必要なし)
CMD HOST=0.0.0.0 npm run dev

FROM base AS prod

COPY --from=base /root/app /root/app

# docker runの際にコンテナでどんなコマンドを実行するかを指定できる(わざわざshellに入る必要なし)
CMD HOST=0.0.0.0 npm run start




# 実行コマンド
# docker build --target prod -t hello_svelte:latest .
# docker run --rm -it -p 5000:5000 hello_svelte:latest
