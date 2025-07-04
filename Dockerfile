FROM node:16

# We have to install nodemon globally before moving into the working directory
RUN npm install -g nodemon

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package.json /usr/src/app

RUN npm install

# Bundle app source
COPY . /usr/src/app

# Updates the latest version of the implementations.json document
ADD https://ow2-miniapp-initiative.github.io/poi-miniapp-implementations/implementations.json /usr/src/app/data/

EXPOSE 3000

CMD npm run start