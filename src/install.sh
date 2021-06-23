#!/bin/bash

CURRENT_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
source ${CURRENT_DIR}/common.sh

[ $(id -u) != "0" ] && { ansi --bold --bg-red "请用 root 账户执行本脚本"; exit 1; }

function init_system {
    apt update
    apt autoremove -y
}

function install_basic_softwares {
    apt install -y unzip git
}

function install_php {
    apt install -y php7.4 php7.4-bcmath php7.4-cli php7.4-curl php7.4-fpm php7.4-gd php7.4-mbstring php7.4-mysql php7.4-opcache php7.4-pgsql php7.4-readline php7.4-xml php7.4-zip
}

function install_mysql {
    apt install -y mysql-server mysql-client
}

function install_nginx {
    apt install -y nginx
}

function install_memcached {
    apt install -y memcached
}

function install_beanstalkd {
    apt install -y beanstalkd
}

function install_redis {
    apt install -y redis-server
}

function install_composer {
    wget https://mirrors.aliyun.com/composer/composer.phar
    mv composer.phar composer
    chmod +x composer
    sudo mv composer /usr/bin
    yes|composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
}

function install_node_npm {    
    apt install -y nodejs
    apt install -y npm
    npm config set registry https://registry.npm.taobao.org
}

function update_node_npm {      
    npm install -g n && n stable
    PATH="$PATH"
    npm -g install npm@next
}

call_function init_system "1.配置系统" ${LOG_PATH}
call_function install_basic_softwares "2.安装软件" ${LOG_PATH}
call_function install_php "3.安装PHP" ${LOG_PATH}
call_function install_mysql "4.安装Mysql" ${LOG_PATH}
call_function install_nginx "5.安装Nginx" ${LOG_PATH}
call_function install_memcached "6.安装Memcached" ${LOG_PATH}
call_function install_beanstalkd "7.安装Beanstalkd" ${LOG_PATH}
call_function install_redis "8.安装Redis" ${LOG_PATH}
call_function install_composer "9.安装Composer" ${LOG_PATH}
call_function install_node_npm "10.安装Node_Npm" ${LOG_PATH}
call_function update_node_npm "11.更新Node_npm" ${LOG_PATH}

ansi
ansi --green --bold "--操作完成--"
ansi
ansi -n "初始化Mysql root 密码请运行："
ansi --bold --bg-white --red "sudo mysql_secure_installation"
ansi