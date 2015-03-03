-- sp_help external_pers_header
-- sp_help external_pers_detail
-- alter table external_pers_header drop last_update_by
-- alter table external_pers_header drop last_update_on
-- go
-- alter table external_pers_detail drop last_update_by
-- alter table external_pers_detail drop last_update_on
-- go



alter table external_pers_header add last_update_by    name         DEFAULT suser_name() NULL,
    last_update_on    today   DEFAULT getdate()  NULL
go
alter table external_pers_detail add last_update_by    name         DEFAULT suser_name() NULL,
    last_update_on    today   DEFAULT getdate()  NULL
go