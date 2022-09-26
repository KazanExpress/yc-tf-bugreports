# PostgreSQL

Версия провайдера: v0.80
Суть проблемы: При попытке удалить юзера в кластере созданного в 71 версии удаляется весь кластер.

## Шаги к воспроизведению

1. `terraform init`
2. Задайте `yc_*` переменные через переменные окружения или `*.tfvars`
3. Запустите `terraform apply` и создайте кластер
4. Удалите или закомментируйте пользоваталя и базу в коде
<img width="450" alt="изображение" src="https://user-images.githubusercontent.com/7482065/192263902-9cd74d8c-ee7b-4c59-a0ba-7263a9f4d578.png">

5. Поправьте версию в provider.tf на 0.80
6. Запустите `terraform init -upgrade`
7. Запустите `terraform apply` и получите ошибку
<img width="1144" alt="изображение" src="https://user-images.githubusercontent.com/7482065/192263529-488493ae-b307-4e4d-a875-4cb44a0a393b.png">