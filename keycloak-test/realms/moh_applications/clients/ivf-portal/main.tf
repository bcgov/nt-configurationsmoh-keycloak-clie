resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "IVF-PORTAL"
  consent_required                    = false
  description                         = "IVF Portal is an application management system to effectively handle IVF application volumes"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "IVF Portal"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = false
  valid_redirect_uris = [
    "https://bcministryofhealth-ivfportal--ivfdev.sandbox.my.salesforce.com/*",
    "https://bcministryofhealth-ivfportal--ivfqa.sandbox.my.salesforce.com/*"
  ]
  web_origins = [
  ]
  authentication_flow_binding_overrides {
    browser_id = var.browser_idp_restriction_flow
  }
  login_theme = "moh-app-realm-idp-restriction"
}

resource "keycloak_openid_user_client_role_protocol_mapper" "Client-Role-Mapper-IVF" {
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = "IVF-PORTAL"
  name                        = "Client Role Mapper for IVF"
  claim_name                  = "roles"
  multivalued                 = true
  claim_value_type            = "String"
  add_to_id_token             = true
  add_to_access_token         = true
  add_to_userinfo             = true
}


resource "keycloak_openid_user_session_note_protocol_mapper" "IDP" {
  add_to_id_token     = true
  add_to_access_token = true
  claim_name          = "identity_provider"
  claim_value_type    = "String"
  client_id           = keycloak_openid_client.CLIENT.id
  name                = "IDP"
  realm_id            = keycloak_openid_client.CLIENT.realm_id
  session_note        = "identity_provider"
}

module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "clinic-admin" = {
      "name"        = "clinic-admin"
      "description" = ""
    },
    "bdsb-admin" = {
      "name"        = "bdsb-admin"
      "description" = ""
    },
  }
}

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  default_scopes = [
    "bcprovider_aad",
    "idir_aad",
    "profile",
    "email"
  ]
}
