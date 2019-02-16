FROM node:alpine as tempimage

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx

COPY --from=tempimage /app/build /app/build /usr/share/nginx/html/
