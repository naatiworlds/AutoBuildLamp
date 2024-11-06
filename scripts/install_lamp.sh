#!/bin/bash

# Cargar variables de entorno desde el archivo .env
source .env

# Actualizar repositorios e instalar actualizaciones
echo "Actualizando paquetes..."
sudo apt update -y && sudo apt upgrade -y

# Instalar Apache
echo "Instalando Apache..."
sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2

# Instalar MySQL
echo "Instalando MySQL..."
sudo apt install mysql-server -y
sudo systemctl enable mysql
sudo systemctl start mysql

# Configurar la contraseña de MySQL root y ajustes de seguridad básicos
echo "Configurando MySQL..."
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY '$APP_PASSWORD'; FLUSH PRIVILEGES;"
sudo mysql -e "DELETE FROM mysql.user WHERE User='';"
sudo mysql -e "DROP DATABASE IF EXISTS test;"
sudo mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Instalar PHP
echo "Instalando PHP..."
sudo apt install php libapache2-mod-php php-mysql -y
sudo systemctl restart apache2

# Crear archivo info.php para verificar PHP
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php > /dev/null

echo "Instalación de la pila LAMP completada."
