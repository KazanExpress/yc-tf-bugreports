# PostgreSQL

Версия провайдера: v0.95.0
Суть проблемы: При попытке увеличения boot disk size - пересоздается вся машина.
## Шаги к воспроизведению

1. `terraform init`
2. Задайте `yc_*` переменные через переменные окружения или `*.tfvars`
3. Запустите `terraform apply` и создайте compute instance
4. Увеличьте disk_size
<img width="524" alt="image" src="https://github.com/KazanExpress/yc-tf-bugreports/assets/24591578/401a979e-40d8-4633-8dbe-2116ce712124">

5. Запустите `terraform apply` и получите план с тем, что машина будет пересоздана
<img width="667" alt="image" src="https://github.com/KazanExpress/yc-tf-bugreports/assets/24591578/80607eb8-bb74-4f8b-be26-ae3fa769d85c">
