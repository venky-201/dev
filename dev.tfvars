resource_group ={
    name="test"
    location="eastus"
}
azure_cluster = {
  name = "azk8s"
  dns_prefix = "dev-default"
  node_count = 3
  vm_size = "Standard_D2_v2"
}