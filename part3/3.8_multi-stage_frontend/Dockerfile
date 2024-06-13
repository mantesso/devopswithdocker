FROM node:16-alpine as build-stage
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . .
EXPOSE 5000
RUN npm run build && npm install -g serve && adduser -D appuser && chown appuser .
USER appuser
CMD serve -s -l 5000 build

FROM nginx:1.27-alpine
COPY --from=build-stage /usr/src/app/build /usr/share/nginx/html