provider "aws" {
  region = "ap-south-1"
}

#ce-dev resource block

resource "aws_organizations_account" "CE-Dev" {
  name      = var.account_name_ce_dev
  email     = var.mail_id_ce_dev
  parent_id = var.OU_id_ce_dev
  role_name = "OrganizationAccountAccessRole"
}

output "accounetid_ce_dev" {
  value = aws_organizations_account.CE-Dev.id
}

#ce-prod resource block

resource "aws_organizations_account" "CE-Prod" {
  name      = var.account_name_ce_prod
  email     = var.mail_id_ce_prod
  parent_id = var.OU_id_ce_prod
  role_name = "OrganizationAccountAccessRole"
}

output "accounetid_ce_prod" {
  value = aws_organizations_account.CE-Prod.id
}

#tcin-drivelink-tkm-dev resource block

resource "aws_organizations_account" "TCIN-Drivelink-TKM-Dev" {
  name      = var.account_name_tcin_drivelink_tkm_dev
  email     = var.mail_id_tcin_drivelink_tkm_dev
  parent_id = var.OU_id_tcin_drivelink_tkm_dev
  role_name = "OrganizationAccountAccessRole"
}

output "accounetid_tcin_drivelink_tkm_dev" {
  value = aws_organizations_account.TCIN-Drivelink-TKM-Dev.id
}

#tcin-drivelink-tkm-stg resource block

resource "aws_organizations_account" "TCIN-Drivelink-TKM-Stg" {
  name      = var.account_name_tcin_drivelink_tkm_stg
  email     = var.mail_id_tcin_drivelink_tkm_stg
  parent_id = var.OU_id_tcin_drivelink_tkm_stg
  role_name = "OrganizationAccountAccessRole"
}

output "accounetid_tcin_drivelink_tkm_stg" {
  value = aws_organizations_account.TCIN-Drivelink-TKM-Stg.id
}

#tcin-drivelink-tkm-prod resource block

resource "aws_organizations_account" "TCIN-Drivelink-TKM-Prod" {
  name      = var.account_name_tcin_drivelink_tkm_prod
  email     = var.mail_id_tcin_drivelink_tkm_prod
  parent_id = var.OU_id_tcin_drivelink_tkm_prod
  role_name = "OrganizationAccountAccessRole"
}

output "accounetid_tcin_drivelink_tkm_prod" {
  value = aws_organizations_account.TCIN-Drivelink-TKM-Prod.id
}

#tcin-drivelink-msil-stg resource block

resource "aws_organizations_account" "TCIN-Drivelink-MSIL-Stg" {
  name      = var.account_name_tcin_drivelink_msil_stg
  email     = var.mail_id_tcin_drivelink_msil_stg
  parent_id = var.OU_id_tcin_drivelink_msil_stg
  role_name = "OrganizationAccountAccessRole"
}

output "accounetid_tcin_drivelink_msil_stg" {
  value = aws_organizations_account.TCIN-Drivelink-MSIL-Stg.id
}

#tcin-drivelink-msil-prod resource block

resource "aws_organizations_account" "TCIN-Drivelink-MSIL-Prod" {
  name      = var.account_name_tcin_drivelink_msil_prod
  email     = var.mail_id_tcin_drivelink_msil_prod
  parent_id = var.OU_id_tcin_drivelink_msil_prod
  role_name = "OrganizationAccountAccessRole"
}

output "accounetid_tcin_drivelink_msil_prod" {
  value = aws_organizations_account.TCIN-Drivelink-MSIL-Prod.id
}

#tcin-smriti-dev resource block

#resource "aws_organizations_account" "tcin-smriti-dev" {
 # name      = var.account_name_tcin_smriti_dev
  #email     = var.mail_id_tcin_smriti_dev
  #parent_id = var.OU_id_tcin_smriti_dev
  #role_name = "OrganizationAccountAccessRole"
#}

#output "accounetid_tcin_smriti_dev" {
 # value = aws_organizations_account.tcin-smriti-dev.id
#}

#tcin-aiops-na-dl-prod resource block

#resource "aws_organizations_account" "tcin-aiops-na-dl-prod" {
 # name      = var.account_name_tcin_aiops_na_dl_prod
  #email     = var.mail_id_tcin_aiops_na_dl_prod
  #parent_id = var.OU_id_tcin_aiops_na_dl_prod
  #role_name = "OrganizationAccountAccessRole"
#}

#output "accounetid_tcin_aiops_na_dl_prod" {
 # value = aws_organizations_account.tcin-aiops-na-dl-prod.id
#}

#tcin-llm-dev resource block

#resource "aws_organizations_account" "tcin-llm-dev" {
 # name      = var.account_name_tcin_llm_dev
  #email     = var.mail_id_tcin_llm_dev
  #parent_id = var.OU_id_tcin_llm_dev
  #role_name = "OrganizationAccountAccessRole"
#}

#output "accounetid_tcin_llm_dev" {
 # value = aws_organizations_account.tcin-llm-dev.id
#}

#tcin-it-dev resource block

resource "aws_organizations_account" "tcin-it-dev" {
  name      = var.account_name_tcin_it_dev
  email     = var.mail_id_tcin_it_dev
  parent_id = var.OU_id_tcin_it_dev
  role_name = "OrganizationAccountAccessRole"
}

output "accounetid_tcin_it_dev" {
  value = aws_organizations_account.tcin-it-dev.id
}

#tcin-liftgate-dev resource block

resource "aws_organizations_account" "tcin-liftgate-dev" {
  name      = var.account_name_tcin-liftgate-dev
  email     = var.mail_id_tcin-liftgate-dev
  parent_id = var.OU_id_tcin-liftgate-dev
  role_name = "OrganizationAccountAccessRole"
}

output "accounetid_tcin-liftgate-dev" {
  value = aws_organizations_account.tcin-liftgate-dev.id
}

#tcin-canv-tkm-dev resource block

resource "aws_organizations_account" "tcin-canv-tkm-dev" {
  name      = var.account_name_tcin-canv-tkm-dev
  email     = var.mail_id_tcin-canv-tkm-dev
  parent_id = var.OU_id_tcin-canv-tkm-dev
  role_name = "OrganizationAccountAccessRole"
}

output "accounetid_tcin-canv-tkm-dev" {
  value = aws_organizations_account.tcin-canv-tkm-dev.id
}

#tcin-infleet-dev resource block

resource "aws_organizations_account" "tcin-infleet-dev" {
  name      = var.account_name_tcin-infleet-dev
  email     = var.mail_id_tcin-infleet-dev
  parent_id = var.OU_id_tcin-infleet-dev
  role_name = "OrganizationAccountAccessRole"
}

output "accounetid_tcin-infleet-dev" {
  value = aws_organizations_account.tcin-infleet-dev.id
}

#tcin-infleet-stg resource block

resource "aws_organizations_account" "tcin-infleet-stg" {
  name      = var.account_name_tcin-infleet-stg
  email     = var.mail_id_tcin-infleet-stg
  parent_id = var.OU_id_tcin-infleet-stg
  role_name = "OrganizationAccountAccessRole"
}

output "accounetid_tcin-infleet-stg" {
  value = aws_organizations_account.tcin-infleet-stg.id
}

#tcin-datasquadrons-tkm-stg resource block

resource "aws_organizations_account" "tcin-datasquadrons-tkm-stg" {
  name      = var.account_name_tcin-datasquadrons-tkm-stg
  email     = var.mail_id_tcin-datasquadrons-tkm-stg
  parent_id = var.OU_id_tcin-datasquadrons-tkm-stg
  role_name = "OrganizationAccountAccessRole"
}

output "accounetid_tcin-datasquadrons-tkm-stg" {
  value = aws_organizations_account.tcin-datasquadrons-tkm-stg.id
}

#tcin-datasquadrons-tkm-prd resource block

resource "aws_organizations_account" "tcin-datasquadrons-tkm-prd" {
  name      = var.account_name_tcin-datasquadrons-tkm-prd
  email     = var.mail_id_tcin-datasquadrons-tkm-prd
  parent_id = var.OU_id_tcin-datasquadrons-tkm-prd
  role_name = "OrganizationAccountAccessRole"
}

output "accounetid_tcin-datasquadrons-tkm-prd" {
  value = aws_organizations_account.tcin-datasquadrons-tkm-prd.id
}

#tcin-data-enclave-prd resource block

resource "aws_organizations_account" "tcin-data-enclave-prd" {
  name      = var.account_name_tcin-data-enclave-prd
  email     = var.mail_id_tcin-data-enclave-prd
  parent_id = var.OU_id_tcin-data-enclave-prd
  role_name = "OrganizationAccountAccessRole"
}

output "accounetid_tcin-data-enclave-prd" {
  value = aws_organizations_account.tcin-data-enclave-prd.id
}