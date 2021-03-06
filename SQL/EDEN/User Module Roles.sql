-- **************************************************************
-- *** USER Module Roles by Organisation and Module
-- **************************************************************

USE	[EdenSSO-PRD]

IF  OBJECT_ID('TempDB..#tmpUsers_Module_Role') IS NOT NULL
	BEGIN	DROP TABLE #tmpUsers_Module_Role	END
SELECT DISTINCT
	UPR.Email			AS	[EdenEmail]
	, UPR.Email2		AS	[CRMEmail]
	, UPR.Username		AS	[EdenUsername]
	, ORG.Name			AS	[Organisation]
	, MDL.Name			AS	[Module]
	, MDL.StaticName	AS	[StaticName]
	, ROL.Name			AS	[ModuleRole]
	, GLBROL.Name		AS	[GlobalRole]
	, MAU.Active		AS	[ModAuthActive]
	, LTRIM(RTRIM(UPR.FirstName)) + ' ' + LTRIM(RTRIM(UPR.LastName)) AS	[User Name]
	, OTY.Name			AS	[OrganisationType]
	, UMB.PasswordExpiration
	, MAU.LastUpdatedOn	AS	[ModAuthDate]
	, YEAR(MAU.LastUpdatedOn) AS [YearAuthorised]

INTO	#tmpUsers_Module_Role

FROM		dbo.UserProfile					UPR
LEFT JOIN	dbo.OrganisationMembership		OMB		ON	OMB.UserId				= UPR.UserId
LEFT JOIN	dbo.Organisation				ORG		ON	ORG.OrganisationId		= OMB.OrganisationId
LEFT JOIN	dbo.OrganisationType			OTY		ON	OTY.OrganisationTypeId	= ORG.OrganisationTypeId
LEFT JOIN	dbo.UserMembership				UMB		ON	UMB.UserId				= UPR.UserId
LEFT JOIN	dbo.ModuleAuthorisation			MAU		ON	MAU.UserId				= OMB.UserID
LEFT JOIN	dbo.Module			  			MDL		ON	MDL.ModuleId			= MAU.ModuleId
LEFT JOIN	dbo.ModuleAuthorisationRole		MAUROL	ON	MAUROL.ModuleAuthorisationId = MAU.ModuleAuthorisationId
LEFT JOIN	dbo.Role						ROL		ON	ROL.RoleId				= MAUROL.RoleId
LEFT JOIN	dbo.GlobalModuleAuthorisation	GMA		ON 
													(		GMA.ModuleId	= MDL.ModuleId
														AND	GMA.UserId		= UPR.UserId
													)
LEFT JOIN	dbo.Role						GLBROL	ON	GLBROL.RoleId				= GMA.RoleId

WHERE	MAU.Active	= 1
AND		UPR.Active	= 1
AND		MDL.StaticName	IN ('WEEE')
AND		UPR.Email		NOT LIKE '%epa.ie'
AND		ORG.Name		NOT IN
(
'Project test',
'Environmental Protection Agency'
)



SELECT DISTINCT	
	[EdenEmail]
	, [CRMEmail]
	, [User Name]
	, STUFF((
		SELECT ', ' + MOD2.[Organisation]
		FROM	#tmpUsers_Module_Role	MOD2
		WHERE	MOD2.[EdenEmail]	= MOD1.[EdenEmail]
		AND		MOD2.[ModuleRole]	= MOD1.[ModuleRole]
		AND		MOD2.[Module]		= MOD1.[Module]
		AND		MOD2.[ModAuthDate]	= MOD1.[ModAuthDate]
		FOR XML PATH('') 
		), 1 ,1 , '')
		AS [Organisation]
	, [StaticName]
	, STUFF((
		SELECT ', ' + MOD2.[ModuleRole]
		FROM	#tmpUsers_Module_Role	MOD2
		WHERE	MOD2.[EdenEmail]	= MOD1.[EdenEmail]
		AND		MOD2.[Organisation]	= MOD1.[Organisation]
		AND		MOD2.[Module]		= MOD1.[Module]
		AND		MOD2.[ModAuthDate]	= MOD1.[ModAuthDate]
		FOR XML PATH('') 
		), 1 ,1 , '')
	AS [ModuleRole]
	, [OrganisationType]
	, [YearAuthorised]
	, [PasswordExpiration]
FROM	#tmpUsers_Module_Role	MOD1

WHERE [YearAuthorised] = '2016'

ORDER BY	[Organisation], [User Name]











/*
***********
MISC



--AND		MDL.Name	LIKE '%EDEN Single Sign-On Portal%'
--AND		ROL.Name		LIKE '%Admin%'

/*
AND		ORG.Name		IN
(
--'Limerick City & County Council'
'Department of Agriculture, Food and the Marine',
'Dept of Comms, Climate Change & Environment',
'Department of Housing, Planning, Community and Local Government',
'Enterprise Ireland',
'Geological Survey of Ireland',
'Inland Fisheries Ireland',
'Irish Research Council',
'Irish Water',
'Marine Institute',
'Met Eireann',
'National Parks and Wildlife Service ',
'Office of Public Works',
'Science Foundation Ireland',
'Teagasc'
)
*/
--AND		OTY.Name		=	'National Organisation'
--AND		ORG.Name		<>	'Environmental Protection Agency'




--AND			UPR.Email		LIKE '%@water.ie%'

	--, [EdenUsername]
	--, [CRMEmail]


ORDER BY	ORG.Name, [GlobalRole] DESC, [ModuleRole], [User Name]

--LEFT JOIN	dbo.ModuleRole				MDROL	ON	MDROL.ModuleId			= MDL.ModuleId
--INNER JOIN	dbo.Role					ROL		ON	ROL.RoleId				= MDROL.RoleId

--SELECT * FROM [EdenSSO-PRD].dbo.Organisation WHERE Code = 'HSES'
--SELECT * FROM [EdenMDS-PRD].dbo.tblOrganisation_org	WHERE StaticName_org = 'HSES'


--*/