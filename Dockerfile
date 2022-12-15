#CLONING RESOSITORY
# FROM ubuntu

# RUN apt-get update \
#     && apt-get install -y git

# RUN git clone git@github.com:Louis-Quentin/ClothWay.git

#BACKEND PART
FROM postgres:latest

ENV POSTGRES_PASSWORD=Clothway

ENV POSTGRES_USER=dev_user

ENV POSTGRES_DB=gorm

EXPOSE 5432

COPY sources/Back/entrypoint.sh /tmp/

#INSTALL STUFF FOR WEB
# FROM node:latest

# WORKDIR /app

# COPY package.json ./

# RUN npm install
