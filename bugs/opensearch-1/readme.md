# OpenSearch

Версия провайдера: v0.105.0

Суть проблемы: При попытке увеличения disk size у какой-либо node group'ы через terraform - в плане высвечивается пересоздание node group. Если применить изменения, то node group не пересоздается. Было бы классно видеть пересоздание node group только тогда, когда это действительно случается - изменение названия node group, например

## Шаги к воспроизведению

1. `terraform init`
2. Задайте `yc_*` переменные через переменные окружения или `*.tfvars`
3. Запустите `terraform apply` и создайте opensearch cluster
4. Увеличьте disk_size у node group с именем opensearch-nodes

5. Запустите `terraform plan` и получите план с тем, что node group c именем opensearch-nodes будет пересоздана
