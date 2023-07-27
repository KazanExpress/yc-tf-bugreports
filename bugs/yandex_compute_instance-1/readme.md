# PostgreSQL

Версия провайдера: v0.95.0

Суть проблемы: При попытке увеличения boot disk size через terraform - пересоздается вся машина. Если увеличивать disk в ui, такого поведения не наблюдается.

## Шаги к воспроизведению

1. `terraform init`
2. Задайте `yc_*` переменные через переменные окружения или `*.tfvars`
3. Запустите `terraform apply` и создайте compute instance
4. Увеличьте disk_size
<img width="524" alt="image" src="https://github.com/KazanExpress/yc-tf-bugreports/assets/24591578/401a979e-40d8-4633-8dbe-2116ce712124">

5. Запустите `terraform apply` и получите план с тем, что машина будет пересоздана
<img width="667" alt="image" src="https://github.com/KazanExpress/yc-tf-bugreports/assets/24591578/80607eb8-bb74-4f8b-be26-ae3fa769d85c">

6. Попробуйте увеличить диск данного compute instance в ui:
   - Остановите compute instance для изменения конфигурации
   - Перейдите на вкладку с диском и увеличьте диск
    <img width="1455" alt="image" src="https://github.com/KazanExpress/yc-tf-bugreports/assets/24591578/dd0a3374-ae0a-4c7c-ae86-81141062ba48">
    <img width="802" alt="image" src="https://github.com/KazanExpress/yc-tf-bugreports/assets/24591578/b4d1ac60-7af2-4de2-b612-989a3360cd5c">
  - Запустите compute instance
