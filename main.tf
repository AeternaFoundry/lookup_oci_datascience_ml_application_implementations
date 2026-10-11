data "oci_datascience_ml_application_implementations" "datascience_ml_application_implementations_lookup" {
  for_each = var.datascience_ml_application_implementations_lookup

  compartment_id                   = each.value.compartment_id
  compartment_id_in_subtree        = each.value.compartment_id_in_subtree
  ml_application_id                = each.value.ml_application_id
  ml_application_implementation_id = each.value.ml_application_implementation_id
  name                             = each.value.name
  state                            = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

