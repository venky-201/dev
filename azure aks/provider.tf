terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
 backend "azurerm" {
    resource_group_name  = "StorageAccount-backend"  # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "cluster storage"                      # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "state"                       # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "workshop.tfstate"        # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}
provider "azurerm" {yujgi   h10, 
  features {
    
  }
}