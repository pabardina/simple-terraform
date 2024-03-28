Simple terraform
========

This is a simple terraform repository to create a s3 bucket, push a file inside and display the content of that file throught a terraform output.

There is also a Github action that runs `terraform fmt`.


# How to run it

### Requirements

* terraform v1.5.5

### Customize it

Edit in the `main.tf` file:

```
  backend "s3" {
    bucket = "your-bucket-name-to-store-tfstate"
```

