#Image officielle de go
FROM golang:1.19-alpine

#Définition du répertoire de travail
WORKDIR /app

#Copie des fichiers dans le conteneur
COPY . .

#Vérification des dépendances
RUN go mod tidy

#Compilation des fichiers .go
ENTRYPOINT [ "go", "run", "." ]