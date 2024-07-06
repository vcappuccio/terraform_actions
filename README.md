# Terraform Plan and Apply Output

This document captures the output of the Terraform plan and apply operations for the "getting-started" workspace in HCP Terraform.

## Overview

- **Workspace**: getting-started
- **Platform**: HCP Terraform
- **Execution Method**: Terraform CLI

## Terraform Plan

### Command
```bash
terraform plan -var="provider_token=<REDACTED>"
```

### Output Summary

```
Terraform will perform the following actions:

  + fakewebservices_database.prod_db
  + fakewebservices_load_balancer.primary_lb
  + fakewebservices_server.servers[0]
  + fakewebservices_server.servers[1]
  + fakewebservices_vpc.primary_vpc

Plan: 5 to add, 0 to change, 0 to destroy.
```

### Detailed Resource Changes

#### 1. fakewebservices_database.prod_db
```hcl
+ resource "fakewebservices_database" "prod_db" {
    + id   = (known after apply)
    + name = "Production DB"
    + size = 256
  }
```

#### 2. fakewebservices_load_balancer.primary_lb
```hcl
+ resource "fakewebservices_load_balancer" "primary_lb" {
    + id      = (known after apply)
    + name    = "Primary Load Balancer"
    + servers = [
        + "Server 1",
        + "Server 2",
      ]
  }
```

#### 3. fakewebservices_server.servers[0]
```hcl
+ resource "fakewebservices_server" "servers" {
    + id   = (known after apply)
    + name = "Server 1"
    + type = "t2.micro"
    + vpc  = "Primary VPC"
  }
```

#### 4. fakewebservices_server.servers[1]
```hcl
+ resource "fakewebservices_server" "servers" {
    + id   = (known after apply)
    + name = "Server 2"
    + type = "t2.micro"
    + vpc  = "Primary VPC"
  }
```

#### 5. fakewebservices_vpc.primary_vpc
```hcl
+ resource "fakewebservices_vpc" "primary_vpc" {
    + cidr_block = "0.0.0.0/1"
    + id         = (known after apply)
    + name       = "Primary VPC"
  }
```

## Terraform Apply

### Command
```bash
terraform apply -var="provider_token=<REDACTED>"
```

### Output
```
Running apply in HCP Terraform. Output will stream here. Pressing Ctrl-C
will cancel the remote apply if it's still pending. If the apply started it
will stop streaming the logs, but will not stop the apply running remotely.
Preparing the remote apply...
To view this run in a browser, visit:
https://app.terraform.io/app/VoidHarvester/getting-started/runs/run-Q8dUDVYJHgNby1wS
Waiting for the plan to start...
Terraform v1.9.1
on linux_amd64
Initializing plugins and modules...
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
  + create
Terraform will perform the following actions:
  # fakewebservices_database.prod_db will be created
  + resource "fakewebservices_database" "prod_db" {
      + id   = (known after apply)
      + name = "Production DB"
      + size = 256
    }
  # fakewebservices_load_balancer.primary_lb will be created
  + resource "fakewebservices_load_balancer" "primary_lb" {
      + id      = (known after apply)
      + name    = "Primary Load Balancer"
      + servers = [
          + "Server 1",
          + "Server 2",
        ]
    }
  # fakewebservices_server.servers[0] will be created
  + resource "fakewebservices_server" "servers" {
      + id   = (known after apply)
      + name = "Server 1"
      + type = "t2.micro"
      + vpc  = "Primary VPC"
    }
  # fakewebservices_server.servers[1] will be created
  + resource "fakewebservices_server" "servers" {
      + id   = (known after apply)
      + name = "Server 2"
      + type = "t2.micro"
      + vpc  = "Primary VPC"
    }
  # fakewebservices_vpc.primary_vpc will be created
  + resource "fakewebservices_vpc" "primary_vpc" {
      + cidr_block = "0.0.0.0/1"
      + id         = (known after apply)
      + name       = "Primary VPC"
    }
Plan: 5 to add, 0 to change, 0 to destroy.
Do you want to perform these actions in workspace "getting-started"?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.
  Enter a value: yes
fakewebservices_vpc.primary_vpc: Creating...
fakewebservices_database.prod_db: Creating...
fakewebservices_database.prod_db: Creation complete after 0s [id=fakedb-tzBvX4z62AdSyRU1]
fakewebservices_vpc.primary_vpc: Creation complete after 0s [id=fakevpc-1pkZjFGftih2Mhsx]
fakewebservices_server.servers[1]: Creating...
fakewebservices_server.servers[0]: Creating...
fakewebservices_server.servers[1]: Creation complete after 1s [id=fakeserver-Lugk5C2dmFrdJrNN]
fakewebservices_server.servers[0]: Creation complete after 1s [id=fakeserver-F4pY6QQ4e3ZsWJh9]
fakewebservices_load_balancer.primary_lb: Creating...
fakewebservices_load_balancer.primary_lb: Creation complete after 0s [id=fakelb-umQUjGP9fyfEW3oN]
Apply complete! Resources: 5 added, 0 changed, 0 destroyed.
```

### Summary of Changes
- Resources Created: 5
- Resources Changed: 0
- Resources Destroyed: 0

### Resource Creation Details
1. fakewebservices_vpc.primary_vpc
   - ID: fakevpc-1pkZjFGftih2Mhsx
2. fakewebservices_database.prod_db
   - ID: fakedb-tzBvX4z62AdSyRU1
3. fakewebservices_server.servers[1]
   - ID: fakeserver-Lugk5C2dmFrdJrNN
4. fakewebservices_server.servers[0]
   - ID: fakeserver-F4pY6QQ4e3ZsWJh9
5. fakewebservices_load_balancer.primary_lb
   - ID: fakelb-umQUjGP9fyfEW3oN

## Notes
- The apply operation was executed in HCP Terraform.
- The user was prompted for confirmation before applying changes.
- All resources were successfully created without any errors.

## Security Notice

**Important**: The provider token was hardcoded in this example for demonstration purposes. This practice is not recommended for production environments. The token used in this demo has been revoked.