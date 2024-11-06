#!/bin/bash

# Cargar variables de entorno
source .env

# Instalar phpMyAdmin
echo "Instalando phpMyAdmin..."
sudo apt install phpmyadmin -y
sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

# Instalar Adminer
echo "Instalando Adminer..."
sudo mkdir -p /var/www/html/adminer
sudo wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" -O /var/www/html/adminer/index.php

# Instalar GoAccess para el análisis de logs
echo "Instalando GoAccess..."
sudo apt install goaccess -y

# Configurar archivo .htaccess y .htpasswd para proteger phpMyAdmin
echo "Configurando protección .htaccess para phpMyAdmin..."

# Crear archivo .htaccess en el directorio de phpMyAdmin
echo "AuthType Basic" | sudo tee /var/www/html/phpmyadmin/.htaccess > /dev/null
echo "AuthName \"Restricted Access\"" | sudo tee -a /var/www/html/phpmyadmin/.htaccess > /dev/null
echo "AuthUserFile /etc/apache2/.htpasswd" | sudo tee -a /var/www/html/phpmyadmin/.htaccess > /dev/null
echo "Require valid-user" | sudo tee -a /var/www/html/phpmyadmin/.htaccess > /dev/null

# Crear archivo .htpasswd y añadir usuario de acceso
echo "Creando usuario de acceso para phpMyAdmin..."
sudo htpasswd -bc /etc/apache2/.htpasswd $STATS_USERNAME $STATS_PASSWORD

# Reiniciar Apache para aplicar configuraciones
sudo systemctl restart apache2

echo "Instalación y configuración de herramientas adicionales completada."
