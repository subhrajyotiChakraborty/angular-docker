# Stage 1
FROM node:12.18.3-alpine3.9 as build
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build --prod

# Stage 2
FROM nginx:1.18-alpine
COPY --from=build /app/dist/container-app /usr/share/nginx/html