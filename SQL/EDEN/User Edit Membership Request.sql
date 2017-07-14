-- ******************************************************************************
-- *** User: Edit Membership Request
-- *** Organisation request: Update the organisation requested
-- ******************************************************************************

USE	[EdenSSO-PRD]

DECLARE @EdenEmail	VARCHAR(100) = NULL,
		@FirstName	VARCHAR(100) = NULL,
		@LastName	VARCHAR(100) = NULL,
		@OrgName	VARCHAR(100) = NULL,
		@Module		VARCHAR(100) = NULL,
		@UserIdUPR	VARCHAR(100) = NULL,
		@UserIdPASS	VARCHAR(100) = NULL,
		@UserToken	VARCHAR(100) = NULL,
		@CorrectOrg	VARCHAR(100) = NULL

SET		@EdenEmail	= 'marie.tuohy@hse.ie'
SET		@CorrectOrg	= 'HSE - Carlow/Kilkenny & South Tipperary'
--SET	@EdenEmail	= NULL
--SET	@FirstName	= 'jean'
--SET	@LastName	= 'morrissey'
--SET	@OrgName	= 'Thomas Murray'
SET	@Module		= 'AM'
--SET	@UserIdUPR	= NULL
--SET	@UserIdPASS	= NULL
--SET	@UserToken	= NULL
SET		@OrgName	= NULL


IF OBJECT_ID('Tempdb..#tmpUserToken')	IS NOT NULL
	BEGIN	DROP TABLE #tmpUserToken	END

SELECT	Token		
INTO	#tmpUserToken
FROM	[EdenIdentity-PRD].dbo.Password	
WHERE	Email LIKE @EdenEmail
ORDER BY CreatedOn	DESC

SET		@UserIdUPR	= (SELECT DISTINCT UserId		FROM [EdenSSO-PRD].dbo.UserProfile		WHERE Email LIKE @EdenEmail)
SET		@UserIdPASS	= (SELECT DISTINCT EdenUserId	FROM [EdenIdentity-PRD].dbo.Password	WHERE Email LIKE @EdenEmail)
SET		@UserToken	= (SELECT TOP (1)  Token		FROM #tmpUserToken)

-- *************************************************************************
-- *** Identify membership request

SELECT DISTINCT
	UPR.Email		  AS	[EdenEmail]
	, UPR.Username	  AS	[EdenUsername]
	, UPR.Email2	  AS	[CRMEmail]
	, ORG.Name		  AS	[Organisation]
	, ORG.OrganisationId
	, UPR.UserId
	, MDL.Name		  AS	[Module]
	, MAU.Active	  AS	[ModActive]
	, UMB.PasswordExpiration
	, UPR.Email2	  AS	[CRMEmail]
	, OTY.Name		  AS	[OrganisationType]
	, UPR.Active
	, LTRIM(RTRIM(UPR.FirstName))  + ' ' + LTRIM(RTRIM(UPR.LastName))	AS	[Name]

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

WHERE	(UPR.Email		LIKE '%' + (@EdenEmail)	+ '%' OR (@EdenEmail)	IS NULL)
AND		(ORG.Name		LIKE '%' + (@OrgName)	+ '%' OR (@OrgName)		IS NULL)
AND		(UPR.FirstName	LIKE '%' + (@FirstName)	+ '%' OR (@FirstName)	IS NULL)
AND		(UPR.LastName	LIKE '%' + (@LastName)	+ '%' OR (@LastName)	IS NULL)
AND		(MDL.StaticName	LIKE '%' + (@Module	)	+ '%' OR (@Module)		IS NULL)

ORDER BY	UMB.PasswordExpiration DESC, UPR.Email, MDL.Name, OTY.Name, ORG.Name


SELECT * FROM [EdenSSO-PRD].dbo.OrganisationMembershipRequest	WHERE UserId = @UserIdUPR OR UserId = @UserIdPASS
SELECT * FROM [EdenSSO-PRD].dbo.ModuleAuthorisationRequest		WHERE UserId = @UserIdUPR OR UserId = @UserIdPASS
SELECT * FROM [EdenSSO-PRD].dbo.Module							WHERE StaticName = @Module


-- *************************************************************************
-- *** Edit membership request

-- *** Identify Correct organisation

SELECT * FROM [EdenSSO-PRD].dbo.Organisation
WHERE Name	LIKE	'%' + @CorrectOrg + '%'

----BEGIN TRANSACTION
--UPDATE	dbo.OrganisationMembershipRequest
--SET		OrganisationId	= 'DD84D5F3-A5B6-E411-B3B4-0050568A69E2'
--WHERE	UserId			= 'AF3D1D14-F7AC-4787-A31B-01A2284325E0'
----COMMIT TRANSACTION
----ROLLBACK TRANSACTION


-- *************************************************************************
-- *** Create NEW requests



--INSERT INTO dbo.OrganisationMembershipRequest
--(
--OrganisationMembershipRequestID
--, OrganisationID
--, UserId
--, RequestDate
--, Active
--)
--VALUES
--(
--NEWID()
--, 'C9C19C50-02A2-DE11-BF72-0022642A33B2'
--, 'CF9658B1-4713-4E96-94A2-9C35145659A7'
--, GETDATE()
--, 1
--)


--INSERT INTO dbo.ModuleAuthorisationRequest
--(
--ModuleAuthorisationRequestId
--, OrganisationID
--, UserId
--, ModuleID
--, RequestDate
--, Active
--)
--VALUES
--(
--NEWID()
--, 'C9C19C50-02A2-DE11-BF72-0022642A33B2'
--, 'CF9658B1-4713-4E96-94A2-9C35145659A7'
--, '58F711D9-26B1-E411-B3B4-0050568A69E2'
--, GETDATE()
--, 1
--)
