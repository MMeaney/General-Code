-- *******************************
-- *** User Profile by Appication
-- *******************************

USE	[EdenSSO-PRD]



SELECT DISTINCT LPAMDV.Email + '; ' AS	[EdenEmail]
FROM		dbo.LicenceProfileAccessMembersDisplayView	LPAMDV
LEFT JOIN	dbo.UserProfile								UPR		ON	UPR.UserId	= LPAMDV.UserId
WHERE	LPAMDV.LicenceCode		NOT LIKE 'L%' 
AND		LPAMDV.Active	= 1
--AND		UPR.Active		= 1
--AND		LPAMDV.Email	LIKE '%epa.ie%' 

UNION

SELECT DISTINCT
	--LTRIM(RTRIM(UPR.FirstName)) + ' ' + LTRIM(RTRIM(UPR.LastName)) AS	[UserName]
	--, 
	UPR.Email	+ '; '		AS	[EdenEmail]
	--, MDL.StaticName		AS	[Module]
	--, GLBROL.Name			AS	[GlobalRole]


FROM		dbo.UserProfile					UPR
LEFT JOIN	dbo.OrganisationMembership		OMB		ON	OMB.UserId				= UPR.UserId
LEFT JOIN	dbo.Organisation				ORG		ON	ORG.OrganisationId		= OMB.OrganisationId
LEFT JOIN	dbo.OrganisationType			OTY		ON	OTY.OrganisationTypeId	= ORG.OrganisationTypeId
LEFT JOIN	dbo.UserMembership				UMB		ON	UMB.UserId				= UPR.UserId
LEFT JOIN	dbo.ModuleAuthorisation			MAU		ON	MAU.UserId				= OMB.UserID
LEFT JOIN	dbo.Module			  			MDL		ON	MDL.ModuleId			= MAU.ModuleId
LEFT JOIN	dbo.GlobalModuleAuthorisation	GMA		ON 
													(
														GMA.ModuleId	= MDL.ModuleId
														AND
														GMA.UserId		= UPR.UserId
													)
LEFT JOIN	dbo.Role						GLBROL	ON	GLBROL.RoleId				= GMA.RoleId

WHERE	MDL.StaticName	LIKE '%LMA%'
AND		GLBROL.Name		LIKE '%GLOBAL%'
AND		GMA.Active		= 1

ORDER BY [EdenEmail]

/*
SELECT DISTINCT
	UPR.Email + '; '					AS	[EdenEmail]
	, LTRIM(RTRIM(UPR.FirstName))  + ' ' + LTRIM(RTRIM(UPR.LastName))	AS	[UserName]
	, MDL.StaticName			AS	[Module]
	, UPR.Active				AS	[UserActive]
	--, LPRNM.LicenceType

FROM		dbo.UserProfile						UPR
LEFT JOIN	dbo.UserAuthorisationByApplication	UABA	ON	UABA.UserId						= UPR.UserID
LEFT JOIN	dbo.UserMembership					UMB		ON	UMB.UserId						= UPR.UserId
LEFT JOIN	dbo.OrganisationMembership			OMB		ON	OMB.UserId						= UPR.UserId
LEFT JOIN	dbo.Organisation					ORG		ON	ORG.OrganisationId				= OMB.OrganisationId
LEFT JOIN	dbo.OrganisationAddress				OAD		ON	OAD.OrganisationId				= ORG.OrganisationId
LEFT JOIN	dbo.OrganisationType				OTY		ON	OTY.OrganisationTypeId			= ORG.OrganisationTypeId
LEFT JOIN	dbo.ModuleAuthorisation				MAU		ON	MAU.UserId						= OMB.UserID
LEFT JOIN	dbo.ModuleAuthorisationRequest		MAR		ON  MAR.UserID						= UPR.UserID
LEFT JOIN	dbo.UserProfile						APRV	ON  APRV.UserId						= MAU.LastUpdatedBy
LEFT JOIN	dbo.Module				  			MDL		ON	MDL.ModuleId					= MAU.ModuleId
LEFT JOIN	dbo.OrganisationAddress				ADDR	ON	ADDR.OrganisationId				= ORG.OrganisationId
LEFT JOIN	dbo.County							CNT		ON	CNT.CountyId					= ADDR.CountyId
LEFT JOIN	dbo.Country							CTRY	ON	CTRY.CountryId					= ADDR.CountryId
LEFT JOIN	[EdenIdentity-PRD].dbo.[User]		USRID	ON	USRID.UniqueId					= UPR.UserId
LEFT JOIN	dbo.LicenceProfileAccess			LPA		ON	LPA.UserId						= UPR.UserId
LEFT JOIN	dbo.LicenceProfile					LPRNM	ON	LPRNM.LicenceProfileId			= LPA.LicenceProfileId
LEFT JOIN	dbo.LicenceProfileAccessRequest		LPREQ	ON	LPREQ.UserId					= UPR.UserId
LEFT JOIN	dbo.LicenceProfile					LPRQNM	ON	LPRQNM.LicenceProfileId			= LPA.LicenceProfileId

WHERE	MDL.ApplicationId IN (
'4C03C15C-557F-4764-9C1A-E2881A07BB0B' --Licensing Management Application
--, 'F318927A-26B1-E411-B3B4-0050568A69E2' -- --Licence and Authorisation Application (AM)
)
AND		UPR.Active = 1
AND		LPRNM.LicenceType	<>	'Radiological Protection'

ORDER BY [EdenEmail]






	--, UPR.Username			AS	[EdenUsername]
	--, ORG.Name				AS	[Organisation]
	--, MAU.Active			AS	[ModActive]
	--, UPR.Email2			AS	[CRMEmail]
	--, OTY.Name				AS	[OrganisationType]
	--, UMB.PasswordExpiration
	--, MET.Name_met			AS	[MDS Data Type]
	--, ALD.StaticName_ald	AS	[MDS Data Access]

--*/