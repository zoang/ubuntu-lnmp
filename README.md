# Ubuntu 20.04快速搭建PHP非生产环境

适用阿里云轻量应用服务器 ubuntu20.04 ,快速搭建Laravel8环境。

## 自动安装软件列表

* Git
* PHP 7.4
* Nginx
* MySQL
* Composer
* Nodejs 
* Redis
* Beanstalkd
* Memcached

## 可选手动安装软件列表*

以下软件需手动执行安装脚本：

* Elasticsearch：`./install_elasticsearch.sh`




## 安装步骤

##### 请用root用户执行安装脚本命令

```
git clone https://github.com/zoang/ubuntu-lnmp.git
cd ubuntu-lnmp/src
./install.sh
```

如果当前不是 root 用户则不会安装，请切换到 root 账户后执行 `./install.sh`。


## 其他说明

无
