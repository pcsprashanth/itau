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

resource "azurerm_subscription_policy_assignment" "asb" {
  name                 = "Azure-Security-BenchMark"
  subscription_id      = var.cust_scope
  policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/1f3afdf9-d0c9-4c3d-847f-89da613e70a8"
  description          = "The Azure Security Benchmark initiative represents the policies and controls implementing security recommendations defined in Azure Security Benchmark v3, see https://aka.ms/azsecbm. This also serves as the Microsoft Defender for Cloud default policy initiative. You can directly assign this initiative, or manage its policies and compliance results within Microsoft Defender for Cloud."
  display_name         = "Azure Security Benchmark"
}



resource "azurerm_subscription_policy_assignment" "cismaf" {
  name                 = "CIS-Microsoft-Azure"
  subscription_id      = var.cust_scope
  policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/1a5bb27d-173f-493e-9568-eb56638dde4d"
  description          = "This initiative adds a system-assigned managed identity and deploys the platform-appropriate Guest Configuration extension to virtual machines that are eligible to be monitored by Guest Configuration policies. This is a prerequisite for all Guest Configuration policies and must be assigned to the policy assignment scope before using any Guest Configuration policy. For more information on Guest Configuration, visit https://aka.ms/gcpol."
  display_name         = "CIS Microsoft Azure Foundations Benchmark v1.1.0"
}

