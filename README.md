# yunusovtr_microservices
yunusovtr microservices repository

## Домашняя работа №16: Технология контейнеризации. Введение в Docker

### Что сделано
 - Пройдена методичка
 - Добавил вывод команды docker images в файл docker-monolith/docker-1.log
 - Задание со *. Внёс ответ в файл: "Выводы в чём-то схожи. У контейнера данных больше и выглядят как данные образа дополненные данными конкретного окружения, описаниями драйверов и интерфейсов."
 - Прошёл методичку до конца. Задание со * в конце делать не стал.

## Домашняя работа №17: Docker-образы. Микросервисы
 - Выполнил методичку, запустил четыре контейнера, проверил работу приложения
 - Задание со *. Запуск приложения с другими сетевыми алиасами и адаптация под них переменных окружения:
   - docker run -d --network=reddit --network-alias=OTHER_post_db --network-alias=OTHER_comment_db mongo:4.2.18
   - docker run -d --network=reddit --network-alias=OTHER_post --env POST_DATABASE_HOST=OTHER_post_db yunusovtr/post:1.0
   - docker run -d --network=reddit --network-alias=OTHER_comment --env COMMENT_DATABASE_HOST=OTHER_comment_db yunusovtr/comment:1.0
   - docker run -d --network=reddit -p 9292:9292 --env POST_SERVICE_HOST=OTHER_post --env COMMENT_SERVICE_HOST=OTHER_comment yunusovtr/ui:1.0
 - Выполнил до конца методички: собрал новую версию образа ui и создал том для mongodb, проверил работу

## Домашняя работа №18: Docker: сети, docker-compose
 - Поэкспериментировал с сетями внутри докера, повторил запуски контейнеров с использованием драйверов
none и host и посмотрел, как меняется список namespace-ов, подключал контейнеры одновременно к двум бриджам, увидел как создаются интерфейсы и правила iptables для работы докера.
 - Установил docker-compose, попробовал.
 - Переделал docker-compose.yml в соответствии с заданием, параметризировал порт публикации ui сервиса, версии каждого сервиса, версию mongo
 - Отвечаю на вопрос. Имя для проекта можно задать, переименовав каталог с файлом docker-compose.yml, либо при запуске и остановке сервисов указывать ключ -p или --project-name, например: docker-compose -p newname up -d И docker-compose -p newname down
