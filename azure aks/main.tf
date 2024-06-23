resource "azurerm_resource_group" "this" {
    name=var.resource_group.name
    location = var.resource_group.location
    tags = {
      createdby="terraform"
    } 
}
resource "azurerm_kubernetes_cluster" "this" {
  name                = "workshop-${terraform.workspace}"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  dns_prefix          = "lt-${terraform.workspace}"

  default_node_pool {
    name       = var.azure_cluster.name
    node_count = var.azure_cluster.number
    vm_size    = var.azure_cluster.vm_size
  }
}
resource "azurerm_kubernetes_cluster_node_pool" "this" {
  name                  = "internal"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.this.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 1

  tags = {
    Environment = "Production"
  }
}