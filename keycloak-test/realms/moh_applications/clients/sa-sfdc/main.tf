module "payara-client" {
  source                             = "../../../../../modules/payara-client"
  base_url                           = ""
  claim_name                         = "roles"
  client_id                          = "SA-SFDC"
  client_name                        = "Special Authority"
  client_role_mapper_add_to_id_token = true
  client_role_mapper_add_to_userinfo = true
  description                        = "Sales Force Pharmacare Special Authority"
  mapper_name                        = "SA-SFDC Roles"
  roles = {
    "MOH_USER" = {
      "name" = "MOH_USER"
    },
    "SA_ADMINISTRATOR" = {
      "name" = "SA_ADMINISTRATOR"
    },
    "SA_DRUG_MANAGER" = {
      "name" = "SA_DRUG_MANAGER"
    },
    "SA_REPORTS_DASHBOARD" = {
      "name" = "SA_REPORTS_DASHBOARD"
    },
  }
  service_accounts_enabled = false
  valid_redirect_uris = [
    "https://bchealth--pwcdev.my.salesforce.com/services/authcallback/Login_with_IDIR",
    "https://bchealth--staging.my.salesforce.com/services/authcallback/Login_with_IDIR",
    "https://bchealth--staging.sandbox.my.salesforce.com/services/authcallback/Login_with_IDIR",
    "https://bchealth--staging.sandbox.my.site.com/services/authcallback/Login_with_IDIR",
    "https://bchealth--satqa.sandbox.my.salesforce.com/*",
    "https://bchealth--satdevorg.sandbox.my.salesforce.com/*",
    "https://bchealth--satdev1.sandbox.my.salesforce.com/*",
    "https://bchealth--edrddev2.sandbox.my.salesforce.com/"
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