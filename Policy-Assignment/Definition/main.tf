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

resource "azurerm_subscription_policy_assignment" "dds" {
  name                 = "Deploy-Diagnostic-Setting"
  subscription_id      = var.cust_scope
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/2465583e-4e78-4c15-b6be-a36cbc7c8b0f"
  description          = "Deploys the diagnostic settings for Azure Activity to stream subscriptions audit logs to a Log Analytics workspace to monitor subscription-level events"
  display_name         = "Configure Azure Activity logs to stream to specified Log Analytics workspace"
}

