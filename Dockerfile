FROM ruby:2.5-slim
# Instala nossas dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
build-essential nodejs libpq-dev imagemagick git-all
 
# Seta nosso path
ENV INSTALL_PATH /onebittwitter
# Cria nosso diretório
RUN mkdir -p $INSTALL_PATH
# Seta o nosso path como o diretório principal
WORKDIR $INSTALL_PATH
# Copia o nosso Gemfile para dentro do container
COPY Gemfile ./
# Copia nosso código para dentro do container
COPY . .