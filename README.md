# Hazesoft-T1

The docker image for the nginx-docker is uploaded to https://hub.docker.com/layers/pranay1717/hazesoft-tasks/nginx-docker/images/sha256-01208280cfa6e5d49ef3ee5165ff4067c9424ae0d4be907908b12f1674aa3564?context=repo .

```
docker pull pranay1717/hazesoft-tasks:nginx-docker 
```

The entire process from start to finish is as follows:

## 1. Write the dockerfile for the nginx docker.

```
FROM alpine:latest

RUN apk update && apk add nginx git

WORKDIR /usr/share/nginx/html

RUN rm -rf *

RUN git clone https://github.com/veekrum/task

RUN cp -r task/site/ .

COPY default.conf /etc/nginx/http.d/default.conf

EXPOSE 9000

CMD ["nginx", "-g", "daemon off;"]

```

## 2. Write a default.conf file to replace the default.conf file in the installed nginx.

```
server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /usr/share/nginx/html;

        location /site/ {
               index site/index.html;
        }

        location = /404.html {
                internal;
        }


}
```

## 3. Build the docker image.

![image](https://github.com/Pranaenae/Hazesoft-T1/assets/80820244/3201d0ef-9180-4c45-aa69-c72ba71f72e0)

## 4. Run the container.

![image](https://github.com/Pranaenae/Hazesoft-T1/assets/80820244/a176758a-ac4d-4052-95f5-72afca200ac2)

![image](https://github.com/Pranaenae/Hazesoft-T1/assets/80820244/7f92ad5c-78c7-4781-80f1-3c3fd7f4116e)

## 5. Go to the specified url.

![image](https://github.com/Pranaenae/Hazesoft-T1/assets/80820244/c3847c50-f0fd-4e11-8731-18f5d3374366)


