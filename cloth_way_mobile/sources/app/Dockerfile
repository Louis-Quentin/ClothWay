# Utilisez l'image de base ARM64 avec les outils Flutter préinstallés
FROM cirrusci/flutter:2.5.0 AS builder

# Créez un utilisateur non privilégié pour exécuter les commandes Flutter
RUN adduser --disabled-password --gecos "" flutteruser
USER flutteruser

# Configurez le chemin d'installation de Flutter pour l'utilisateur non privilégié
ENV PATH="/home/flutteruser/flutter/bin:${PATH}"

# Copiez votre application Flutter dans le conteneur
COPY . /app
WORKDIR /app

# Mettez à jour les dépendances du système et installez les dépendances de Flutter
RUN flutter config --enable-web
RUN flutter doctor
RUN flutter pub get

# Compilez votre application Flutter pour la plate-forme cible
RUN flutter build web --release

# Utilisez une image Nginx pour héberger votre application construite
FROM nginx:alpine

# Copiez les fichiers de build Flutter dans le répertoire des ressources de Nginx
COPY --from=builder /app/build/web /usr/share/nginx/html

# Exposez le port 80 pour accéder à votre application
EXPOSE 80

# Démarrez le serveur Nginx
CMD ["nginx", "-g", "daemon off;"]