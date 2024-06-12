FROM node:16

# Create app server directory
WORKDIR /usr/src/server

# Install server dependencies
COPY server/package*.json ./

RUN npm install -g ts-node
RUN npm install

# Bundle server source
COPY server/ ./

RUN npm run build


# Create app client directory
WORKDIR /usr/src/client

# Install client dependencies
COPY client/package*.json ./

RUN npm install

# Bundle client source
COPY client/ ./

RUN npm run build

WORKDIR /usr/src/server

# App listens on port 2567
EXPOSE 2567

CMD [ "npm", "start" ]