module "CGI-DBA" {
  source = "./groups/cgi-dba"
  HEM    = module.HEM
}

module "CGI-DEVELOPER" {
  source                  = "./groups/cgi-developer"
  FMDB                    = module.FMDB
  GIS                     = module.GIS
  HAMIS                   = module.HAMIS
  HEM                     = module.HEM
  HSCIS                   = module.HSCIS
  MANAGE-USERS            = module.MANAGE-USERS
  MIWT                    = module.MIWT
  SFDS                    = module.SFDS
  SWT                     = module.SWT
  TAP                     = module.TAP
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
  realm-management        = module.realm-management
}

module "CGI-MID-TIER" {
  source           = "./groups/cgi-mid-tier"
  FMDB             = module.FMDB
  HEM              = module.HEM
  MANAGE-USERS     = module.MANAGE-USERS
  MIWT             = module.MIWT
  SWT              = module.SWT
  realm-management = module.realm-management
}

module "EMCOD-ACCESS-TEAM" {
  source                  = "./groups/emcod-access-team"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "HIBC-MSP-DIRECT" {
  source                  = "./groups/hibc-msp-direct"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "HSIAR-MANAGEMENT" {
  source                  = "./groups/hsiar-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "HSPP-MANAGEMENT" {
  source                  = "./groups/hspp-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "ITSB-ACCESS-TEAM" {
  source                  = "./groups/itsb-access-team"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
  realm-management        = module.realm-management
}

module "MAID-MANAGEMENT" {
  source                  = "./groups/maid-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "PAS-MANAGEMENT" {
  source                  = "./groups/pas-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "PHO-RSC-MANAGEMENT" {
  source                  = "./groups/pho-rsc-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "PIDP-MANAGEMENT" {
  source                  = "./groups/pidp-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "PRIMARY-CARE-ACCESS-TEAM" {
  source                  = "./groups/primary-care-access-team"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "PRIME-MANAGEMENT" {
  source                  = "./groups/prime-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "PRP-USER-ADMIN" {
  source                  = "./groups/prp-user-admin"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "REGISTRIES-ADMIN" {
  source                  = "./groups/registries-admin"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "REGISTRIES-CONNECTIONS-TEAM" {
  source                  = "./groups/registries-connections-team"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "TBCM-MANAGEMENT" {
  source                  = "./groups/tbcm-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "TPL-MANAGEMENT" {
  source                  = "./groups/tpl-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "WEBCAPS-USER-ADMIN" {
  source                  = "./groups/webcaps-user-admin"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}

module "ICY-MANAGEMENT" {
  source                  = "./groups/icy-management"
  USER-MANAGEMENT-SERVICE = module.USER-MANAGEMENT-SERVICE
}
