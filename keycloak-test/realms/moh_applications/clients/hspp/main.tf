resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = ""
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "HSPP"
  consent_required                    = false
  description                         = "The Health System Performance Portal (HSPP) provides a panoramic analytical view of the health system in British Columbia across the four pillars of the Performance Management Framework"
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "HSPP"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = true
  valid_redirect_uris = [
    "http://localhost:*",
    "https://localhost:*",
    "https://uathspp.hlth.gov.bc.ca/*",
    "https://devhspp.healthideas.gov.bc.ca/*",
    "https://devsecure.healthideas.gov.bc.ca/*",
    "https://moh-dms-m-sit-as-hspp.azurewebsites.net/*",
    "https://sithspp.hlth.gov.bc.ca/*",
    "https://uathspp.healthideas.gov.bc.ca/*",
    "https://devhspp.hlth.gov.bc.ca/*",
  ]
  web_origins = [
  ]
}

resource "keycloak_openid_user_client_role_protocol_mapper" "client_role_mapper" {
  add_to_access_token         = true
  add_to_id_token             = true
  claim_name                  = "roles"
  claim_value_type            = "String"
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = "HSPP"
  multivalued                 = true
  name                        = "client roles"
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_attribute_protocol_mapper" "idir_displayName" {
  add_to_id_token = true
  add_to_userinfo = true
  claim_name      = "idir_displayName"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "idir_displayName"
  user_attribute  = "idir_displayName"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_user_attribute_protocol_mapper" "idir_mailboxOrgCode" {
  add_to_id_token = true
  add_to_userinfo = true
  claim_name      = "idir_mailboxOrgCode"
  client_id       = keycloak_openid_client.CLIENT.id
  name            = "idir_mailboxOrgCode"
  user_attribute  = "idir_mailboxOrgCode"
  realm_id        = keycloak_openid_client.CLIENT.realm_id
}

module "client-roles" {
  source    = "../../../../../modules/client-roles"
  client_id = keycloak_openid_client.CLIENT.id
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  roles = {
    "HI_Administrator" = {
      "name" = "HI_Administrator"
    },
    "HSPP_ALL" = {
      "name" = "HSPP_ALL"
    },
    "HSPP_HumanResource" = {
      "name" = "HSPP_HumanResource"
    },
    "HSPP_OKR" = {
      "name" = "HSPP_OKR"
    },
    "HSPP_ReportProgram_All" = {
      "name" = "HSPP_ReportProgram_All"
    },
    "HSPP_ReportProgram_Invictus" = {
      "name" = "HSPP_ReportProgram_Invictus"
    },
    "HSPP_ReportProgram_OKR" = {
      "name" = "HSPP_ReportProgram_OKR"
    },
    "HSPP_ReportSection_All" = {
      "name" = "HSPP_ReportSection_All"
    },
    "HSPP_ReportSection_Invictus" = {
      "name" = "HSPP_ReportSection_Invictus"
    },
    "HSPP_ReportSection_OKR" = {
      "name" = "HSPP_ReportSection_OKR"
    },
    "HSPP_Report_Invictus" = {
      "name" = "HSPP_Report_Invictus"
    },
    "HSPP_Restricted_ACFT" = {
      "name" = "HSPP_Restricted_ACFT"
    },
    "HSPP_Restricted_CVC" = {
      "name" = "HSPP_Restricted_CVC"
    },
    "HSPP_Restricted_ED" = {
      "name" = "HSPP_Restricted_ED"
    },
    "HSPP_Restricted_LFP" = {
      "name" = "HSPP_Restricted_LFP"
    },
    "HSPP_Restricted_MHAD" = {
      "name" = "HSPP_Restricted_MHAD"
    },
    "HSPP_Restricted_PCR" = {
      "name" = "HSPP_Restricted_PCR"
    },
    "HSPP_Restricted_PEP" = {
      "name" = "HSPP_Restricted_PEP"
    },
    "HSPP_Restricted_SAN" = {
      "name" = "HSPP_Restricted_SAN"
    },
    "HSPP_Restricted_UPCC" = {
      "name" = "HSPP_Restricted_UPCC"
    },
    "HSPP_Restricted_UserStatistics" = {
      "name" = "HSPP_Restricted_UserStatistics"
    },
  }
}