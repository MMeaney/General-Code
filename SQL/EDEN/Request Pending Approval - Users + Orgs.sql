-- **************************************************************
-- *** Users and organisations pending approval
-- **************************************************************


-- **************************************************************
-- *** Organisation request pending approval

USE	[EdenSSO-PRD]

SELECT DISTINCT
	OMAR.OrganisationModuleAuthorisationRequestId
	, ORQ.Name
	, LTRIM(RTRIM(UPR.FirstName)) + ' ' + LTRIM(RTRIM(UPR.LastName)) AS	[Name]
	, UPR.Email
	, MDLRQ.Name			AS	[Module]
	, OMAR.RequestDate
FROM		dbo.UserProfile								UPR
RIGHT JOIN	dbo.OrganisationModuleAuthorisationRequest	OMAR	ON	OMAR.UserID					= UPR.UserID
LEFT JOIN	dbo.OrganisationRequest						ORQ		ON	ORQ.OrganisationRequestId	= OMAR.OrganisationRequestId
LEFT JOIN	dbo.Module				  					MDLRQ	ON	MDLRQ.ModuleId				= OMAR.ModuleId
LEFT JOIN	dbo.ModuleAuthorisation						MAURQ	ON	MAURQ.UserId				= OMAR.UserID
ORDER BY	OMAR.RequestDate	DESC

--select * from OrganisationModuleAuthorisationRequest
--select * from OrganisationRequest

-- **************************************************************
-- *** User module application request pending approval

USE	[EdenSSO-PRD]

SELECT DISTINCT
	LTRIM(RTRIM(UPR.FirstName)) + ' ' + LTRIM(RTRIM(UPR.LastName)) AS	[Name]
	, ORG.Name			AS	[Organisation]
	, MDL.Name			AS	[Module]
	, MAR.RequestDate
	, MAU.Active		AS	[ActReq]
	, MDL.Active		AS	[ActMod]
	, UPR.Active		AS	[ActUsr]
	, UPR.Email
	, MAR.ModuleAuthorisationRequestId
FROM		dbo.ModuleAuthorisationRequest	MAR
LEFT JOIN	dbo.UserProfile					UPR	ON	UPR.UserID			= MAR.UserID
LEFT JOIN	dbo.Organisation				ORG	ON	ORG.OrganisationId	= MAR.OrganisationId
LEFT JOIN	dbo.Module				  		MDL	ON	MDL.ModuleId		= MAR.ModuleId
LEFT JOIN	dbo.ModuleAuthorisation			MAU	ON	MAU.UserId			= MAR.UserID
--WHERE		ORG.Name LIKE '%SSE%'
--UPR.Email	=	 '%sse.ie%'
--(MAU.Active <>	 '0' OR MAU.Active IS NULL)
--AND			MDL.Active	=	 '1'
--AND			UPR.Email	=	 'vida.reynolds@hse.ie'
--AND			UPR.Active	=	 '0'
--AND			MDL.Name		=	 'Article27'
ORDER BY	MDL.Name, ORG.Name, Name