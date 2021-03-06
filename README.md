## Диграмма разработанных классов:

Для наглядности добавил небольшую диаграмму составленных классов

![diagramm](https://raw.githubusercontent.com/Alex6Alex/test_translation_app/master/news_test.png)

1. В методе контроллера _show_ происходит декорирование в класс, отвечающий за кеширование переведенных данных, _Connection_ класса. В данном примере этот класс возвращает простая фабрика, несмотря на то, что в примере только одно подключение.

2. _YandexTranslation::Connection_ выступает в роли корня компоновки для создания класса-клиента подключения и класса с конфигурационными данными подключения.

3. В методе _translate_ класса _YandexTranslation::Connection_ происходит создание тела запроса с помощью класса _YandexTranslation::Request::Translation_ и парсинг полученного ответа с помощью класса _YandexTranslation::Responses::Translation_.

## Дополнительная информация:

1. Для хранения данных подключения использовал файл .env.yml. Файл не добавлял в .gitignore, чтобы можно было бы сразу сделать запрос при проверке задания.

2. В конфигурационных файлах окружений не настраивал кеш, так как в режиме разработки использовал команду _rails dev:cache_ для включения кеша.

3. Тесты написал на метод контроллера _show_ и на методы _translate_ декоратора с кешем и _YandexTranslation::Connection_ класса.
