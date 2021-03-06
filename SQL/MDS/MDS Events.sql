-- *******************************************************
-- *** List of EVENTS in Eden MDS
-- *******************************************************

USE [EdenMDS-PRD]

DECLARE @OrgName	VARCHAR(100) = NULL,
		@Year		VARCHAR(4)	 = NULL,
		@Month		VARCHAR(2)	 = NULL,
		@Day		VARCHAR(2)	 = NULL;

SET		@OrgName = 'Fingal'
SET		@Year	 = 2016
SET		@Month	 = 5

SELECT 
	EVN.EventId_evn
	, EVT.Name_evt			AS [Event Type]
	, LTRIM(RTRIM(GENBY.FirstName_usr)) + ' ' + LTRIM(RTRIM(GENBY.LastName_usr))	AS	[GeneratedBy]
	, SOR.Name				AS	[LA Name]
	, EVN.GeneratedOn_evt
	, EVN.Processed_evt
	, EVN.Data_evt

FROM		dbo.tblEvent_evn					EVN
LEFT JOIN	dbo.tblEventType_evt				EVT		ON	EVT.EventTypeId_evt		= EVN.EventTypeId_evt
LEFT JOIN	dbo.tblUser_usr						GENBY	ON  GENBY.UserID_usr		= EVN.GeneratedByUserId_usr
LEFT JOIN	dbo.tblOrganisation_org				ORG		ON	ORG.OrganisationId_org	= EVN.GeneratedByOrganisationId_org
LEFT JOIN	[EdenSSO-PRD].dbo.Organisation		SOR		ON	SOR.Code				= ORG.StaticName_org

WHERE	SOR.Name					LIKE '%' + @OrgName	+ '%'
AND		YEAR(EVN.GeneratedOn_evt)	LIKE '%' + @Year	+ '%'
AND		MONTH(EVN.GeneratedOn_evt)	LIKE '%' + @Month	+ '%'
--OR		DAY(EVN.GeneratedOn_evt)	LIKE '%' + @Day		+ '%'

ORDER BY	EVN.GeneratedOn_evt DESC