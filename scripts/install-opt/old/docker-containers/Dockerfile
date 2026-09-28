# Usa una imagen base de Ruby con Alpine
FROM ruby:3.2-alpine

# Instalar dependencias necesarias
RUN apk update && apk add --no-cache \
    libpcap-dev \
    build-base \
    git \
    yaml-dev \
    && gem install bundler

# Clonar el repositorio de WhatWeb desde GitHub en /opt
RUN git clone --depth=1 https://github.com/urbanadventurer/whatweb.git /opt/whatweb

# Corregir el problema en el plugin
RUN sed -i 's/description "Fortra GoAnywhere is a Managed File Transfer (MFT) solution designed to help organizations securely and efficiently exchange data with trading partners, employees, and internal systems>/description "Fortra GoAnywhere is a Managed File Transfer (MFT) solution designed to help organizations securely and efficiently exchange data with trading partners, employees, and internal systems."/' /opt/whatweb/plugins/goanywhere-web-client.rb

# Establecer el directorio de trabajo en /opt/whatweb
WORKDIR /opt/whatweb

# Instalar dependencias de WhatWeb usando Bundler
RUN bundle install

# Configurar el comando por defecto para ejecutar WhatWeb
ENTRYPOINT ["ruby", "whatweb"]

