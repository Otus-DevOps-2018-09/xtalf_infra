# xtalf_infra
xtalf Infra repository

# Доступ по ssh

Способы подключения по ssh:
1. Подключение с помощью однострочника.
```
ssh -o ProxyCommand='ssh -W %h:%p appuser@35.187.6.52' appuser@10.132.0.3
```

2. Подключение через  алиас.
Создаем на рабочем устройстве ~/.ssh/config со следующим содержанием:

```
Host bastion
	User appuser
	Hostname 35.187.6.52

Host someinternalhost
	User appuser
	Hostname 10.132.0.3
	ProxyCommand ssh bastion -W %h:%p
	#Если версия клиента OpenSSH >= 7.3 вместо ProxyCommand можно использовать:
	#ProxyJump appuser@35.187.6.52
```

# VPN

bastion_IP = 35.187.6.52

someinternalhost_IP = 10.132.0.3

# Настройка VPN (CentOS 7)

Подключаем нужные репозитории:
sudo tee -a /etc/yum.repos.d/mongodb-org-3.6.repo << EOF
[mongodb-org-3.6]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/7/mongodb-org/3.6/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.6.asc
EOF

sudo tee -a /etc/yum.repos.d/pritunl.repo << EOF
[pritunl]
name=Pritunl Repository
baseurl=https://repo.pritunl.com/stable/yum/centos/7/
gpgcheck=1
enabled=1
EOF

sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys 7568D9BB55FF9E5287D586017AE645C0CF8E292A
gpg --armor --export 7568D9BB55FF9E5287D586017AE645C0CF8E292A > key.tmp; sudo rpm --import key.tmp; rm -f key.tmp

Устанвливаем pritunl и mongodb-org:
sudo yum -y install pritunl mongodb-org

Стартуем сервисы и включем автозапуск:
sudo systemctl start mongod pritunl
sudo systemctl enable mongod pritunl
