# FROM describes about the base image - mainly the language used to create an image
FROM node:14

# WORKDIR describes the starting of file directory inside the container where the application resides
WORKDIR /app

# COPY - can be used to copy particular files or an entire directory 
COPY package.json .

# RUN - command to be run after COPY step - usually downloads the images of the dependencies
RUN npm install

# COPY - copies the written code 
COPY . .

# EXPOSE - describes the port number to be exposed for network connectivity
EXPOSE 3000

# CMD - executing commands on the entry file to start the app
CMD ["node", "app.mjs"]

# After creating the Dockerfile run 
# docker build . - from location where the Dockerfile is present
# This creates the docker image and provides an id of the created image
# We can start this image as a container using
# docker run -p <portId>:<portId> <imageId> - this runs the container 
# docker ps - lists the name of all running containers
# Grab the name of the container you wanna stop with by matching the id 
# docker stop <containerName>