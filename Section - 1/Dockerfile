# FROM describes about the base image - mainly the language used to create an image
# Used to build our image based on other base image available on hub
FROM node:14

# WORKDIR describes the starting of file directory inside the container where the application resides
# When not specified the root folder (.) will be taken as the working directory 
WORKDIR /app

# COPY - can be used to copy particular files or an entire directory 
# Usually package.json alone is copied separately first and npm install is run, to optimize and make 
# use of layer based architecture advantage during rebuild that only runs commands from where it detects 
# changes 
COPY package.json .

# RUN - command to be run after COPY step - usually downloads the images of the dependencies
# This will be run in the WORKDIR of the image specified
RUN npm install

# COPY - copies the written code
# We specify two path here
# The first path is the path outside the image where the files live (source) 
# Second is the path to where the files should be copied inside the image (destination)
# Here the destination(.) refers to /app since we set the WORKDIR as /app
COPY . .

# EXPOSE - describes the port number to be exposed for network connectivity - only for documentation 
# purpose it wont expose the port untill we specify port while using docker run command
# When the container is started we want to expose certain port number of container to our local system  
EXPOSE 3000

# CMD - executing commands on the entry file to start the app
# RUN is executed when the image is being built, and CMD is executed when a container
# is created based on that image
# syntax - [array of arguments]
# Should be the last command mostly
CMD ["node", "app.mjs"]

# After creating the Dockerfile run 
# docker build . - from location where the Dockerfile is present
# This creates the docker image and provides an id of the created image
# We can start this image as a container using
# docker run -p <portId>:<portId> <imageId> - this runs the container 
# docker ps - lists the name of all running containers
# Grab the name of the container you wanna stop with by matching the id 
# docker stop <containerName>