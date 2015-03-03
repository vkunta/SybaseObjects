USE personalization
go
IF OBJECT_ID('dbo.extr_pers_detail_upd_ins_trig') IS NOT NULL
BEGIN
    DROP TRIGGER dbo.extr_pers_detail_upd_ins_trig
    IF OBJECT_ID('dbo.extr_pers_detail_upd_ins_trig') IS NOT NULL
        PRINT '<<< FAILED DROPPING TRIGGER dbo.extr_pers_detail_upd_ins_trig >>>'
    ELSE
        PRINT '<<< DROPPED TRIGGER dbo.extr_pers_detail_upd_ins_trig >>>'
END
go
CREATE TRIGGER extr_pers_detail_upd_ins_trig
   ON external_pers_detail
   FOR INSERT, UPDATE
AS
BEGIN
/**********************************************************
*Trigger Name: extr_pers_detail_upd_ins_trig
*Database: personalization
*Server: SYBASE
*SQL-Builder4.3
*********************************************************/
UPDATE external_pers_detail 
      SET last_update_by = suser_name()
  	      , last_update_on = getdate()
   FROM external_pers_detail   t1
    JOIN  inserted                  t2 ON t1.external_pers_detail_id = t2.external_pers_detail_id

END
GO
IF OBJECT_ID('dbo.extr_pers_detail_upd_ins_trig') IS NOT NULL
    PRINT '<<< CREATED TRIGGER dbo.extr_pers_detail_upd_ins_trig >>>'
ELSE
    PRINT '<<< FAILED CREATING TRIGGER dbo.extr_pers_detail_upd_ins_trig >>>'
GO