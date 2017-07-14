-- *******************************************
-- *** Update user organisation memebership


USE	[EdenSSO-PRD]

-- 7C310BE0-C20F-DE11-B526-0022642A33B2 EPA STG Org
-- 66298E85-AC36-4634-A8FF-5D7383204F7B Barry Houlihan
-- 566E449A-AC49-4365-BD52-943B73FB10D6 Maurice Meaney


BEGIN TRANSACTION
INSERT INTO dbo.OrganisationMembership
VALUES(
	NEWID()
	, '7C310BE0-C20F-DE11-B526-0022642A33B2'
	, '66298E85-AC36-4634-A8FF-5D7383204F7B'
	, '14-OCT-2015'
	, '14-OCT-2015'
	, '566E449A-AC49-4365-BD52-943B73FB10D6'
	, 0
	, 0
	, 0
	, 1
)

COMMIT TRANSACTION
--ROLLBACK TRANSACTION

SELECT * FROM dbo.UserProfile WHERE UserId = 'EB2BE35C-06F1-4E44-8901-02EF200D6F1B'
SELECT * FROM dbo.OrganisationMembership WHERE UserId = 'EB2BE35C-06F1-4E44-8901-02EF200D6F1B'

-- *******************************************
-- *** User details

SELECT DISTINCT
	UPR.Email		  AS	[EdenEmail]
	, UPR.Username	  AS	[EdenUsername]
	, ORG.Name		  AS	[Organisation]
	, MDL.Name		  AS	[Module]
	, MAU.Active	  AS	[ModActive]
	, UMB.PasswordExpiration
	, UPR.Email2	  AS	[CRMEmail]
	, OTY.Name		  AS	[OrganisationType]
	, UPR.Active
	, LTRIM(RTRIM(UPR.FirstName))  + ' ' + LTRIM(RTRIM(UPR.LastName))	AS	[Name]
	, LTRIM(RTRIM(APRV.FirstName)) + ' ' + LTRIM(RTRIM(APRV.LastName))	AS	[ApprovedBy]
	--, NOTF.Data		  AS	[Notification]
	--, NOTF.EmailSentOn
	--, NTDF.Name		  AS	[NotificationDefinition]
	--, EVT.Name		  AS	[EventType]
	, UPR.*
	, ORG.*
	--, UMB.*
	--, MDL.*
FROM		dbo.UserProfile				UPR
LEFT JOIN	dbo.UserMembership			UMB	 ON	UMB.UserId						= UPR.UserId
LEFT JOIN	dbo.OrganisationMembership	OMB	 ON	OMB.UserId						= UPR.UserId
LEFT JOIN	dbo.Organisation			ORG	 ON	ORG.OrganisationId				= OMB.OrganisationId
LEFT JOIN	dbo.OrganisationType		OTY	 ON	OTY.OrganisationTypeId			= ORG.OrganisationTypeId
LEFT JOIN	dbo.ModuleAuthorisation		MAU	 ON	MAU.UserId						= OMB.UserID
LEFT JOIN	dbo.UserProfile				APRV ON APRV.UserId						= MAU.LastUpdatedBy
LEFT JOIN	dbo.Module				  	MDL	 ON	MDL.ModuleId					= MAU.ModuleId
LEFT JOIN	dbo.Notification			NOTF ON	NOTF.AddresseeUserId			= UPR.UserId
LEFT JOIN	dbo.NotificationDefinition	NTDF ON NTDF.NotificationDefinitionId	= NOTF.NotificationDefinition
LEFT JOIN	dbo.EventType				EVT  ON EVT.EventTypeId					= NTDF.EventTypeId

WHERE		UPR.Email	LIKE '%b.houlihan@epa.ie%'
--WHERE		UPR.Phone	LIKE '%45%439464%'
ORDER BY	UMB.PasswordExpiration, UPR.Email, MDL.Name, OTY.Name, ORG.Name
