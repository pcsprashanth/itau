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

resource "azurerm_subscription_policy_assignment" "subnsg" {
  name                 = "Subnet-Should-have-NSG"
  subscription_id      = var.cust_scope
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e71308d3-144b-4262-b144-efdc3cc90517"
  description          = "Protect your subnet from potential threats by restricting access to it with a Network Security Group (NSG). NSGs contain a list of Access Control List (ACL) rules that allow or deny network traffic to your subnet."
  display_name         = "Subnets should be associated with a Network Security Group"
}

