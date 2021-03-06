USE [EdenSSO-PRD]

SELECT
	CCTUS.Email
	, CCTUS.CreatedOn
	, ORGQRY.Name					AS [Organisation]
	, CASE
		WHEN FNAREA.Name	= 'EDEN Single Sign-On Portal'
			THEN 'EDEN'
			ELSE FNAREA.Name			
		END
		AS [FunctionalArea]
	, 'ContactUs'				AS [Contact Type]
	, CCTUS.FirstName + ' '	
		+ CCTUS.LastName		AS [Contact person]
	, CASE
		WHEN FNAREA.Name	= 'EDEN Single Sign-On Portal'
			THEN 'Portal'
			ELSE FNAREA.Name			
		END
		AS [FunctionalArea]
	, QRYTP.Name				AS [QueryType]
	, CCTUS.[Subject]
	, CCTUS.[Message]
	, CCTUS.SentOn
	, QRYTP.[External]
	, QRYTP.SupportTeamEmail
	, UPRQRY.Active
	, UPRQRY.Username			AS [EDENUserName]
	, ORGQRY.Code				AS [OrgCode]
	, CCTUS.ContactUsId

FROM		dbo.ContactUs				CCTUS
LEFT JOIN	dbo.QueryType				QRYTP	ON	QRYTP.QueryTypeId		= CCTUS.QueryTypeId
LEFT JOIN	dbo.FunctionalArea			FNAREA	ON	FNAREA.FunctionalAreaId	= QRYTP.FunctionalAreaId
LEFT JOIN	dbo.UserProfile				UPRQRY	ON	UPRQRY.UserId			= CCTUS.UserId
LEFT JOIN	dbo.UserMembership			UMBQRY	ON	UMBQRY.UserId			= UPRQRY.UserId
LEFT JOIN	dbo.OrganisationMembership	OMBQRY	ON	OMBQRY.UserId			= UPRQRY.UserId
LEFT JOIN	dbo.Organisation			ORGQRY	ON	ORGQRY.OrganisationId	= OMBQRY.OrganisationId

WHERE	CCTUS.[Subject]		NOT LIKE '%TEST%'
AND	(	OMBQRY.DefaultOrganisation = 1
	OR	UPRQRY.UserId		IS NULL
	)

--AND		QRYTP.SupportTeamEmail	LIKE '%ORP%'
--AND	FNAREA.Name	= 'Radiological Protection'
--AND	FNAREA.Name	= 'EDEN Single Sign-On Portal'
and supportteamemail ='niecesupport@edenireland.ie'
ORDER BY CCTUS.CreatedOn DESC, CCTUS.SentOn DESC






























/*

SELECT
	CCTUS.ContactUsId
	, CCTUS.FirstName
	, CCTUS.LastName
	, CCTUS.Email
	, CCTUS.UserId
	, CCTUS.[Subject]
	, CCTUS.[Message]
	, CCTUS.QueryTypeId
	, CCTUS.CreatedOn
	, CCTUS.SentOn
FROM		dbo.ContactUs		CCTUS

SELECT 
	QRYTP.QueryTypeId
	, QRYTP.Name
	, QRYTP.FunctionalAreaId
	, QRYTP.[External]
	, QRYTP.SupportTeamEmail
	, QRYTP.DisplayOrder
FROM		dbo.QueryType		QRYTP

SELECT 
	FNAREA.FunctionalAreaId
	, FNAREA.Name
FROM		dbo.FunctionalArea	FNAREA

--*/