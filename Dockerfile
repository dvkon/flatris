#Create NodeJs service in container
FROM node

#Create folder for docker container files
RUN mkdir /dvkon

#Go to folder
WORKDIR /dvkon

#Optimized. Install once package.json
COPY package.json /dvkon
RUN yarn install

#Copy files from current folder in docker container
COPY . /dvkon

#Test and build app
RUN yarn test
RUN yarn build

#Run app after start container
CMD yarn start

#Open port 3000
EXPOSE 3000
