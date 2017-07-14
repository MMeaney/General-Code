-- **********************
-- *** MDS Notifications
-- **********************

USE [EdenMDS-PRD]

SELECT DISTINCT
NOTF.DateGenerated_not
, NOTF.DateRead_not
, LTRIM(RTRIM(ADDUSR.FirstName_usr)) + ' ' + LTRIM(RTRIM(ADDUSR.LastName_usr)) AS	[Addressee]
, STD2.Content_std				AS [Addressee Org]
, NOTF.EmailSentOn_not
, LTRIM(RTRIM(ADDUSR.FirstName_usr)) + ' ' + LTRIM(RTRIM(ADDUSR.LastName_usr)) AS	[Generated by]
, STD3.Content_std				AS [Generated by Org]
, EVN.GeneratedOn_evt
, EVN.Processed_evt
, EVT.Name_evt
, STD1.Content_std
, NOD.Description_nod
, NOD.ExecutionOrder_nod
, NOD.DefaultEmailDeliveryFrequency_edf
, NOD.Mandatory_nod
, NOD.TextTemplate_nod
, STD4.Content_std				AS [Role]

FROM		dbo.tblNotification_not				NOTF
LEFT JOIN	dbo.tblEvent_evn					EVN		ON EVN.EventId_evn					= NOTF.EventId_evt
LEFT JOIN	dbo.tblEventType_evt				EVT		ON EVT.EventTypeId_evt				= EVN.EventTypeId_evt
LEFT JOIN	dbo.tblNotificationDefinition_nod	NOD		ON NOD.NotificationDefinitionId_nod = NOTF.NotificationDefinition_nod
LEFT JOIN	dbo.tblStringDefinition_std			STD1	ON STD1.StringID_stg				= NOD.Name_stg
LEFT JOIN	dbo.tblOrganisation_org				ORGADD	ON ORGADD.OrganisationId_org		= NOTF.AddresseeOrganisationId_org
LEFT JOIN	dbo.tblStringDefinition_std			STD2	ON STD2.StringID_stg				= ORGADD.Name_stg
LEFT JOIN	dbo.tblOrganisation_org				ORGEVN	ON ORGEVN.OrganisationId_org		= NOTF.AddresseeOrganisationId_org
LEFT JOIN	dbo.tblStringDefinition_std			STD3	ON STD3.StringID_stg				= ORGEVN.Name_stg
LEFT JOIN	dbo.tblUser_usr						ADDUSR	ON ADDUSR.UserID_usr				= NOTF.AddresseeUserID_usr
LEFT JOIN	dbo.tblUser_usr						EVTUSR	ON EVTUSR.UserID_usr				= EVN.GeneratedByUserId_usr
LEFT JOIN	dbo.tblUserInOrganisation_uio		UIO		ON UIO.UserID_usr					= NOTF.AddresseeUserID_usr
LEFT JOIN	dbo.tblRoleDefinition_rld			RLD		ON RLD.RoleID_rld					= UIO.RoleID_rol
LEFT JOIN	dbo.tblStringDefinition_std			STD4	ON STD4.StringID_stg				= RLD.Name_stg

WHERE	STD1.LanguageID_lan =  '1'
AND		STD2.LanguageID_lan =  '1'
AND		STD3.LanguageID_lan =  '1'
--AND		NOTF.EmailSentOn_not > '2016-05-24 14:24:25.210'
AND		EVT.Name_evt	LIKE '%Data Sharing Requested%'

ORDER BY NOTF.EmailSentOn_not DESC







/*


--, NOTF.NotificationId_not
--, NOTF.EventId_evt
--, NOTF.NotificationDefinition_nod
--, NOTF.AddresseeUserID_usr
--, NOTF.AddresseeOrganisationId_org
--, ORG.StaticName_org
--, EVN.EventId_evn
--, EVN.EventTypeId_evt
--, EVN.GeneratedByUserId_usr
--, EVN.GeneratedByOrganisationId_org
--, EVT.EventTypeId_evt
--, EVT.EventTypeGroupId_evg
--, NOD.NotificationDefinitionId_nod
--, NOD.EventTypeId_evt
--, NOD.Name_stg
--, NOD.IssuingCondition_nod
--, NOD.AddreesseeRetrieverData_nod
--, NOTF.Attachment_not
--, EVN.Data_evt
--, NOD.UrlTemplate_nod
--, RLD.StaticName_rld


*/
