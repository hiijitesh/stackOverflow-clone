FROM node:23-alpine

# create dir
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app

# build dependencies
COPY ./package*.json ./

# switch as user node
USER node

# don't install dev depedencies
RUN npm install --omit=dev

# copy in source code
COPY --chown=node:node ./ ./

EXPOSE 4500

# start express server
CMD [ "npm", "start" ]
