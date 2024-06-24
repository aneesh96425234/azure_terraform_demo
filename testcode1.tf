

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.80.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "717510e4-fb7a-4ad7-ba29-f06997b12ab2"
  tenant_id = "72cdb108e-2b05-47ea-89db-e5fbf43afaba"
  client_id = "b68c0e5c-9794c-4fb7-9584-4e4cd939637e"
  client_secret = "JEh8Q~OdHiqPWZtN94bEjkkkgu0Qb0LDtB6s-KsebDq"
  features {    
  }
}


resource "azurerm_resource_group" "test" {
  name     = "MyRG"
  location = "East US"
}


resource "azurerm_storage_account" "storage" {
  name                     = "payikadan"
  resource_group_name      = "MyRG"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
 
}

resource "azurerm_storage_container" "example" {
  name                  = "demo"
  storage_account_name  = "payikadan"
  container_access_type = "container"
}

resource "azurerm_storage_blob" "blob" {
  name                   = "azure_sanjay_1.tf"
  storage_account_name   = "payikadan"
  storage_container_name = "demo"
  type                   = "Block"
  source                 = "azure_sanjay_1.tf"
}

