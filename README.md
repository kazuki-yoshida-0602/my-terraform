# my_terraform

## 実行方法

### インストール

```
$ brew install terraform

$ terraform -v
Terraform v0.11.5
+ provider.aws v1.13.0
```

### 初期化
```
$ cd [実行する環境]
$ terraform init
```
* S3のデータと連携するので、**必ず**行う


### 試験、実行、削除
```
$ terraform plan
$ terraform apply
$ terraform destroy
```

