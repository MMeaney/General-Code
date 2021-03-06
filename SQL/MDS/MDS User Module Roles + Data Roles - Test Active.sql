-- **************************************************************
-- *** MDS User Details including Data Access Rights
-- **************************************************************

USE	[EdenSSO-TST]

IF  OBJECT_ID('TempDB..#tmpUserDetails') IS NOT NULL
	BEGIN	DROP TABLE #tmpUserDetails	END

SELECT DISTINCT
	LTRIM(RTRIM(UPR.FirstName)) + ' ' + LTRIM(RTRIM(UPR.LastName)) AS	[UserName]
	, UPR.Email				AS	[EdenEmail]
	, UPR.Username			AS	[EdenUsername]
	, ORG.Name				AS	[Organisation]
	, MDL.StaticName		AS	[Module]
	, ROL.Name				AS	[ModuleRole]
	, MAU.Active			AS	[ModActive]
	, UPR.Email2			AS	[CRMEmail]
	, OTY.Name				AS	[OrganisationType]
	, UMB.PasswordExpiration
	, MET.Name_met			AS	[MDS Data Type]
	, ALD.StaticName_ald	AS	[MDS Data Access]
	, FCR.StaticName_fcr	AS	[FCT Role]

INTO #tmpUserDetails

FROM		dbo.Organisation			ORG
LEFT JOIN	dbo.OrganisationMembership	OMB		ON	ORG.OrganisationId		= OMB.OrganisationId
LEFT JOIN	dbo.OrganisationType		OTY		ON	OTY.OrganisationTypeId	= ORG.OrganisationTypeId
LEFT JOIN	dbo.UserProfile				UPR		ON	OMB.UserId				= UPR.UserId
LEFT JOIN	dbo.UserMembership			UMB		ON	UMB.UserId				= UPR.UserId
LEFT JOIN	dbo.ModuleAuthorisation		MAU		ON	MAU.UserId				= OMB.UserID
LEFT JOIN	dbo.Module			  		MDL		ON	MDL.ModuleId			= MAU.ModuleId
LEFT JOIN	dbo.ModuleAuthorisationRole	MAUROL	ON	MAUROL.ModuleAuthorisationId = MAU.ModuleAuthorisationId
INNER JOIN	dbo.Role					ROL		ON	ROL.RoleId				= MAUROL.RoleId
LEFT JOIN	[EdenMDS-TST].dbo.tblUser_usr					MDSUSR	ON MDSUSR.Email_usr					= UPR.Email
LEFT JOIN	[EdenMDS-TST].dbo.tblUserOrganisationAccess_uoa	UOA		ON UOA.UserID_usr					= MDSUSR.UserID_usr
LEFT JOIN	[EdenMDS-TST].dbo.tblMonitoredEntityType_met	MET		ON MET.MonitoredEntityTypeID_met	= UOA.DataType_met
LEFT JOIN	[EdenMDS-TST].dbo.tblDataAccessDefinition_ald	ALD		ON ALD.DataAccessDefinitionID_ald	= UOA.DataAccessDefinitionID_ald
LEFT JOIN	[EdenMDS-TST].dbo.tblFCTUserRole_fur			FUR		ON FUR.UserID_usr					= MDSUSR.UserID_usr
LEFT JOIN	[EdenMDS-TST].dbo.tblFCTRoleDefinition_fcr		FCR		ON FCR.FCTRoleDefinitionID_fcr		= FUR.FCTRoleDefinition_fcr

WHERE		MDL.StaticName	LIKE '%MDS%'
AND			UPR.Email		LIKE '%MMEPATest%'
--AND			FUR.FCTRoleDefinition_fcr IS NOT NULL
--AND			ORG.Name		NOT IN ('Environmental Protection Agency', 'Irish Water', 'LGCSB')
--AND			UPR.Email		NOT LIKE '%@water.ie%'
--AND			UPR.Email		NOT LIKE '%@epa.ie%'
--AND			UPR.Email		NOT LIKE '%@esptl.com%'
--AND			UPR.Email		NOT LIKE '%@lgcsb.ie%'
--AND			ROL.Name		= 'Administrator'
----AND			ALD.StaticName_ald = 'APPROVER'

--SELECT * FROM #tmpUserDetails WHERE [EdenEmail] = 'gvaughan@water.ie'

SELECT DISTINCT	
	[UserName]
	, [EdenEmail]
	, [Organisation]
	, [Module]
	, LTRIM(
		STUFF((
			SELECT ', ' + USRDET2.[ModuleRole]
			FROM	#tmpUserDetails	USRDET2
			WHERE	USRDET2.[EdenEmail]			= USRDET1.[EdenEmail]
			AND		USRDET2.[MDS Data Type]		= USRDET1.[MDS Data Type]
			AND		USRDET2.[MDS Data Access]	= USRDET1.[MDS Data Access]
			AND		USRDET2.[FCT Role]			= USRDET1.[FCT Role]
			AND		USRDET2.[Organisation]		= USRDET1.[Organisation]
			AND		USRDET1.[ModuleRole]		IS NOT NULL
			FOR XML PATH('') 
		), 1 ,1 , '')
	) AS [ModuleRole]
	, LTRIM(
		STUFF((
			SELECT ', ' + USRDET3.[MDS Data Access]
			FROM	#tmpUserDetails	USRDET3
			WHERE	USRDET3.[EdenEmail]			= USRDET1.[EdenEmail]
			AND		USRDET3.[MDS Data Type]		= USRDET1.[MDS Data Type]
			AND		USRDET3.[ModuleRole]		= USRDET1.[ModuleRole]
			AND		USRDET3.[FCT Role]			= USRDET1.[FCT Role]
			AND		USRDET3.[Organisation]		= USRDET1.[Organisation]
			AND		USRDET3.[MDS Data Access]	IS NOT NULL
			FOR XML PATH('') 
		), 1 ,1 , '')
	) AS [MDS Data Access]
	,
	-- LTRIM(
	--	STUFF((
	--		SELECT ', ' + USRDET4.[FCT Role]
	--		FROM	#tmpUserDetails	USRDET4
	--		WHERE	USRDET4.[EdenEmail]			= USRDET1.[EdenEmail]
	--		AND		USRDET4.[MDS Data Type]		= USRDET1.[MDS Data Type]
	--		AND		USRDET4.[Organisation]		= USRDET1.[Organisation]
	--		FOR XML PATH('') 
	--	), 1 ,1 , '')
	--) AS  
	[FCT Role]
	--, [MDS Data Type]
	--, [MDS Data Access]
FROM	#tmpUserDetails	USRDET1
--WHERE	USRDET1.[FCT Role] LIKE '%GROUND%'	--USRDET1.[ModuleRole]		IS NOT NULL
ORDER BY	[Organisation], [UserName]--, [MDS Data Type]