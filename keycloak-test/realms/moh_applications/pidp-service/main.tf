resource "keycloak_openid_client" "CLIENT" {
    access_token_lifespan = "300"
    access_type = "CONFIDENTIAL"
    admin_url   = ""
    backchannel_logout_session_required = true
    base_url    = ""
    client_authenticator_type = "client-secret"
    client_id   = "PIDP-SERVICE"
    consent_required = false
    description = ""
    direct_access_grants_enabled = false
    enabled = true
    frontchannel_logout_enabled = false
    full_scope_allowed          = false
    implicit_flow_enabled       = false
    name = ""
    pkce_code_challenge_method = ""
    realm_id = "moh_applications"
    service_accounts_enabled =true
    standard_flow_enabled = false
    use_refresh_tokens = true
    valid_redirect_uris = [
	]
    web_origins = [
	]
}
module "client-roles" {
    source = "../../../../modules/client-roles"
    client_id = keycloak_openid_client.CLIENT.id
    realm_id = keycloak_openid_client.CLIENT.realm_id
    roles = {
        "USER" = {
            "name" = "USER"
            "description" = ""
        },
        "feature_amh_demo" = {
            "name" = "feature_amh_demo"
            "description" = ""
        },
        "ADMIN" = {
            "name" = "ADMIN"
            "description" = ""
        },
        "feature_pidp_demo" = {
            "name" = "feature_pidp_demo"
            "description" = ""
        },
	}
}
resource "keycloak_openid_user_session_note_protocol_mapper" "Client-ID" {
    add_to_id_token = true
    claim_name = "clientId"
    claim_value_type = "String"
    client_id = keycloak_openid_client.CLIENT.id
    name = "Client ID"
    realm_id = keycloak_openid_client.CLIENT.realm_id
    session_note = "clientId"
}
resource "keycloak_openid_user_session_note_protocol_mapper" "Client-Host" {
    add_to_id_token = true
    claim_name = "clientHost"
    claim_value_type = "String"
    client_id = keycloak_openid_client.CLIENT.id
    name = "Client Host"
    realm_id = keycloak_openid_client.CLIENT.realm_id
    session_note = "clientHost"
}
resource "keycloak_openid_user_session_note_protocol_mapper" "Client-IP-Address" {
    add_to_id_token = true
    claim_name = "clientAddress"
    claim_value_type = "String"
    client_id = keycloak_openid_client.CLIENT.id
    name = "Client IP Address"
    realm_id = keycloak_openid_client.CLIENT.realm_id
    session_note = "clientAddress"
}
