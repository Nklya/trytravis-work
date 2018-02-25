# frodox_microservices

## Homework #14 (docker-1)

ДЗ посвящено знакомству с Docker. Что сделано:

* установлен `docker{,-compose,machine}`
* проверка работы `docker run hello-world`
* Осознанна разница между образом и контейнером

Основные команды работы с docker

* `docker ps -a` --- список всех контейнеров
* `docker images` --- список локальных образов
* `docker run --rm -it ubuntu:latest /bin/bash` --- запуск нового контейнера из указанного **образа**
* `docker start <container_id>` --- старт ранее созданного **контейнера**
* `docker attach <container_id>` --- присоединение к терминалу запущенного контейнера (`^p,q` --- отсоединиться)
* `docker exec -it <container_id> <bash>` --- запуск команды внутри запущенного контейнера
* `docker stop <container_id>` --- SIGTERM и через 10сек KILL контейнера (предпочтительно при необходимости корректного завершения)
* `docker rm <container_id> [-f]` --- удалить [работающий] контейнер
* `docker rmi <image_id> [-f]` --- удалить [используемый] образ


## Homework #15 (docker-2)

* Сконфигурировали GCloud для работы с новым проектом
* Установлен `docker-machine-0.13`
* Собран базовый образ `reddit:latest`
* Зарегистрирован аккаунт на dockerHub (вход по `docker login`)
* Образ из ДЗ загружен на DockerHub. [Ссылка](https://hub.docker.com/r/frodox/otus-reddit/)


Пример создания хост-машины с docker-ом (на ней будем тренироваться):

```
docker-machine create --driver google \
    --google-project $(cat gcp.id) \
    --google-zone europe-west1-b \
    --google-machine-type g1-small \
    --google-machine-image \
    $(gcloud compute images list --filter ubuntu-1604-lts --uri) \
    docker-host

eval $(docker-machine env docker-host)
```

Сборка образа и запуск контейнера:

```
docker build -t reddit:latest .
docker run --name reddit -d --network=host reddit:latest
```

Добавляем правило firewall

```
gcloud compute firewall-rules create reddit-app \
    --allow tcp:9292 --priority=65534 \
    --target-tags=docker-machine \
    --description="Allow TCP connections" \
    --direction=INGRESS
```

Наше приложение доступно напрямую из мира (см. `docker-machine ls`).

Загружаем наш образ в DockerHub.

```
docker login
...
docker tag reddit:latest frodox/otus-reddit:1.0
docker push frodox/otus-reddit:1.0
```


### Задание со `*`:
Сравнить вывод 

```
docker run --rm -it tehbilly/htop
docker run --rm --pid host -it tehbilly/htop
```

вторая команда создаёт контейнер в PID-namespace хоста, а не новом
и изолированном. Таким образом контейнер потенциально может иметь доступ ко всем процессам хоста, что не безопасно.
