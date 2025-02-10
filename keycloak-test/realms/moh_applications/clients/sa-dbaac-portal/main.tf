module "payara-client" {
  source                             = "../../../../../modules/payara-client"
  base_url                           = ""
  claim_name                         = "roles"
  client_id                          = "SA-DBAAC-PORTAL"
  client_name                        = "SA DBAAC Portal"
  client_role_mapper_add_to_id_token = true
  client_role_mapper_add_to_userinfo = true
  description                        = "Special Authority Drug Benefit Adjudication Advisory Committee Community Portal"
  mapper_name                        = "SA-DBAAC-PORTAL Roles"
  roles = {
    "USER" = {
      "name" = "USER"
    },
  }
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://pwcdev-bchealth.cs142.force.com/DBAACEC/services/authcallback/Login_with_IDIR_DBAACEC",
    "https://staging-bchealth.cs148.force.com/DBAACEC/services/authcallback/Login_with_IDIR_DBAACEC",
    "https://staging-bchealth.cs148.sandbox.my.site.com/DBAACEC/services/authcallback/Login_with_IDIR_DBAACEC",
    "https://bchealth--satdevorg.sandbox.my.salesforce.com/*",
    "https://bchealth--satdev1.sandbox.my.salesforce.com/*",
    "https://bchealth--satdev1.sandbox.my.site.com/*",
  ]
  authentication_flow_binding_override_browser_id = var.browser_idp_restriction_flow
  login_theme                                     = "moh-app-realm-idp-restriction"
}
resource "keycloak_openid_user_session_note_protocol_mapper" "IDP" {
  add_to_id_token  = true
  claim_name       = "identity_provider"
  claim_value_type = "String"
  client_id        = module.payara-client.CLIENT.id
  name             = "IDP"
  realm_id         = module.payara-client.CLIENT.realm_id
  session_note     = "identity_provider"
}

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = module.payara-client.CLIENT.realm_id
  client_id = module.payara-client.CLIENT.id
  default_scopes = [
    "idir_aad",
    "profile",
    "email",
    "roles"
  ]
}
