FROM node:16-alpine as build-stage
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.27-alpine
COPY --from=build-stage /usr/src/app/build /usr/share/nginx/html