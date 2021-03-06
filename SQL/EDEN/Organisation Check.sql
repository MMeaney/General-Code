-- **************************************************************
-- *** Organisation details
-- **************************************************************

USE	[EdenSSO-PRD]

SELECT DISTINCT
	ORG.Name				AS	[Organisation]
	, ORG.Code				AS	[OrgCode]
	, MDL.Name				AS	[Module]
	, MDL.StaticName		AS	[ModShortName]
	, ADDR.AddressLine1
	, ADDR.AddressLine2
	, ADDR.AddressLine3
	, ADDR.Phone
	, ADDR.Fax
	, ADDR.PostCode
	, CNT.Name				AS	[County]
	, CTRY.CountryName		AS	[Country]
	, OTY.Name				AS	[OrganisationType]
	, OBTY.RegistrationNo	AS	[CRO Number]

FROM		dbo.Organisation			ORG
LEFT JOIN	dbo.OrganisationMembership	OMB		ON	ORG.OrganisationId			= OMB.OrganisationId
LEFT JOIN	dbo.OrganisationType		OTY		ON	OTY.OrganisationTypeId		= ORG.OrganisationTypeId
LEFT JOIN	dbo.UserProfile				UPR		ON	OMB.UserId					= UPR.UserId
LEFT JOIN	dbo.UserMembership			UMB		ON	UMB.UserId					= UPR.UserId
LEFT JOIN	dbo.ModuleAuthorisation		MAU		ON	MAU.UserId					= OMB.UserID
LEFT JOIN	dbo.Module			  		MDL		ON	MDL.ModuleId				= MAU.ModuleId
LEFT JOIN	dbo.ModuleAuthorisationRole	MAUROL	ON	MAU.ModuleAuthorisationId	= MAUROL.ModuleAuthorisationId
LEFT JOIN	dbo.Role					ROL		ON	ROL.RoleId					= MAUROL.RoleId
LEFT JOIN	dbo.OrganisationAddress		ADDR	ON	ADDR.OrganisationId			= ORG.OrganisationId
LEFT JOIN	dbo.County					CNT		ON	CNT.CountyId				= ADDR.CountyId
LEFT JOIN	dbo.Country					CTRY	ON	CTRY.CountryId				= ADDR.CountryId
LEFT JOIN	dbo.OrganisationBusinessType OBTY	ON	OBTY.OrganisationId			= ORG.OrganisationId

WHERE	ORG.Name		LIKE '%Tempar Limited%'
--AND		OTY.Name		= 'Local Authority'
--AND		MDL.StaticName	= 'WFD'
--AND		MAU.Active		= '1'
--AND		UPR.Active		= '1'
--AND		OMB.Active		= '1'
--AND		UPR.Registered	= '1'
--AND		ROL.Name		<> 'Global Administrator'
--AND		MAU.LastUpdatedOn <	'2016-01-01 00:00:00.000'
--GROUP BY MDL.Name
ORDER BY [Organisation]
/*

	--COUNT(DISTINCT UPR.Email) AS [NumUsers]
	--, ROL.Name			AS	[ModuleRole]
	--, MAU.Active		AS	[ModActive]
	--, MAU.LastUpdatedOn	AS	[ModAccessGrantedDate]
	--, LTRIM(RTRIM(UPR.FirstName)) + ' ' + LTRIM(RTRIM(UPR.LastName)) AS	[UserName]
	--, UPR.Email			AS	[EdenEmail]
	--, UPR.Username		AS	[EdenUsername]
	--, UPR.Email2		AS	[CRMEmail]
	--, UMB.PasswordExpiration
	--, UPR.UserId

IF  OBJECT_ID('TempDB..#tmpOrgUsers') IS NOT NULL
	BEGIN	DROP TABLE #tmpOrgUsers	END

SELECT DISTINCT
	ORG.Name			AS	[Organisation]
	, MDL.Name			AS	[Module]
	, ROL.Name			AS	[ModuleRole]
	, MAU.Active		AS	[ModActive]
	, LTRIM(RTRIM(UPR.FirstName)) + ' ' + LTRIM(RTRIM(UPR.LastName)) AS	[UserName]
	, UPR.Email			AS	[EdenEmail]
	, UPR.Username		AS	[EdenUsername]
	, UPR.Email2		AS	[CRMEmail]
	, OTY.Name			AS	[OrganisationType]
	, UMB.PasswordExpiration
	, UPR.UserId
INTO	#tmpOrgUsers
FROM		dbo.Organisation			ORG
LEFT JOIN	dbo.OrganisationMembership	OMB		ON	ORG.OrganisationId			= OMB.OrganisationId
LEFT JOIN	dbo.OrganisationType		OTY		ON	OTY.OrganisationTypeId		= ORG.OrganisationTypeId
LEFT JOIN	dbo.UserProfile				UPR		ON	OMB.UserId					= UPR.UserId
LEFT JOIN	dbo.UserMembership			UMB		ON	UMB.UserId					= UPR.UserId
LEFT JOIN	dbo.ModuleAuthorisation		MAU		ON	MAU.UserId					= OMB.UserID
LEFT JOIN	dbo.Module			  		MDL		ON	MDL.ModuleId				= MAU.ModuleId
LEFT JOIN	dbo.ModuleAuthorisationRole	MAUROL	ON	MAU.ModuleAuthorisationId	= MAUROL.ModuleAuthorisationId
LEFT JOIN	dbo.Role					ROL		ON	ROL.RoleId					= MAUROL.RoleId
WHERE	MDL.StaticName	= 'WFD'
--AND		ORG.Name		= 'Irish Water'
--AND		OTY.Name		= 'Local Authority'
AND		MAU.Active		= '1'
AND		UPR.Active		= '1'
AND		OMB.Active		= '1'
AND		UPR.Registered	= '1'
AND		ROL.Name		<> 'Global Administrator'
--ORDER BY	ORG.Name, [UserName], [ModuleRole], OTY.Name, UMB.PasswordExpiration DESC, UPR.Email, MDL.Name

SELECT DISTINCT
	ORGUS1.Organisation
	, ORGUS1.OrganisationType
	, ORGUS1.Module
	, STUFF((
			SELECT ', ' + ORGUS2.[ModuleRole]
			FROM	#tmpOrgUsers	ORGUS2
			WHERE	ORGUS2.[UserId]	= ORGUS1.[UserId]
			FOR XML PATH('') 
		), 1 ,1 , '')
		AS ModuleRole
	, ORGUS1.UserName
	, ORGUS1.EdenEmail
FROM	 #tmpOrgUsers	ORGUS1
ORDER BY ORGUS1.OrganisationType, ORGUS1.Organisation, ORGUS1.UserName



SE



/*
--LEFT JOIN	dbo.ModuleRole				MDROL	ON	MDROL.ModuleId			= MDL.ModuleId
--INNER JOIN	dbo.Role					ROL		ON	ROL.RoleId				= MDROL.RoleId

--SELECT * FROM [EdenSSO-PRD].dbo.Organisation WHERE Code = 'HSES'
--SELECT * FROM [EdenMDS-PRD].dbo.tblOrganisation_org	WHERE StaticName_org = 'HSES'
--*/--*/