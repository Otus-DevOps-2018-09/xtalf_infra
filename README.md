# xtalf_infra
xtalf Infra repository

# Доступ по ssh

Способы подключения по ssh:
1. Подключение с помощью однострочника.

ssh -o ProxyCommand='ssh -W %h:%p appuser@35.187.6.52' appuser@10.132.0.3

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
