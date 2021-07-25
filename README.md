# test_login

Демо приложение с локальной авторизацией и запросом сеть.
Demo app with local authentication and sending request.

<img width="300" alt="Screen Shot 2021-07-25 at 12 53 23 PM" src="https://user-images.githubusercontent.com/74770909/126895177-d582e849-3e43-4128-83d7-6f0edbd044d5.png">

Описание(Describtion):

    Поля авторизации email и пароль имеют валидацию.
    Email and password fields has a validation.
    
    <img width="300" alt="Screen Shot 2021-07-25 at 12 53 43 PM" src="https://user-images.githubusercontent.com/74770909/126895195-8f4de3c4-637e-4021-b464-d8be12667e79.png">
    
    При успешной авторизации приложение переходит в состояние авторизованного пользователя и отправляет запрос на URL: https://jsonplaceholder.typicode.com/users.
    Email and password fields has a validation. Upon successful authorization, the app enters the authentized user state and sends a request to the URL: https://jsonplaceholder.typicode.com/users.
       
    При ошибке отображается страница ошибки загрузки данных с возможностью обновить страницу(повторный запрос).
    If an error occurs, the data loading error page is dispaled with the option to refresh the page(repeat request).
    
    <img width="300" alt="Screen Shot 2021-07-25 at 12 59 50 PM" src="https://user-images.githubusercontent.com/74770909/126895242-18d5f4e6-d096-44a3-b066-5d0f4ce1d00c.png">
           
    Успешный статус запроса возвращает данные, которые преобразуются и отображаются в виде списка на экране пользователя. Есть обратный переход в состояние авторизации с помощью logout.
    Susseccfull request status returns the data that is converted and represented as a list on the user's screen. There is a reverse transition to the authorization state using a logout.
    
    <img width="300" alt="Screen Shot 2021-07-25 at 12 54 15 PM" src="https://user-images.githubusercontent.com/74770909/126895221-b0ae9ae8-f107-49f8-ae23-7b0cb6ababd3.png">

__________________________________________

Installing(Установка):
1. git clone https://github.com/lelsweyr17/SURF-test.git demo_app
2. flutter pub get
3. get packages
4. start with Android/iOS/GoogleChroom Simulator
5. feel free to do whatever you want to do
