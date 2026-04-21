terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.4.0"
    }
  }
}

resource "local_file" "capstone_log" {
  filename = "${path.module}/capstone.txt"
  content  = "Capstone executed successfully"
}