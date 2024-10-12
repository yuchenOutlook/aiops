# Lab 01 - Terraform basics

## Provision a CVM from tencent cloud, and inside that CVM, install docker

### Step 1: go to [terraform registry](https://registry.terraform.io/) and search for "tencentcloud"

<img src="img/tencentcloud-registry.png" alt="tencentcloud-registry" width="700" height="300"/>

### Step 2: in the documentation section, check the example usage

<img src="img/example-usage.png" alt="example-usage" width="700" height="300"/>

### Step 3: go to your tencent cloud account, create a new user for this demo

<img src="img/demo-user-creation.png" alt="demo-user-creation" width="700" height="300"/>

### Step 4: create a new API key for this user and store that API key and secrets

<img src="img/create-new-api-key.png" alt="create-new-api-key" width="700" height="300"/>

### Step 5: Terraform init, terraform plan, terraform apply -auto-approve

Next run these commands:

```hcl
terraform init
terraform plan
terraform apply -auto-approve
```
<img src="img/set-env.png" alt="set-env" width="700" height="50" />