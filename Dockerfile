# Stage 1: Compile and Buil angular codebase

# Use official node image as the base image
FROM node:latest as build

# Set the working directory
WORKDIR /usr/local/app

# Add the source code to app
COPY ./ /usr/local/app/

# Install all the dependencies
RUN npm Install

# Generate the build of the application
RUN npm run build

#output


# Stage 2: Serve app with nginx server

# Use official nginx image as the base image
FROM nginx:latest

# Copy the build output to replace the default nginx contents.
COPY --from=build /usr/local/app/dist/hw-angular /usr/share/nginx/html

# Expose port 80
EXPOSE 80
