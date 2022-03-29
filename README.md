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

Homework #4

testapp_IP = 51.250.107.223
testapp_port = 9292


yc compute instance create \ --name reddit-app \ --hostname reddit-app \ --memory=4 \ --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \ --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \ --metadata serial-port-enable=1 \ --ssh-key ~/.ssh/appuser.pub \ --metadata-from-file=./startup_script.sh

Homework #5

Создана конфигурация для packer создающая образ виртуальной машины с установленными зависимостями для приложения. Запуск cd packer&&packer build -var-file=variables.json ./ubuntu16.json Файл variable.json создать по примеру variable.json.example. Файл key.json можно создать следующими коммандами:

SVC_ACCT="<имя сервисной учетной записи>"
FOLDER_ID="<id папки>"
yc iam service-account create --name $SVC_ACCT --folder-id $FOLDER_ID

ACCT_ID=$(yc iam service-account get $SVC_ACCT | \
grep ^id | \
awk '{print $2}')

yc resource-manager folder add-access-binding --id $FOLDER_ID \
--role editor \
--service-account-id $ACCT_ID

yc iam key create --service-account-id $ACCT_ID --output <путь до ключа>/key.json

1.2 Образ reddit-full
Создана конфигурация для packer создающая образ виртуальной машины с установленными зависимостями и запущенным приложением. Запуск cd packer&&packer build -var-file=variables.json ./immutable.json Файлы variable.json и создать по примеру variable.json.examples. Скрипт создания виртуальной машины config-sripts/create-reddit-vm.sh
