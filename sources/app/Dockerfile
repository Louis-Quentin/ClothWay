FROM cirrusci/flutter

WORKDIR /app

COPY . .

RUN rm -f .packages

RUN flutter pub get

RUN flutter clean