resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "300"
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "EDRD"
  consent_required                    = false
  description                         = "Expensive Drugs for Rare Disease - Case Management"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "EDRD"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = false
  valid_redirect_uris = [
    "https://bchealth--edrddev.sandbox.my.salesforce.com/*",
    "https://bchealth--edrdqa.sandbox.my.salesforce.com/*",
    "https://bchealth--staging.sandbox.my.salesforce.com/*",
    "https://bchealth--edrddata01.sandbox.my.salesforce.com/*",
    "https://bchealth--edrddev2.sandbox.my.salesforce.com/*",
    "https://bchealth--edrduat.sandbox.my.salesforce.com/*"
  ]
  web_origins = [
  ]
  authentication_flow_binding_overrides {
    #browser-idp-restriction flow
    browser_id = var.browser_idp_restriction_flow
  }
  login_theme = "moh-app-realm-idp-restriction"
}
module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "EDRD_PHSA_PSP_Staff" = {
      "name" = "EDRD_PHSA_PSP_Staff"
    },
    "EDRD_MoH_Staff" = {
      "name" = "EDRD_MoH_Staff"
    },
    "EDRD_Physicians" = {
      "name" = "EDRD_Physicians"
    },
    "EDRD_Super_Users" = {
      "name" = "EDRD_Super_Users"
    },
  }
}
resource "keycloak_openid_user_client_role_protocol_mapper" "client_role_mapper" {
  add_to_access_token         = true
  add_to_id_token             = true
  add_to_userinfo             = true
  claim_name                  = "roles"
  claim_value_type            = "String"
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = "EDRD"
  multivalued                 = true
  name                        = "client roles"
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  default_scopes = [
    "idir_aad",
    "phsa",
    "profile",
    "email"
  ]
}
