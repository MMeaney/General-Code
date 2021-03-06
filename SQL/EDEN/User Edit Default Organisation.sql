-- *********************************************************
-- *** Edit user default organisation
-- *********************************************************

USE [EdenSSO-PRD]

DECLARE @EdenEmail	VARCHAR(100) = 'eddie.conran@hse.ie'
DECLARE @UserID		VARCHAR(100) = NULL

SELECT DISTINCT 
	UPR.Email															AS	[Eden Email]
	, ISNULL(UPR.Email2, '<Contact not synced to CRM>')	 				AS	[CRM Email]
	, LTRIM(RTRIM(UPR.FirstName))  + ' ' + LTRIM(RTRIM(UPR.LastName))	AS	[User's Name]
	, ISNULL(ORG.Name,'<No org approved>')								AS	[Organisation]
	, UMB.PasswordExpiration											AS	[Password Expiration]
	, UPR.UserId
	, UPR.Active
	, OMB.DefaultOrganisation											AS	[Default]
	, OMB.CurrentOrganisation											AS	[Current]
	, OMB.OrganisationMembershipId
FROM		dbo.UserProfile					UPR
LEFT JOIN	dbo.UserMembership				UMB	ON	UMB.UserId				= UPR.UserId
LEFT JOIN	dbo.OrganisationMembership		OMB	ON	OMB.UserId				= UPR.UserId
LEFT JOIN	dbo.Organisation				ORG	ON	ORG.OrganisationId		= OMB.OrganisationId
LEFT JOIN	dbo.OrganisationAddress			OAD	ON	OAD.OrganisationId		= ORG.OrganisationId
LEFT JOIN	dbo.OrganisationType			OTY	ON	OTY.OrganisationTypeId  = ORG.OrganisationTypeId
LEFT JOIN	dbo.ModuleAuthorisationRequest	MAR	ON  MAR.UserID				= UPR.UserID
WHERE	UPR.Email = @EdenEmail

SELECT DISTINCT UserId FROM dbo.UserProfile	WHERE Email = @EdenEmail

SELECT DISTINCT 
	OrganisationMembershipId
	, OrganisationId
	, UserId
	, MemberSince
	, LastUpdatedOn
	, LastUpdatedBy
	, DefaultOrganisation
	, CurrentOrganisation
	, Administrator
	, Active
FROM	dbo.OrganisationMembership
WHERE	UserId IN (SELECT DISTINCT UserId FROM dbo.UserProfile	WHERE Email = @EdenEmail)
AND		DefaultOrganisation = 1

--BEGIN TRANSACTION
--UPDATE	dbo.OrganisationMembership
--SET		DefaultOrganisation = 0
--WHERE	OrganisationMembershipId = '68834409-9C69-494A-9306-58D81D8D9F97'
----COMMIT TRANSACTION
----ROLLBACK TRANSACTION