#Image de flutter par cirrusci https://hub.docker.com/r/cirrusci/flutter
FROM cirrusci/flutter

#Définition du répertoire de travail
WORKDIR /app

#Copie des fichiers dans le conteneur
COPY . .

#Suppression des anciens packages flutter
RUN rm -f .packages

#Installation des packages
RUN flutter pub get

#Suppression des fichiers créées par flutter
RUN flutter clean