FROM node:11.10.0-alpine

# Create app directory
RUN mkdir /app
WORKDIR /app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json /app
COPY yarn.lock /app


RUN yarn install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . /app
RUN yarn build


EXPOSE 3000
CMD [ "npm", "start"]