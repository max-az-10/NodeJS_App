# syntax=docker/dockerfile:1

FROM node:18-alpine AS build 
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --production
COPY src ./src
COPY spec ./spec
RUN yarn run build 

FROM nginx:alpine 
COPY --from=build /app/build /usr/share/nginx/html

CMD ["node", "src/index.js"]
EXPOSE 3000