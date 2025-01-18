module "random_pet" {
  source = "./modules/random-pet"
}

resource "local_file" "foo" {
  content  = "foo!"
  filename = "${path.module}/foo.bar"
}

locals {
  ts = plantimestamp()
}

// NOTE: always force a change.
resource "null_resource" "this" {
  triggers = {
    timestamp = local.ts
  }
}

variable "ci_project_name" {
  type    = string
  default = "default"
}

variable "test_variable" {
  type    = string
  default = "default value"
}

output "project_name" {
  value = var.ci_project_name
}

output "test_variable" {
  value = var.test_variable
}

output "this_always_changes" {
  value = local.ts
}
