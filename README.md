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

## Команда создания правила фаервола
gcloud compute firewall-rules create default-puma-server \
  --action allow \
  --target-tags puma-server \
  --source-ranges=0.0.0.0/0 \
  --rules tcp:9292

## Домашние задание №4
-- Скрипты startup.sh и deploy.sh перенесены в папку config-scripts
-- Добавлен шаблон ubuntu16.json с инструкциями для packer по сборке образа семейства reddit-base
-- Выполнена параметризация шаблона ubuntu16.json.
    project_id - ID проекта (обязательно)
    source_image_famaly - Семейство исходного образа
    machine_type - Тип машины
    image_description - Описание образа
    disk_size - Размер диска
    disk_type - Тип диска
    network - Название сети
    tags - Теги
-- В шаблон ubuntu16.json добавлены инструкции на выполнения инсталяционных скриптов Ruby и MongoDB - install_mongodb.sh и install_ruby.sh
-- Параметры обязательных переменных project_id и source_image_famaly для шаблона ubuntu16.json вынесены в файл variables.json
-- Файл variables.json добавлен в .gitignore
-- В файл variables.json.example добавлены примеры значений обезательных переменых project_id и source_image_famaly
-- Добавлен шаблон immutable.json для сборки образа семейства reddit-full с автозапуском приложения reddit-app
-- Добавлен скрипт create-redditvm.sh для создания VM из образа семейства reddit-full
