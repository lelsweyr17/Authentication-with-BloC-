# test_login

Демо приложение с локальной авторизацией и запросом сеть.
Demo app with local authentication and sending request.

Описание(Describtion):

    Поля авторизации email и пароль имеют валидацию.
    Email and password fields has a validation.

    
    При успешной авторизации приложение переходит в состояние авторизованного пользователя и отправляет запрос на URL: https://jsonplaceholder.typicode.com/users.
    Email and password fields has a validation. Upon successful authorization, the app enters the authentized user state and sends a request to the URL: https://jsonplaceholder.typicode.com/users.


    При ошибке отображается страница ошибки загрузки данных с возможностью обновить страницу(повторный запрос).
    If an error occurs, the data loading error page is dispaled with the option to refresh the page(repeat request).
    
    
    Успешный статус запроса возвращает данные, которые преобразуются и отображаются в виде списка на экране пользователя. Есть обратный переход в состояние авторизации с помощью logout.
    Susseccfull request status returns the data that is converted and represented as a list on the user's screen. There is a reverse transition to the authorization state using a logout.

__________________________________________

Installing(Установка):
1. git clone https://github.com/lelsweyr17/SURF-test.git demo_app
2. flutter pub get
3. get packages
4. start with Android/iOS/GoogleChroom Simulator
5. feel free to do whatever you want to do
