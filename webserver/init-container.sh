#!/bin/sh

set -eux

apk update
apk add --no-cache gnupg git

cd "${TMPDIR:-/tmp/}"

# Install PHP CS Fixer
curl -f -L https://github.com/FriendsOfPHP/PHP-CS-Fixer/releases/download/v2.16.3/php-cs-fixer.phar -o php-cs-fixer
chmod a+x php-cs-fixer
mv php-cs-fixer /usr/local/bin/php-cs-fixer

# Install SQL Server drivers

# Install SQL Server ODBC drivers and tools (required for the sqlsrv driver).
curl -f -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.5.2.2-1_amd64.apk
curl -f -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/mssql-tools_17.5.2.1-1_amd64.apk

# Verify signature
curl -f -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.5.2.2-1_amd64.sig
curl -f -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/mssql-tools_17.5.2.1-1_amd64.sig

curl -f https://packages.microsoft.com/keys/microsoft.asc | gpg --import -
gpg --verify msodbcsql17_17.5.2.2-1_amd64.sig msodbcsql17_17.5.2.2-1_amd64.apk
gpg --verify mssql-tools_17.5.2.1-1_amd64.sig mssql-tools_17.5.2.1-1_amd64.apk

# Install the package(s)
yes | apk add --allow-untrusted msodbcsql17_17.5.2.2-1_amd64.apk
yes | apk add --allow-untrusted mssql-tools_17.5.2.1-1_amd64.apk
cd -

apk add --no-cache php7 php7-dev php7-pear php7-pdo php7-openssl autoconf make g++ unixodbc-dev openjdk11-jre-headless shellcheck

cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
pecl config-set php_ini /usr/local/etc/php/php.ini

# Procedural sqlsrv. Enable for debugging only.
#pecl install sqlsrv
#docker-php-ext-enable sqlsrv

pecl install pdo_sqlsrv
docker-php-ext-enable pdo_sqlsrv

pecl install xdebug
docker-php-ext-enable xdebug

printf '%s\n' 'file_uploads = Off
allow_url_fopen = Off

[Session]
session.use_strict_mode = On
session.use_cookies = On
session.use_only_cookies = On
session.cache_limiter = nocache
session.cookie_httponly = On
session.cookie_samesite = "Strict"
session.use_trans_sid = Off
' >>/usr/local/etc/php/conf.d/security.ini

printf '%s\n' '[XDebug]
xdebug.remote_enable = 1
xdebug.remote_autostart = 1
# Required to extend beyond localhost, because of Docker networking.
xdebug.remote_host = "0.0.0.0"
' >>/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
