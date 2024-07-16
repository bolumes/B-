# Use a imagem oficial do PHP 8.1
FROM php:8.1-cli

# Instale as dependências do sistema
RUN apt-get update && apt-get install -y \
    unzip \
    git \
    zip \
    libzip-dev \
    libpq-dev \
    && docker-php-ext-install pdo_pgsql

# Instale o Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Defina o diretório de trabalho
WORKDIR /var/www

# Copie os arquivos de configuração do Composer
COPY ws/composer.json ws/composer.lock ./

# Instale as dependências do Composer
RUN composer install --no-interaction --no-plugins --no-scripts

# Copie o código-fonte para o container
COPY ws/ ws/

# Exponha a porta do WebSocket
EXPOSE 8000

# Comando para iniciar o servidor WebSocket
CMD ["php", "ws/websockets_server.php"]
