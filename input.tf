variable "resource_group" {
  type={
    name=string
    location=string
  }
  description = "resuogroup"
  default = {
    name="k8sgroup"
    location="eastus"
  }
}
variable "azure_cluster" {
    type = object({
      name = string
      dns_prefix=string
      vm_size=string
      node_count=number
    })
  
}
