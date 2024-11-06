# Instalación de la Pila LAMP en Ubuntu Server (Automatizada)

Este proyecto automatiza la instalación de una pila LAMP (Linux, Apache, MySQL, PHP) en Ubuntu Server usando scripts de Bash. Además, incluye la instalación de herramientas adicionales como phpMyAdmin, Adminer y GoAccess, y la configuración de seguridad con `.htaccess` y `.htpasswd`.

## Configuración Inicial

1. **Configura las variables en el archivo `.env`**:
   - Copia el archivo `.env.example` y renómbralo como `.env`.
   - Llena los valores de las variables necesarias:
     - `PHPMYADMIN_APP_PASSWORD`: Contraseña para phpMyAdmin.
     - `APP_USER` y `APP_PASSWORD`: Usuario y contraseña de MySQL.
     - `STATS_USERNAME` y `STATS_PASSWORD`: Usuario y contraseña para acceder a phpMyAdmin.

2. **Ejecuta los scripts**:
   - Ejecuta `install_lamp.sh` para instalar la pila LAMP.
   - Luego, ejecuta `install_tools.sh` para instalar y configurar las herramientas adicionales.

## Componentes y Herramientas Instaladas

- **Apache**: Servidor HTTP, configurado para iniciar automáticamente.
- **MySQL**: Base de datos, configurada con contraseña de root desde el archivo `.env`.
- **PHP**: Lenguaje de servidor, junto con módulos de soporte para MySQL.
- **phpMyAdmin**: Herramienta de gestión de MySQL protegida con `.htaccess`.
- **Adminer**: Herramienta de gestión de bases de datos.
- **GoAccess**: Analizador de logs en tiempo real.

## Protección de Directorios con `.htaccess`

Se ha configurado un archivo `.htaccess` en el directorio de phpMyAdmin para proteger el acceso mediante autenticación básica. Las credenciales de acceso están configuradas en el archivo `.env`.

## Capturas de Pantalla

(Añade capturas de pantalla del proceso de instalación, la conexión a phpMyAdmin y el archivo info.php en `/var/www/html` para verificar la instalación de PHP).

