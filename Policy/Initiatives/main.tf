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

resource "azurerm_subscription_policy_assignment" "azuremonitorVMs" {
  name                 = "azuremonitorvm"
  subscription_id      = var.cust_scope
  policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/9dffaf29-5905-4145-883c-957eb442c226"
  description          = "Enable Azure Monitor for the virtual machines (VMs) with AMA. Takes Log Analytics workspace as parameter and asks for an option to enable Processes and Dependencies."
  display_name         = "[Preview]: Enable Azure Monitor for VMs with Azure Monitoring Agent(AMA)"
}
