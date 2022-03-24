Homework #3:
1. 
Исследовать способ подключения к someinternalhost в одну команду из вашего рабочего устройства, проверить работоспособность найденного решения:
ProxyJump: ssh -i ~/.ssh/appuser -J appuser@51.250.98.85 appuser@10.129.0.10

2. 
Предложить вариант решения для подключения из консоли при помощи команды вида ssh someinternalhost из локальной консоли рабочего устройства, чтобы подключение выполнялось по алиасу:

добавить в ~/.ssh/config:
Host someinternalhost
  Hostname 10.129.0.10
  IdentityFile  ~/.ssh/appuser
  ForwardAgent yes
  User appuser
  ProxyCommand ssh -W %h:%p -i ~/.ssh/appuser appuser@51.250.98.85
  
bastion_IP=51.250.98.85
someinternalhost_IP=10.129.0.10
