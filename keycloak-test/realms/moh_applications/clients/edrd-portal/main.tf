resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "300"
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "EDRD-PORTAL"
  consent_required                    = false
  description                         = "Expensive Drugs for Rare Disease - Portal for Prescribers"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "EDRD-PORTAL"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = false
  valid_redirect_uris = [
    "https://bchealth--edrddev.sandbox.my.site.com/*",
    "https://bchealth--edrdqa.sandbox.my.site.com/*",
    "https://bchealth--staging.sandbox.my.site.com/edrdportal/*",
    "https://bchealth--edrddev2.sandbox.my.salesforce.com/",
    "https://bchealth--edrddev2.sandbox.my.site.com/edrdportal/*"
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
    "EDRD_Reviewers" = {
      "name" = "EDRD_Reviewers"
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
  client_id_for_role_mappings = "EDRD-PORTAL"
  multivalued                 = true
  name                        = "client roles"
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
}


resource "keycloak_openid_user_attribute_protocol_mapper" "cpn" {
  add_to_id_token     = true
  add_to_userinfo     = true
  add_to_access_token = true
  claim_name          = "common_provider_number"
  client_id           = keycloak_openid_client.CLIENT.id
  name                = "cpn"
  user_attribute      = "common_provider_number"
  realm_id            = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_client_role_protocol_mapper" "Client-Role-Mapper-LICENCE-STATUS" {
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = "LICENCE-STATUS"
  name                        = "Client Role Mapper for LICENCE-STATUS"
  claim_name                  = "roles"
  multivalued                 = true
  claim_value_type            = "String"
  add_to_id_token             = true
  add_to_access_token         = true
  add_to_userinfo             = true
}

module "scope-mappings" {
  source    = "../../../../../modules/scope-mappings"
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  roles = {
    "LICENCE-STATUS/MOA"          = var.LICENCE-STATUS.ROLES["MOA"].id
    "LICENCE-STATUS/PRACTITIONER" = var.LICENCE-STATUS.ROLES["PRACTITIONER"].id
    "LICENCE-STATUS/MD"           = var.LICENCE-STATUS.ROLES["MD"].id
    "LICENCE-STATUS/RNP"          = var.LICENCE-STATUS.ROLES["RNP"].id
  }
}

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  default_scopes = [
    "bcprovider_aad",
    "profile",
    "email"
  ]
}
