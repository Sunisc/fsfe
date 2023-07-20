FROM node:19-alpine3.16
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
# copying from our relative directory
COPY --chown=node:node package*.json ./
USER node
RUN npm install 
# make node user owner of everything in working dir intead of OS
COPY --chown=node:node . . 
EXPOSE 3000
CMD ["node", "app.js"]
