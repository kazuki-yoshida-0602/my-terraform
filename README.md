# ticket_terraform

## 実行方法

### インストール

```
$ brew install terraform

$ terraform -v
Terraform v0.11.5
+ provider.aws v1.13.0
```

### 事前準備
* 環境変数を設定していないとAWSアカウントを謝ったままapplyする可能性があります。

```
$ AWS_ACCESS_KEY_ID='xxxxxx'
$ AWS_SECRET_ACCESS_KEY='yyyyy'
```

### 初期化
```
$ cd [実行する環境]
$ terraform init
```
* S3のデータと連携するので、**必ず**行ってください。


### 試験、実行
```
$ terraform plan
$ terraform apply
```
* 環境にcdした状態で行ってください。
* DBのパスワードなどのgit管理していない項目は手動入力になります。

