output "assignment_id" {
  value = azurerm_subscription_policy_assignment.asb.id
}

output "gcpvm_assignment_id" {
  value = azurerm_subscription_policy_assignment.cismaf.id
}

output "nist_assignment_id" {
  value = azurerm_subscription_policy_assignment.nist.id
}
