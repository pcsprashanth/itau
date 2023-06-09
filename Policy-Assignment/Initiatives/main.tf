terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.23.0"
    }
  }
}
provider "azurerm" {
  features {}
}
data "azurerm_management_group" "example_parent" {
  display_name = "itaudev"
}
resource "azurerm_management_group_policy_assignment" "asb" {
  name                 = "Cloud-BenchMark"
  management_group_id  = data.azurerm_management_group.example_parent.id
  policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/1f3afdf9-d0c9-4c3d-847f-89da613e70a8"
  description          = "The Azure Security Benchmark initiative represents the policies and controls implementing security recommendations defined in Azure Security Benchmark v3, see https://aka.ms/azsecbm. This also serves as the Microsoft Defender for Cloud default policy initiative. You can directly assign this initiative, or manage its policies and compliance results within Microsoft Defender for Cloud."
  display_name         = "Microsoft Cloud Security Benchmark"
}
