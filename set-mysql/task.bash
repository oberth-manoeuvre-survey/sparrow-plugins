#!/bin/bash

set -e

echo "set mysql server ..."

if grep -q 'bind-address = 0.0.0.0' /etc/mysql/mysql.conf.d/mysqld.cnf; then

  rm -rf $cache_root_dir/mysql-need-restart.ok

else

  sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

  touch $cache_root_dir/mysql-need-restart.ok

fi

allow_host=$(config allow_host)
database=$(config database)
user=$(config user)

set -x

mysql -e "create database if not exists $database"
mysql -e "create user if not exists '$user'@'$allow_host'"
mysql -e "GRANT ALL PRIVILEGES  ON $database.* TO '$user'@'$allow_host'; FLUSH PRIVILEGES"

set +x

echo "[/etc/mysql/mysql.conf.d/mysqld.cnf]"
echo "===================================="
cat /etc/mysql/mysql.conf.d/mysqld.cnf
