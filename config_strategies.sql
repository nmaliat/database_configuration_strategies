# database_configuration_strategies
/*steps I typically take and tables i check to configure errors in a UI market job */

select * from A2_ISO_JOB_DETAIL where JOB_ID in (1161)    /* table for job detail */
select * from a2iReportLkReport where reportid in (1161)  /* table for report */
select * from a2_iso_process where PROCESS_ID in (1161)   /* table that show process mask, container name etc */
select * from A2_STORAGE_CONFIG where JOB_ID in (1161)    /* storage table for data lake */ 


SELECT * FROM a2iSchedParticipantKey WHERE ShortName = 'psi' and MarketSystem = 'dart2'   /* certificate table for participants */
select * from A2_ISO_PARTICIPANTS where SHORT_NAME = 'psi'                                /* participant table */ 




/* inserting storage config value from dev environment into beta */

SET IDENTITY_INSERT A2_STORAGE_CONFIG ON 

INSERT INTO A2_STORAGE_CONFIG VALUES (
'317', '1161', '1', 'SAVE', 'TO' ,'ADLGen2',
'[ENV:AZURE_STORAGE_ACCOUNT]',
'miso/[MISOReport]/[YYYY]/[MM]/[DD]',
'PROD',
'[ISO]_[ParticipantShortName]_[ReportsName]_[Date]_[HH][mm][SS][fffff][EXT]',
'Custom',
'Timestamp',
'FILE')

SET IDENTITY_INSERT A2_STORAGE_CONFIG OFF 
