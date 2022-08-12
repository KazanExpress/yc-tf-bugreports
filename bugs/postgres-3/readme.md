# PostgreSQL

Версия провайдера: v0.77
Суть проблемы: при добавлении нового пользователя с `login=false` и `conn_limit=0` используя ресурс `yandex_mdb_postgresql_user` при повторном apply выводит что будет изменение `login=true => login=false` & `conn_limit=50=>conn_limit=0`

## Шаги к воспроизведению

2. `terraform init`
3. Задайте `yc_*` переменные через переменные окружения или `*.tfvars`
4. Запустите `terraform apply`
5. Видно что юзер создается с `login=false`:
<img width="1002" alt="изображение" src="https://user-images.githubusercontent.com/7482065/184383501-f7d5eadc-291f-486c-88b3-511f1ff28240.png">
6.  Запустите `terraform apply` еще раз  и увидите
<img width="994" alt="изображение" src="https://user-images.githubusercontent.com/7482065/184383672-57c2d261-a530-4a41-9cc5-e3781fa0b3cf.png">