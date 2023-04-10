#Image officielle de React
FROM node:16-alpine3.16

#Copie des fichiers dans le dossier app_web du container
COPY . /app_web

#Définition de variabel d'environnement
ENV PATH /app_web/node_modules/.bin:$PATH

#Définition du répertoire de travail
WORKDIR /app_web

#Installation des dépendances
RUN npm install --force
RUN npm install -g serve

#Compilation des fichiers .js
RUN npm run build

#Création de l'application web
ENTRYPOINT [ "serve", "-s", "build"]