# Use the alpine linux image as the base
FROM alpine:latest

# Install necessary packages
RUN apk update && apk add nginx git

# Set the working directory
WORKDIR /usr/share/nginx/html

# Remove default nginx files
RUN rm -rf *

# Clone the repository
RUN git clone https://github.com/veekrum/task

# Copy the site folder to the nginx document root folder
RUN cp -r task/site/ .

COPY default.conf /etc/nginx/http.d/default.conf

# Expose port 9000
EXPOSE 9000

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]