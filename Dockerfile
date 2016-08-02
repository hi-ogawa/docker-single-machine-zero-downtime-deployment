FROM nginx:1.10.1

RUN apt-get update && apt-get install -y curl

COPY index.html /usr/share/nginx/html
