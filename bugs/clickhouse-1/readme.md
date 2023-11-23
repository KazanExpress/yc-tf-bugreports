# Clickhouse

Версия провайдера: v0.102.0

Суть проблемы: При изменении пароля пользователя clickhouse происходит пересоздание пользователя (удаление а потом создание).

## Шаги к воспроизведению

1. `terraform init`
2. Задайте `yc_*` переменные через переменные окружения или `*.tfvars`
3. Запустите `terraform apply` и создайте кластер clickhouse
4. Измените пароль

<img width="593" alt="new-pass" src="https://github.com/KazanExpress/yc-tf-bugreports/assets/137285155/f67f8242-dd73-4e2c-a4e0-9218335d29f5">

5. Запустите `terraform plan` и получите план с тем, что пользователь будет пересоздан

<img width="688" alt="plan-new_pass" src="https://github.com/KazanExpress/yc-tf-bugreports/assets/137285155/5d4ab0c4-6db1-428a-958c-0861b35332c7">
