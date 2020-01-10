# eugmukhin_infra
eugmukhin Infra repository

## Подключение к someinternalhost одной командой
ssh -i ~/.ssh/appuser -A appuser@34.76.132.141 -t ssh 10.132.0.3

## Конфигурационные данные серверов ДЗ №3
bastion_IP = 34.76.132.141
someinternalhost_IP = 10.132.0.3

## Конфигурационные данные серверов ДЗ №4
testapp_IP = 35.233.53.37
testapp_port = 9292

## Команда развертывания приложения из локального startup скрипта
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags puma-server \
  --restart-on-failure \
  --metadata-from-file startup-script=startup.sh
