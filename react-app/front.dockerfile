## Build
# docker build -t frontend:0.1.0 -f front.dockerfile .
## Run
# docker run -p 8888:8888 frontend:0.1.0

FROM node:16.15.0-stretch-slim

# Copy application
COPY . /opt/app

WORKDIR /opt/app

RUN npm install

RUN npm run build

RUN npm install -g serve

CMD ["serve", "-s", "build"]