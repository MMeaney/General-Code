USE	[EdenSSO-PRD]

DECLARE @EdenEmail	VARCHAR(100) = 'wil.vanderputten@hse.ie'


-- ************************************************************************************
-- **** Current Licence Access
-- ************************************************************************************

SELECT DISTINCT
	LPRNM.LicenceCode			AS	[Licence Code]
	, LPRNM.LicenceProfileName	AS	[Licence Name]
	, ORG.Name					AS	[Organisation]
	, LPRNM.LicenceType			AS  [Licence Type]
	, LPA.Active				AS	[Active]
FROM		dbo.UserProfile				UPR
LEFT JOIN	dbo.UserMembership			UMB		ON	UMB.UserId				= UPR.UserId
LEFT JOIN	dbo.LicenceProfileAccess	LPA		ON	LPA.UserId				= UPR.UserId
LEFT JOIN	dbo.LicenceProfile			LPRNM	ON	LPA.LicenceProfileId	= LPRNM.LicenceProfileId
LEFT JOIN	dbo.OrganisationMembership	OMB		ON	OMB.UserId				= UPR.UserId
LEFT JOIN	dbo.Organisation			ORG		ON	(
													ORG.OrganisationId		= OMB.OrganisationId
													AND	
													ORG.OrganisationId		= LPRNM.OrganisationId
													)
WHERE	ORG.Name IS NOT NULL
AND		UPR.Email = @EdenEmail
--AND		LPRNM.LicenceCode LIKE 'W%'


-- ************************************************************************************
-- **** Available Licences (Excluding Licences That Have Already Been Granted)
-- ************************************************************************************

SELECT DISTINCT
	LPR.LicenceCode				AS	[Licence Code]
	, LPR.LicenceProfileName	AS	[Licence Name]
	, ORG.Name					AS	[Organisation]
	, LPR.LicenceType			AS  [Licence Type]
	, LPR.Active				AS	[Active]
FROM		dbo.UserProfile				UPR  
LEFT JOIN	dbo.OrganisationMembership	OMB		ON	OMB.UserId			= UPR.UserId
LEFT JOIN	dbo.Organisation			ORG		ON	ORG.OrganisationId	= OMB.OrganisationId
LEFT JOIN	dbo.LicenceProfile			LPR		ON	LPR.OrganisationId	= ORG.OrganisationId
WHERE		LPR.Active = 1
AND			UPR.Email = @EdenEmail
AND			LPR.LicenceCode	NOT IN
	(
	SELECT DISTINCT
	LPRNM.LicenceCode
    FROM		dbo.UserProfile				UPR
    LEFT JOIN	dbo.UserMembership			UMB		ON	UMB.UserId				= UPR.UserId
    LEFT JOIN	dbo.LicenceProfileAccess	LPA		ON	LPA.UserId				= UPR.UserId
    LEFT JOIN	dbo.LicenceProfile			LPRNM	ON	LPA.LicenceProfileId	= LPRNM.LicenceProfileId
    LEFT JOIN	dbo.OrganisationMembership	OMB		ON	OMB.UserId				= UPR.UserId
    LEFT JOIN	dbo.Organisation			ORG		ON	(
													    ORG.OrganisationId		= OMB.OrganisationId
													    AND	
														ORG.OrganisationId		= LPRNM.OrganisationId
														)
    WHERE	ORG.Name IS NOT NULL
    AND		UPR.Email = @EdenEmail
	)


-- ************************************************************************************
-- **** All Available Licences
-- ************************************************************************************

SELECT DISTINCT
	LPR.LicenceCode				AS	[Licence Code]
	, LPR.LicenceProfileName	AS	[Licence Name]
	, ORG.Name					AS	[Organisation]
	, LPR.LicenceType			AS  [Licence Type]
	, LPR.Active				AS	[Active]
FROM		dbo.UserProfile				UPR  
LEFT JOIN	dbo.OrganisationMembership	OMB		ON	OMB.UserId			= UPR.UserId
LEFT JOIN	dbo.Organisation			ORG		ON	ORG.OrganisationId	= OMB.OrganisationId
LEFT JOIN	dbo.LicenceProfile			LPR		ON	LPR.OrganisationId	= ORG.OrganisationId
WHERE		LPR.Active = 1
AND			UPR.Email = @EdenEmail


-- ************************************************************************************
-- **** Potentially Available Licences (If Organisation Access Approved)
-- ************************************************************************************

SELECT DISTINCT
	LPR.LicenceCode				AS	[Licence Code]
	, LPR.LicenceProfileName	AS	[Licence Name]
	, ORG.Name					AS	[Organisation]
	, LPR.LicenceType			AS  [Licence Type]
	, LPR.Active				AS	[Active]
FROM		dbo.UserProfile						UPR  
LEFT JOIN	dbo.OrganisationMembershipRequest	OMBR	ON	OMBR.UserId			= UPR.UserId
LEFT JOIN	dbo.Organisation					ORG		ON	ORG.OrganisationId	= OMBR.OrganisationId
LEFT JOIN	dbo.LicenceProfile					LPR		ON	LPR.OrganisationId	= OMBR.OrganisationId
WHERE		LPR.Active	= 1
AND			OMBR.Active	= 1
AND			UPR.Email = @EdenEmail