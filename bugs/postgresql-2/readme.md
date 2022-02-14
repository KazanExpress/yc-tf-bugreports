# PostgreSQL

Версия провайдера: v0.71
Суть проблемы: при добавлении нового пользователя в середину между другими пользователями. Пользователь создается некоректно и меняется пароль другого юзера.

## Шаги к воспроизведению

1. `git checkout `
2. `terraform init`
3. Задайте `yc_*` переменные через переменные окружения или `*.tfvars`
4. Запустите `terraform apply`
5. Удостоверьтесь что можно подключиться к базе используя любого пользователя:
<img width="994" alt="изображение" src="https://user-images.githubusercontent.com/7482065/153888277-1c2c805c-30dc-427c-b3ab-9808bea397ee.png">
6. Запустите `git checkout `. Это поменяет файл `postgresql-2/main.tf` добавив нового пользователя `useruser2` между `owner` и `useruser1`
7. Запустите `terraform plan` и увидите первую проблему: у пользователя `useruser1` меняется `name` и `password` и добавляется новый пользователь с таким же названием `useruser1`.
<img width="551" alt="изображение" src="https://user-images.githubusercontent.com/7482065/153888715-262b499c-8e90-4f44-bf39-1b8865cd9116.png">
8. Запустите `terraform apply`:
<img width="808" alt="изображение" src="https://user-images.githubusercontent.com/7482065/153890638-861a4d7b-678a-44db-bc3c-30c8f1b046bf.png">
9. Попробуйте подключиться к базе используя пользователей `useruser1` и `useruser2`. Это не получится сделать используя заданные пароли. У `useruser1` теперь пароль от `useruser2` а у `useruser2` вообще нет доступа к базе (см скрин из облака):
<img width="986" alt="изображение" src="https://user-images.githubusercontent.com/7482065/153894548-0fa65fe6-66d9-413c-b17d-39f916760cd0.png">
<img width="661" alt="изображение" src="https://user-images.githubusercontent.com/7482065/153890804-c156a80c-129a-4f73-bf5b-1988f0a81866.png">
10. Цирк продолжается. Запустите `terraform plan` еще раз и увидите что там есть изменения. Хотя бы только что сделали `apply` и ничего не меняли:
<img width="894" alt="изображение" src="https://user-images.githubusercontent.com/7482065/153890989-b433e711-a8f3-4ef4-8a4b-ad5662df6fbf.png">
11. Примененяем эти изменения `terraform apply`
12. Проверяем доступы:
<img width="980" alt="изображение" src="https://user-images.githubusercontent.com/7482065/153891786-b5979089-054e-4eb4-8f13-8edd3b4d6d5e.png">
И вуаля! Все работает как надо. Но пришлось запустить `apply` 2 раза в место одного. И попути мы поменяли пароль от другого пользователя