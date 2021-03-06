FROM ubuntu:16.04

WORKDIR /app
RUN apt-get update && apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_10.x | bash && \
    apt install -y nodejs && \
    apt-get purge -y --auto-remove curl && \ 
    rm -rf /var/lib/apt/lists/* 
COPY package*.json ./
RUN npm install && \
    npm install -g serve
COPY . .
RUN npm run build 
CMD serve -s -l $PORT dist