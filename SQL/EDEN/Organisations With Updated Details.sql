-- ************************************************************
-- *** Determine organisations where details have been updated
-- ************************************************************

USE [EdenSSO-PRD]

SELECT
	ORGAUD.AuditOrganisationId
	, ORGAUD.OrganisationId
	, ORGAUD.OrganisationTypeId
	, ORGAUD.Code
	, ORGAUD.Name
	, ORGAUD.Active
	, ORGAUD.UpdatedOn
	, UPR.FirstName + ' ' + UPR.LastName	AS [UpdatedBy]
FROM		[EdenSSO-PRD].[dbo].[AuditOrganisation]			ORGAUD
INNER JOIN	[EdenSSO-PRD].[dbo].[UserProfile]				UPR		ON UPR.UserId	=	ORGAUD.UpdatedBy
INNER JOIN	[EdenSSO-PRD].[dbo].[OrganisationMembership]	ORGMEM	ON ORGMEM.OrganisationId = ORGAUD.OrganisationId
WHERE		ORGAUD.OrganisationId	IN (
				SELECT		OrganisationId
				FROM		[EdenSSO-PRD].[dbo].[AuditOrganisation] ORGAUD
				GROUP BY	OrganisationId
				HAVING COUNT(*) > 1
				)
ORDER BY ORGAUD.OrganisationId, ORGAUD.UpdatedOn


--SELECT * FROM [EdenSSO-PRD].[dbo].[AuditOrganisation]	WHERE	Name LIKE '%Droim%'
--SELECT * FROM [EdenSSO-PRD].[dbo].[AuditOrganisation]	WHERE	OrganisationId	=	'C2CDAE55-117E-42E6-8237-849E016684E5'
--SELECT * FROM [EdenSSO-PRD].[dbo].[Organisation]		WHERE	OrganisationId	=	'C2CDAE55-117E-42E6-8237-849E016684E5'

-- *** Organisation membership details (for finding inactive users)
SELECT TOP 1000 
	--ORGMEM.OrganisationMembershipId
	--, ORGMEM.OrganisationId
	ORG.Name	AS	[OrgName]
	--, ORGMEM.UserId
	, UPRMEM.FirstName + ' ' + UPRMEM.LastName	AS [MemberName]
	, UPRMEM.Email
	, ORGMEM.MemberSince
	, ORGMEM.LastUpdatedOn
	, UPRUPD.FirstName + ' ' + UPRUPD.LastName	AS [UpdatedBy]
	--, ORGMEM.LastUpdatedBy
	--, ORGMEM.DefaultOrganisation
	--, ORGMEM.CurrentOrganisation
	--, ORGMEM.Administrator
	, ORGMEM.Active
FROM		[EdenSSO-PRD].[dbo].[OrganisationMembership]	ORGMEM
INNER JOIN	[EdenSSO-PRD].[dbo].[Organisation]				ORG			ON	ORGMEM.OrganisationId = ORG.OrganisationId
INNER JOIN	[EdenSSO-PRD].[dbo].[UserProfile]				UPRMEM		ON	ORGMEM.UserId = UPRMEM.UserId
INNER JOIN	[EdenSSO-PRD].[dbo].[UserProfile]				UPRUPD		ON	ORGMEM.LastUpdatedBy = UPRUPD.UserId
WHERE ORGMEM.OrganisationId =	'C2CDAE55-117E-42E6-8237-849E016684E5'