USE [EdenSSO-PRD]
SELECT DISTINCT
	ORG.Name				AS [Organisation]
	, ORGTYP.Name			AS [OrgType]
	, USR.FirstName
	, USR.LastName
	, LTRIM(RTRIM(USR.FirstName))  + ' ' + LTRIM(RTRIM(USR.LastName))	AS	[Full Name]
	, USR.Email
	, MODULE.StaticName
	, MODULE.Name
	, MODAUTH.LastUpdatedOn
	, USR.*
	
FROM		dbo.UserProfile			USR
INNER JOIN	dbo.ModuleAuthorisation	MODAUTH ON	MODAUTH.UserID			= USR.UserID
INNER JOIN	dbo.Module				MODULE  ON	MODULE.ModuleId			= MODAUTH.ModuleId
INNER JOIN	dbo.Organisation		ORG		ON	ORG.OrganisationId		= MODAUTH.OrganisationId
INNER JOIN	dbo.OrganisationType	ORGTYP	ON	ORG.OrganisationTypeId	= ORGTYP.OrganisationTypeId

WHERE	MODULE.StaticName = 'IWC'
--AND		ORG.Name	=	'Environmental Protection Agency'
--AND		USR.Email	NOT LIKE '%@epa.ie'

ORDER BY 
	 MODULE.StaticName
	 , ORGTYP.Name
	 , ORG.Name
	 , MODAUTH.LastUpdatedOn

/*


	--USRPROF.UserId
	--, USRPROF.Username
	--, USRPROF.Phone
	--, USRPROF.Mobile
	--, USRPROF.Fax
	--, USRPROF.SectionId
	--, USRPROF.TitleId
	--, USRPROF.AddressLine1
	--, USRPROF.AddressLine2
	--, USRPROF.AddressLine3
	--, USRPROF.CountyId
	--, USRPROF.PositionId
	--, USRPROF.PostCode
	--, USRPROF.Country
	--, USRPROF.LastUpdatedOn
	--, USRPROF.Email2
	--, USRPROF.Registered
	--, USRPROF.CurrentOrganisationId
	--, MODULE.ModuleId
	--, MODULE.ApplicationId
	--, MODULE.URL
	--, MODULE.Active
	--, MODULE.Description
	--, MODULE.GlobalAdminApprovalAllowed
	--, MODULE.OrgAdminApprovalAllowed
	--, MODULE.ModuleAdminApprovalAllowed
	--, MODAUTH.ModuleAuthorisationId
	--, MODAUTH.OrganisationId
	--, MODAUTH.UserId
	--, MODAUTH.ModuleId
	--, MODAUTH.Active
	--, MODAUTH.LastUpdatedBy

SELECT DISTINCT StaticName FROM [EdenSSO-PRD].[dbo].[Module]



SELECT TOP 1000 
	MODREQ.ModuleAuthorisationRequestId
	, MODREQ.OrganisationId
	, MODREQ.UserId
	, MODREQ.ModuleId
	, MODREQ.RequestDate
FROM dbo.ModuleAuthorisationRequest MODREQ

SELECT TOP 1000 
	MODAUTH.ModuleAuthorisationId
	, MODAUTH.OrganisationId
	, MODAUTH.UserId
	, MODAUTH.ModuleId
	, MODAUTH.Active
	, MODAUTH.LastUpdatedOn
	, MODAUTH.LastUpdatedBy
FROM dbo.ModuleAuthorisation MODAUTH

SELECT TOP 1000 
MODULE.ModuleId
, MODULE.ApplicationId
, MODULE.StaticName
, MODULE.Name
, MODULE.URL
, MODULE.Active
, MODULE.Description
, MODULE.GlobalAdminApprovalAllowed
, MODULE.OrgAdminApprovalAllowed
, MODULE.ModuleAdminApprovalAllowed
FROM dbo.Module
--WHERE MODULE.StaticName = 'WFD'




--*/