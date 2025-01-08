# syntax=docker/dockerfile:1 
#This Dockerfile is building the application and running it

#Build Stage: This stage is responsible for setting up the build environment, installing dependencies, and preparing the application for runtime.

#Runtime Stage: This stage is responsible for creating a lightweight image that contains only the necessary runtime components (such as Node.js, and your app's production files).

# Build stage 
FROM node:18-alpine AS build 
WORKDIR /app 
COPY package.json yarn.lock ./ 
RUN yarn install --production 
COPY src ./src 
COPY spec ./spec 

# Final stage 
FROM node:18-alpine
WORKDIR /app 
COPY --from=build /app /app 
CMD ["node", "src/index.js"] 
EXPOSE 3000
