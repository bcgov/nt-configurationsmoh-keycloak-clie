resource "keycloak_openid_client" "CLIENT" {
  access_token_lifespan               = "300"
  access_type                         = "CONFIDENTIAL"
  backchannel_logout_session_required = true
  base_url                            = ""
  client_authenticator_type           = "client-secret"
  client_id                           = "ICY"
  consent_required                    = false
  description                         = "ICY teams goal is to address the mental health and/or substance use needs of children, youth, and their families."
  direct_access_grants_enabled        = false
  enabled                             = true
  frontchannel_logout_enabled         = false
  full_scope_allowed                  = false
  implicit_flow_enabled               = false
  name                                = "Integrated Child and Youth"
  pkce_code_challenge_method          = ""
  realm_id                            = "moh_applications"
  service_accounts_enabled            = false
  standard_flow_enabled               = true
  use_refresh_tokens                  = false
  valid_redirect_uris = [
    "https://bcmohmaid--maiduat.my.salesforce.com/*",
    "https://bcmohmaid--maidqa.my.salesforce.com/*",
    "https://bcmohmaid--maiduat.sandbox.my.salesforce.com/*",
    "https://bcmohmaid--maidqa.sandbox.my.salesforce.com/*",
    "https://bcmohmaid--soseuat.sandbox.my.salesforce.com/*",
    "https://bcmohmaid--soseqa.sandbox.my.salesforce.com/*"
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
    "ICY-Business-Administrator" = {
      "name" = "ICY-Business-Administrator"
    },
    "ICY-Coast-Mountains-Hazelton-Program-Leader" = {
      "name" = "ICY-Coast-Mountains-Hazelton-Program-Leader"
    },
    "ICY-Coast-Mountains-Hazelton-Admin" = {
      "name" = "ICY-Coast-Mountains-Hazelton-Admin"
    },
    "ICY-Coast-Mountains-Hazelton-Non-Clinical-Team-Member" = {
      "name" = "ICY-Coast-Mountains-Hazelton-Non-Clinical-Team-Member"
    },
    "ICY-Coast-Mountains-Hazelton-Clinical-Team-Member" = {
      "name" = "ICY-Coast-Mountains-Hazelton-Clinical-Team-Member"
    },
    "ICY-Coast-Mountains-Terrace-Program-Leader" = {
      "name" = "ICY-Coast-Mountains-Terrace-Program-Leader"
    },
    "ICY-Coast-Mountains-Terrace-Admin" = {
      "name" = "ICY-Coast-Mountains-Terrace-Admin"
    },
    "ICY-Coast-Mountains-Terrace-Non-Clinical-Team-Member" = {
      "name" = "ICY-Coast-Mountains-Terrace-Non-Clinical-Team-Member"
    },
    "ICY-Coast-Mountains-Terrace-Clinical-Team-Member" = {
      "name" = "ICY-Coast-Mountains-Terrace-Clinical-Team-Member"
    },
    "ICY-Comox-Valley-Team-1-Program-Leader" = {
      "name" = "ICY-Comox-Valley-Team-1-Program-Leader"
    },
    "ICY-Comox-Valley-Team-1-Admin" = {
      "name" = "ICY-Comox-Valley-Team-1-Admin"
    },
    "ICY-Comox-Valley-Team-1-Non-Clinical-Team-Member" = {
      "name" = "ICY-Comox-Valley-Team-1-Non-Clinical-Team-Member"
    },
    "ICY-Comox-Valley-Team-1-Clinical-Team-Member" = {
      "name" = "ICY-Comox-Valley-Team-1-Clinical-Team-Member"
    },
    "ICY-Comox-Valley-Team-2-Program-Leader" = {
      "name" = "ICY-Comox-Valley-Team-2-Program-Leader"
    },
    "ICY-Comox-Valley-Team-2-Admin" = {
      "name" = "ICY-Comox-Valley-Team-2-Admin"
    },
    "ICY-Comox-Valley-Team-2-Non-Clinical-Team-Member" = {
      "name" = "ICY-Comox-Valley-Team-2-Non-Clinical-Team-Member"
    },
    "ICY-Comox-Valley-Team-2-Clinical-Team-Member" = {
      "name" = "ICY-Comox-Valley-Team-2-Clinical-Team-Member"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-1-Program-Leader" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-1-Program-Leader"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-1-Admin" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-1-Admin"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-1-Non-Clinical-Team-Member" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-1-Non-Clinical-Team-Member"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-1-Clinical-Team-Member" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-1-Clinical-Team-Member"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-2-Program-Leader" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-2-Program-Leader"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-2-Admin" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-2-Admin"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-2-Non-Clinical-Team-Member" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-2-Non-Clinical-Team-Member"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-2-Clinical-Team-Member" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-2-Clinical-Team-Member"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-3-Program-Leader" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-3-Program-Leader"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-3-Admin" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-3-Admin"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-3-Non-Clinical-Team-Member" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-3-Non-Clinical-Team-Member"
    },
    "ICY-Maple-Ridge-Pitt-Meadows-Team-3-Clinical-Team-Member" = {
      "name" = "ICY-Maple-Ridge-Pitt-Meadows-Team-3-Clinical-Team-Member"
    },
    "ICY-Okanagan-Similkameen-Program-Leader" = {
      "name" = "ICY-Okanagan-Similkameen-Program-Leader"
    },
    "ICY-Okanagan-Similkameen-Admin" = {
      "name" = "ICY-Okanagan-Similkameen-Admin"
    },
    "ICY-Okanagan-Similkameen-Non-Clinical-Team-Member" = {
      "name" = "ICY-Okanagan-Similkameen-Non-Clinical-Team-Member"
    },
    "ICY-Okanagan-Similkameen-Clinical-Team-Member" = {
      "name" = "ICY-Okanagan-Similkameen-Clinical-Team-Member"
    },
    "ICY-Richmond-Team-1-Program-Leader" = {
      "name" = "ICY-Richmond-Team-1-Program-Leader"
    },
    "ICY-Richmond-Team-1-Admin" = {
      "name" = "ICY-Richmond-Team-1-Admin"
    },
    "ICY-Richmond-Team-1-Non-Clinical-Team-Member" = {
      "name" = "ICY-Richmond-Team-1-Non-Clinical-Team-Member"
    },
    "ICY-Richmond-Team-1-Clinical-Team-Member" = {
      "name" = "ICY-Richmond-Team-1-Clinical-Team-Member"
    },
    "ICY-Richmond-Team-2-Program-Leader" = {
      "name" = "ICY-Richmond-Team-2-Program-Leader"
    },
    "ICY-Richmond-Team-2-Admin" = {
      "name" = "ICY-Richmond-Team-2-Admin"
    },
    "ICY-Richmond-Team-2-Non-Clinical-Team-Member" = {
      "name" = "ICY-Richmond-Team-2-Non-Clinical-Team-Member"
    },
    "ICY-Richmond-Team-2-Clinical-Team-Member" = {
      "name" = "ICY-Richmond-Team-2-Clinical-Team-Member"
    },
    "ICY-Richmond-Team-3-Program-Leader" = {
      "name" = "ICY-Richmond-Team-3-Program-Leader"
    },
    "ICY-Richmond-Team-3-Admin" = {
      "name" = "ICY-Richmond-Team-3-Admin"
    },
    "ICY-Richmond-Team-3-Non-Clinical-Team-Member" = {
      "name" = "ICY-Richmond-Team-3-Non-Clinical-Team-Member"
    },
    "ICY-Richmond-Team-3-Clinical-Team-Member" = {
      "name" = "ICY-Richmond-Team-3-Clinical-Team-Member"
    },
    "ICY-Richmond-Team-4-Program-Leader" = {
      "name" = "ICY-Richmond-Team-4-Program-Leader"
    },
    "ICY-Richmond-Team-4-Admin" = {
      "name" = "ICY-Richmond-Team-4-Admin"
    },
    "ICY-Richmond-Team-4-Non-Clinical-Team-Member" = {
      "name" = "ICY-Richmond-Team-4-Non-Clinical-Team-Member"
    },
    "ICY-Richmond-Team-4-Clinical-Team-Member" = {
      "name" = "ICY-Richmond-Team-4-Clinical-Team-Member"
    },
    "ICY-Fraser-Cascades-Team-1-Program-Leader" = {
      "name" = "ICY-Fraser-Cascades-Team-1-Program-Leader"
    },
    "ICY-Fraser-Cascades-Team-1-Admin" = {
      "name" = "ICY-Fraser-Cascades-Team-1-Admin"
    },
    "ICY-Fraser-Cascades-Team-1-Non-Clinical-Team-Member" = {
      "name" = "ICY-Fraser-Cascades-Team-1-Non-Clinical-Team-Member"
    },
    "ICY-Fraser-Cascades-Team-1-Clinical-Team-Member" = {
      "name" = "ICY-Fraser-Cascades-Team-1-Clinical-Team-Member"
    },
    "ICY-Kootenay-Columbia-Team-1-Program-Leader" = {
      "name" = "ICY-Kootenay-Columbia-Team-1-Program-Leader"
    },
    "ICY-Kootenay-Columbia-Team-1-Admin" = {
      "name" = "ICY-Kootenay-Columbia-Team-1-Admin"
    },
    "ICY-Kootenay-Columbia-Team-1-Non-Clinical-Team-Member" = {
      "name" = "ICY-Kootenay-Columbia-Team-1-Non-Clinical-Team-Member"
    },
    "ICY-Kootenay-Columbia-Team-1-Clinical-Team-Member" = {
      "name" = "ICY-Kootenay-Columbia-Team-1-Clinical-Team-Member"
    },
    "ICY-Mission-Team-1-Program-Leader" = {
      "name" = "ICY-Mission-Team-1-Program-Leader"
    },
    "ICY-Mission-Team-1-Admin" = {
      "name" = "ICY-Mission-Team-1-Admin"
    },
    "ICY-Mission-Team-1-Non-Clinical-Team-Member" = {
      "name" = "ICY-Mission-Team-1-Non-Clinical-Team-Member"
    },
    "ICY-Mission-Team-1-Clinical-Team-Member" = {
      "name" = "ICY-Mission-Team-1-Clinical-Team-Member"
    },
    "ICY-Mission-Team-2-Program-Leader" = {
      "name" = "ICY-Mission-Team-2-Program-Leader"
    },
    "ICY-Mission-Team-2-Admin" = {
      "name" = "ICY-Mission-Team-2-Admin"
    },
    "ICY-Mission-Team-2-Non-Clinical-Team-Member" = {
      "name" = "ICY-Mission-Team-2-Non-Clinical-Team-Member"
    },
    "ICY-Mission-Team-2-Clinical-Team-Member" = {
      "name" = "ICY-Mission-Team-2-Clinical-Team-Member"
    },
    "ICY-Nanaimo-Ladysmith-Team-1-Program-Leader" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-1-Program-Leader"
    },
    "ICY-Nanaimo-Ladysmith-Team-1-Admin" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-1-Admin"
    },
    "ICY-Nanaimo-Ladysmith-Team-1-Non-Clinical-Team-Member" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-1-Non-Clinical-Team-Member"
    },
    "ICY-Nanaimo-Ladysmith-Team-1-Clinical-Team-Member" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-1-Clinical-Team-Member"
    },
    "ICY-Nanaimo-Ladysmith-Team-2-Program-Leader" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-2-Program-Leader"
    },
    "ICY-Nanaimo-Ladysmith-Team-2-Admin" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-2-Admin"
    },
    "ICY-Nanaimo-Ladysmith-Team-2-Non-Clinical-Team-Member" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-2-Non-Clinical-Team-Member"
    },
    "ICY-Nanaimo-Ladysmith-Team-2-Clinical-Team-Member" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-2-Clinical-Team-Member"
    },
    "ICY-Nanaimo-Ladysmith-Team-3-Program-Leader" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-3-Program-Leader"
    },
    "ICY-Nanaimo-Ladysmith-Team-3-Admin" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-3-Admin"
    },
    "ICY-Nanaimo-Ladysmith-Team-3-Non-Clinical-Team-Member" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-3-Non-Clinical-Team-Member"
    },
    "ICY-Nanaimo-Ladysmith-Team-3-Clinical-Team-Member" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-3-Clinical-Team-Member"
    },
    "ICY-Nanaimo-Ladysmith-Team-4-Program-Leader" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-4-Program-Leader"
    },
    "ICY-Nanaimo-Ladysmith-Team-4-Admin" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-4-Admin"
    },
    "ICY-Nanaimo-Ladysmith-Team-4-Non-Clinical-Team-Member" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-4-Non-Clinical-Team-Member"
    },
    "ICY-Nanaimo-Ladysmith-Team-4-Clinical-Team-Member" = {
      "name" = "ICY-Nanaimo-Ladysmith-Team-4-Clinical-Team-Member"
    },
    "ICY-North-Okanagan-Shuswap-Team-1-Program-Leader" = {
      "name" = "ICY-North-Okanagan-Shuswap-Team-1-Program-Leader"
    },
    "ICY-North-Okanagan-Shuswap-Team-1-Admin" = {
      "name" = "ICY-North-Okanagan-Shuswap-Team-1-Admin"
    },
    "ICY-North-Okanagan-Shuswap-Team-1-Non-Clinical-Team-Member" = {
      "name" = "ICY-North-Okanagan-Shuswap-Team-1-Non-Clinical-Team-Member"
    },
    "ICY-North-Okanagan-Shuswap-Team-1-Clinical-Team-Member" = {
      "name" = "ICY-North-Okanagan-Shuswap-Team-1-Clinical-Team-Member"
    },
    "ICY-Pacific-Rim-Team-1-Program-Leader" = {
      "name" = "ICY-Pacific-Rim-Team-1-Program-Leader"
    },
    "ICY-Pacific-Rim-Team-1-Admin" = {
      "name" = "ICY-Pacific-Rim-Team-1-Admin"
    },
    "ICY-Pacific-Rim-Team-1-Non-Clinical-Team-Member" = {
      "name" = "ICY-Pacific-Rim-Team-1-Non-Clinical-Team-Member"
    },
    "ICY-Pacific-Rim-Team-1-Clinical-Team-Member" = {
      "name" = "ICY-Pacific-Rim-Team-1-Clinical-Team-Member"
    },
    "ICY-qathet-Powell-River-Team-1-Program-Leader" = {
      "name" = "ICY-qathet-Powell-River-Team-1-Program-Leader"
    },
    "ICY-qathet-Powell-River-Team-1-Admin" = {
      "name" = "ICY-qathet-Powell-River-Team-1-Admin"
    },
    "ICY-qathet-Powell-River-Team-1-Non-Clinical-Team-Member" = {
      "name" = "ICY-qathet-Powell-River-Team-1-Non-Clinical-Team-Member"
    },
    "ICY-qathet-Powell-River-Team-1-Clinical-Team-Member" = {
      "name" = "ICY-qathet-Powell-River-Team-1-Clinical-Team-Member"
    },
    "ICY-Central-Coast-Team-Admin" = {
      "name" = "ICY-Central-Coast-Team-Admin"
    },
    "ICY-Central-Coast-Team-Program-Leader" = {
      "name" = "ICY-Central-Coast-Team-Program-Leader"
    },
    "ICY-Central-Coast-Team-1-Clinical-Member" = {
      "name" = "ICY-Central-Coast-Team-1-Clinical-Member"
    },
    "ICY-Central-Coast-Team-1-Non-Clinical-Member" = {
      "name" = "ICY-Central-Coast-Team-1-Non-Clinical-Member"
    },
    "ICY-Cowichan-Valley-Team-Admin" = {
      "name" = "ICY-Cowichan-Valley-Team-Admin"
    },
    "ICY-Cowichan-Valley-Team-Program-Leader" = {
      "name" = "ICY-Cowichan-Valley-Team-Program-Leader"
    },
    "ICY-Cowichan-Valley-Team-1-Clinical-Member" = {
      "name" = "ICY-Cowichan-Valley-Team-1-Clinical-Member"
    },
    "ICY-Cowichan-Valley-Team-1-Non-Clinical-Member" = {
      "name" = "ICY-Cowichan-Valley-Team-1-Non-Clinical-Member"
    },
    "ICY-Delta-Team-Admin" = {
      "name" = "ICY-Delta-Team-Admin"
    },
    "ICY-Delta-Team-Program-Leader" = {
      "name" = "ICY-Delta-Team-Program-Leader"
    },
    "ICY-Delta-Team-1-Clinical-Member" = {
      "name" = "ICY-Delta-Team-1-Clinical-Member"
    },
    "ICY-Delta-Team-1-Non-Clinical-Member" = {
      "name" = "ICY-Delta-Team-1-Non-Clinical-Member"
    },
    "ICY-Gold-Trail-Team-Admin" = {
      "name" = "ICY-Gold-Trail-Team-Admin"
    },
    "ICY-Gold-Trail-Team-Program-Leader" = {
      "name" = "ICY-Gold-Trail-Team-Program-Leader"
    },
    "ICY-Gold-Trail-Team-1-Clinical-Member" = {
      "name" = "ICY-Gold-Trail-Team-1-Clinical-Member"
    },
    "ICY-Gold-Trail-Team-1-Non-Clinical-Member" = {
      "name" = "ICY-Gold-Trail-Team-1-Non-Clinical-Member"
    },
    "ICY-Nicola-Similkameen-Team-Admin" = {
      "name" = "ICY-Nicola-Similkameen-Team-Admin"
    },
    "ICY-Nicola-Similkameen-Team-Program-Leader" = {
      "name" = "ICY-Nicola-Similkameen-Team-Program-Leader"
    },
    "ICY-Nicola-Similkameen-Team-1-Clinical-Member" = {
      "name" = "ICY-Nicola-Similkameen-Team-1-Clinical-Member"
    },
    "ICY-Nicola-Similkameen-Team-1-Non-Clinical-Member" = {
      "name" = "ICY-Nicola-Similkameen-Team-1-Non-Clinical-Member"
    },
    "ICY-Peace-River-South-Team-Admin" = {
      "name" = "ICY-Peace-River-South-Team-Admin"
    },
    "ICY-Peace-River-South-Team-Program-Leader" = {
      "name" = "ICY-Peace-River-South-Team-Program-Leader"
    },
    "ICY-Peace-River-South-Team-1-Clinical-Member" = {
      "name" = "ICY-Peace-River-South-Team-1-Clinical-Member"
    },
    "ICY-Peace-River-South-Team-1-Non-Clinical-Member" = {
      "name" = "ICY-Peace-River-South-Team-1-Non-Clinical-Member"
    },
    "ICY-Qualicum-Team-Admin" = {
      "name" = "ICY-Qualicum-Team-Admin"
    },
    "ICY-Qualicum-Team-Program-Leader" = {
      "name" = "ICY-Qualicum-Team-Program-Leader"
    },
    "ICY-Qualicum-Team-1-Clinical-Member" = {
      "name" = "ICY-Qualicum-Team-1-Clinical-Member"
    },
    "ICY-Qualicum-Team-1-Non-Clinical-Member" = {
      "name" = "ICY-Qualicum-Team-1-Non-Clinical-Member"
    },
    "ICY-Surrey-Team-Admin" = {
      "name" = "ICY-Surrey-Team-Admin"
    },
    "ICY-Surrey-Team-Program-Leader" = {
      "name" = "ICY-Surrey-Team-Program-Leader"
    },
    "ICY-Surrey-Team-1-Clinical-Member" = {
      "name" = "ICY-Surrey-Team-1-Clinical-Member"
    },
    "ICY-Surrey-Team-1-Non-Clinical-Member" = {
      "name" = "ICY-Surrey-Team-1-Non-Clinical-Member"
    }
  }
}

resource "keycloak_openid_user_client_role_protocol_mapper" "client_role_mapper" {
  add_to_access_token         = true
  add_to_id_token             = true
  add_to_userinfo             = true
  claim_name                  = "roles"
  claim_value_type            = "String"
  client_id                   = keycloak_openid_client.CLIENT.id
  client_id_for_role_mappings = "ICY"
  multivalued                 = true
  name                        = "client roles"
  realm_id                    = keycloak_openid_client.CLIENT.realm_id
}

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = keycloak_openid_client.CLIENT.realm_id
  client_id = keycloak_openid_client.CLIENT.id
  default_scopes = [
    "idir_aad",
    "bceid_business",
    "profile",
    "email"
  ]
}
