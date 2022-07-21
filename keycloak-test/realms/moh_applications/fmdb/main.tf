module "payara-client" {
	source = "../../../../modules/payara-client"
	claim_name  = "fmdb_role"
	client_id   = "FMDB"
	base_url    = "https://fmdbt.hlth.gov.bc.ca/FMDB"
	description = "Formulary Management Database v3"
	valid_redirect_uris = [
		"https://logontest7.gov.bc.ca/clp-cgi/logoff.cgi*",
		"https://fmdbt.hlth.gov.bc.ca/*",
	]
	roles = {	
        "PSDADMIN" = {
            "name" = "PSDADMIN"
            "description" = "Admin role for FMDB provides access to code table management"
        },
        "MOHUSER" = {
            "name" = "MOHUSER"
            "description" = "The base user permission for FMDB"
        },
	}
}
