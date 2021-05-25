FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm instal
COPY . .
RUN npm run build

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html