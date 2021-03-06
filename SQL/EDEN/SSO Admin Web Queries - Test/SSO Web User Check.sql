-- **************************************************************
-- *** Member organisation details, including who granted access
-- **************************************************************

USE	[EdenSSO-TST]

DECLARE @EdenEmail			VARCHAR(100) = NULL
DECLARE	@Username			VARCHAR(100) = NULL
DECLARE	@FirstName			VARCHAR(100) = NULL
DECLARE	@LastName			VARCHAR(100) = NULL
DECLARE	@OrgName			VARCHAR(100) = NULL
DECLARE	@Module				VARCHAR(100) = NULL
DECLARE	@UserIdUPR			VARCHAR(100) = NULL
DECLARE	@UserIdUSR			VARCHAR(100) = NULL
DECLARE	@UserIdPASS			VARCHAR(100) = NULL
DECLARE	@UserToken			VARCHAR(100) = NULL
DECLARE	@sqlmain			VARCHAR(MAX) = NULL
DECLARE	@sqlwhere			VARCHAR(MAX) = NULL
DECLARE @AccVerification	VARCHAR(MAX) = NULL
DECLARE	@AccVerificationID	VARCHAR(MAX) = NULL
DECLARE	@PasswordReset		VARCHAR(MAX) = NULL

SET	@EdenEmail		= 'MMEPATest+20160624-1@gmail.com'
--SET	@Username	= NULL;
--SET	@EdenEmail	= NULL;
--SET	@FirstName	= 'MICHAEL';
--SET	@LastName	= 'FRAHER';
--SET	@OrgName	= 'GROVE';
--SET	@Module		= 'WFD';
--SET	@UserIdUPR	= NULL;
--SET	@UserIdPASS	= NULL;
--SET	@UserToken	= NULL;

IF OBJECT_ID('Tempdb..#tmpUserToken')	IS NOT NULL
	BEGIN	DROP TABLE #tmpUserToken	END
SELECT Token INTO #tmpUserToken FROM [EdenIdentity-TST].dbo.[User] WHERE Email LIKE @EdenEmail ORDER BY CreatedOn DESC

SET		@UserIdUPR	= (SELECT DISTINCT UserId		FROM [EdenSSO-TST].dbo.UserProfile		WHERE Email LIKE @EdenEmail)
SET		@UserIdUSR	= (SELECT DISTINCT UniqueId		FROM [EdenIdentity-TST].dbo.[User]		WHERE Email LIKE @EdenEmail)
SET		@UserIdPASS	= (SELECT DISTINCT EdenUserId	FROM [EdenIdentity-TST].dbo.Password	WHERE Email LIKE @EdenEmail)
SET		@UserToken	= (SELECT TOP (1)  Token		FROM #tmpUserToken)


PRINT	'User ID (EDEN SSO User Table): ' + @UserIdUPR
PRINT	'User ID (EDEN Identity User Table): ' + @UserIdUSR
PRINT	'User ID (EDEN Identity Password Table): ' + @UserIdPASS
PRINT	'User Password Token: ' + @UserToken
		
SELECT	@AccVerification	= 'Account verification link: https://account.edenireland.ie/signup/confirmemail?userId=' + @UserIdUPR + '&token=' + @UserToken
SELECT	@AccVerificationID	= 'Account verification link: https://account.edenireland.ie/signup/confirmemail?userId=' + @UserIdUSR + '&token=' + @UserToken
SELECT	@PasswordReset		= 'Password reset link: https://account.edenireland.ie/passwordreset/resetpassword?userId=' + @UserIdPASS + '&token=' + @UserToken

PRINT	@AccVerification
PRINT	@AccVerificationID
PRINT	@PasswordReset

SELECT DISTINCT
	UPR.Email					AS	[EdenEmail]
	, UPR.Email2				AS	[CRMEmail]
	, LTRIM(RTRIM(UPR.FirstName))  + ' ' + LTRIM(RTRIM(UPR.LastName))	AS	[UserName]
	, ORG.Name					AS	[Organisation]
	, UMB.PasswordExpiration
	, MDL.StaticName			AS	[Module]
	, MDROL.Name				AS	[ModuleRole]
	, ORQN.Name					AS	[OrgReq]
	, ORMQ.RequestDate
	, MDRQ.StaticName			AS	[ModReq]
	, ORQ.Name					AS	[OrgCreReq]
	, MDLRQ.StaticName			AS	[ModCreReq]
	, UPR.UserId
	, UPR.Active

FROM		dbo.UserProfile						UPR
LEFT JOIN	dbo.UserMembership					UMB		ON	UMB.UserId						= UPR.UserId
LEFT JOIN	dbo.OrganisationMembership			OMB		ON	OMB.UserId						= UPR.UserId
LEFT JOIN	dbo.Organisation					ORG		ON	ORG.OrganisationId				= OMB.OrganisationId
LEFT JOIN	dbo.OrganisationAddress				OAD		ON	OAD.OrganisationId				= ORG.OrganisationId
LEFT JOIN	dbo.OrganisationType				OTY		ON	OTY.OrganisationTypeId			= ORG.OrganisationTypeId
LEFT JOIN	dbo.ModuleAuthorisation				MAU		ON	MAU.UserId						= OMB.UserID
LEFT JOIN	dbo.ModuleAuthorisationRole			MAUROL	ON	MAUROL.ModuleAuthorisationId	= MAU.ModuleAuthorisationId
LEFT JOIN	dbo.Role							MDROL	ON	MDROL.RoleId					= MAUROL.RoleId
LEFT JOIN	dbo.ModuleAuthorisationRequest		MAR		ON  MAR.UserID						= UPR.UserID
LEFT JOIN	dbo.UserProfile						APRV	ON  APRV.UserId						= MAU.LastUpdatedBy
LEFT JOIN	dbo.Module				  			MDL		ON	MDL.ModuleId					= MAU.ModuleId
LEFT JOIN	dbo.Module				  			MDRQ	ON	MDRQ.ModuleId					= MAR.ModuleId
LEFT JOIN	dbo.Notification					NOTF	ON	NOTF.AddresseeUserId			= UPR.UserId
LEFT JOIN	dbo.NotificationDefinition			NTDF	ON  NTDF.NotificationDefinitionId	= NOTF.NotificationDefinition
LEFT JOIN	dbo.EventType						EVT		ON  EVT.EventTypeId					= NTDF.EventTypeId
LEFT JOIN	dbo.OrganisationMembershipRequest	ORMQ	ON	ORMQ.UserId						= UPR.UserId
LEFT JOIN	dbo.Organisation					ORQN	ON	ORQN.OrganisationId				= ORMQ.OrganisationId
LEFT JOIN	dbo.OrganisationModuleAuthorisationRequest	OMAR	ON	OMAR.UserID				= UPR.UserID
LEFT JOIN	dbo.OrganisationRequest				ORQ		ON	ORQ.OrganisationRequestId		= OMAR.OrganisationRequestId
LEFT JOIN	dbo.Module				  			MDLRQ	ON	MDLRQ.ModuleId					= OMAR.ModuleId
LEFT JOIN	dbo.ModuleAuthorisation				MAURQ	ON	MAURQ.UserId					= OMAR.UserID
LEFT JOIN	dbo.BusinessType		  			BTY		ON	BTY.BusinessTypeID				= ORQ.BusinessTypeID
LEFT JOIN	dbo.OrganisationAddress				ADDR	ON	ADDR.OrganisationId				= ORG.OrganisationId
LEFT JOIN	dbo.County							CNT		ON	CNT.CountyId					= ADDR.CountyId
LEFT JOIN	dbo.Country							CTRY	ON	CTRY.CountryId					= ADDR.CountryId
LEFT JOIN	[EdenIdentity-TST].dbo.[User]		USRID	ON	USRID.UniqueId					= UPR.UserId

WHERE	(UPR.Email		LIKE '%' + (@EdenEmail)	+ '%' OR (@EdenEmail)	IS NULL)
AND		(ORG.Name		LIKE '%' + (@OrgName)	+ '%' OR (@OrgName)		IS NULL)
AND		(UPR.FirstName	LIKE '%' + (@FirstName)	+ '%' OR (@FirstName)	IS NULL)
AND		(UPR.LastName	LIKE '%' + (@LastName)	+ '%' OR (@LastName)	IS NULL)
AND		(MDL.StaticName	LIKE '%' + (@Module	)	+ '%' OR (@Module)		IS NULL)

--WHERE		ORQN.Name	IS NOT NULL

--ORDER BY	ORG.Name, [UserName], UMB.PasswordExpiration, UPR.Email, MDL.StaticName, OTY.Name--, NOTF.EmailSentOn DESC


--PRINT @sqlmain;

--SELECT * FROM dbo.OrganisationRequest	WHERE Name = 'BARTY SULLIVANS THE CHEMIST LIMITED'

-- *************************
-- *** Module Authorisation

--SELECT 
--	LTRIM(RTRIM(UPR.FirstName))  + ' ' + LTRIM(RTRIM(UPR.LastName))	AS	[UserName]
--	, UPR.UserId
--	, UPR.Email			AS	[EdenEmail]
--	, ORG.Name			AS	[Organisation]
--	, MDL.ShortName		AS	[Module]
--	, ROL.Name			AS	[Role]
--	, MAU.Active
--	, MAU.LastUpdatedOn
--	, LTRIM(RTRIM(UPMAU.FirstName)) + ' ' + LTRIM(RTRIM(UPMAU.LastName))	AS	[LastUpdatedBy]

--FROM		dbo.ModuleAuthorisation		MAU
--LEFT JOIN	dbo.ModuleAuthorisationRole MAUROL	ON	MAUROL.ModuleAuthorisationId	= MAU.ModuleAuthorisationId
--LEFT JOIN	dbo.Module				  	MDL		ON	MDL.ModuleId					= MAU.ModuleId
--LEFT JOIN	dbo.[Role]					ROL		ON	ROL.RoleId						= MAUROL.RoleId
--LEFT JOIN	dbo.Organisation			ORG		ON	ORG.OrganisationId				= MAU.OrganisationId
--LEFT JOIN	dbo.UserProfile				UPR		ON	UPR.UserId						= MAU.UserId
--LEFT JOIN	dbo.UserProfile				UPMAU	ON	UPMAU.UserId					= MAU.LastUpdatedBy
--WHERE		MAU.UserId = 'BA82D384-B178-E511-A5DB-0050568A69E2'

--SELECT * FROM dbo.Organisation WHERE Name LIKE '%Mr Brian Honeyman and Mr Ivars Mozumacs%'
--SELECT * FROM dbo.OrganisationModuleAuthorisationRequest WHERE UserId = 'DC1C774A-08F3-4E70-8629-79C5C4101AC1'
--SELECT * FROM dbo.ModuleAuthorisationRequest WHERE UserId = '2E62DE59-86A2-498C-A595-1A24B8C9447D'
--SELECT * FROM dbo.UserProfile WHERE UserId = '2E62DE59-86A2-498C-A595-1A24B8C9447D'


/*

	--, NOTF.Data		  AS	[Notification]
	--, NOTF.EmailSentOn
	--, NTDF.Name		  AS	[NotificationDefinition]
	--, EVT.Name		  AS	[EventType]
*/

--DECLARE @email_addr NVARCHAR(MAX)
--SET		@EdenEmail = '%mcleary@paragonair.ie%'

SELECT * FROM [EdenSSO-TST].dbo.UserProfile				WHERE Email LIKE (@EdenEmail)
SELECT * FROM [EdenIdentity-TST].dbo.[User]				WHERE Email LIKE (@EdenEmail)
SELECT * FROM [EdenIdentity-TST].dbo.Password			WHERE Email LIKE (@EdenEmail)	 ORDER BY CreatedOn	DESC
SELECT * FROM [EdenIdentity-TST].dbo.TempOrganisation	WHERE Email LIKE (@EdenEmail)
SELECT * FROM [EdenIdentity-TST].dbo.TempContactDetail	WHERE Email LIKE (@EdenEmail)


--DECLARE @usrid NVARCHAR(MAX)
--SET		@usrid = 'BC66771F-41BD-4DAF-A789-E01B81390672'

SELECT * FROM [EdenSSO-TST].dbo.UserProfile				WHERE UserId = (@UserIdUPR) OR UserId = (@UserIdPASS)
SELECT * FROM [EdenSSO-TST].dbo.UserMembership			WHERE UserId = (@UserIdUPR) OR UserId = (@UserIdPASS)
SELECT * FROM [EdenSSO-TST].dbo.UserProviderMembership	WHERE UserId = (@UserIdUPR) OR UserId = (@UserIdPASS)
SELECT * FROM [EdenSSO-TST].dbo.OrganisationMembership	WHERE UserId = (@UserIdUPR) OR UserId = (@UserIdPASS)
SELECT * FROM [EdenSSO-TST].dbo.Notification			WHERE AddresseeUserId	= (@UserIdUPR) OR AddresseeUserId		= (@UserIdPASS)
SELECT * FROM [EdenSSO-TST].dbo.Event					WHERE GeneratedByUserId	= (@UserIdUPR) OR GeneratedByUserId	= (@UserIdPASS)
SELECT * FROM [EdenSSO-TST].dbo.OrganisationMembershipRequest	WHERE UserId	= (@UserIdUPR) OR UserId = (@UserIdPASS)
SELECT * FROM [EdenSSO-TST].dbo.ModuleAuthorisationRequest		WHERE UserId	= (@UserIdUPR) OR UserId = (@UserIdPASS)

-- *********************************************************
-- *** Create token for account activation / password reset
-- *********************************************************
--SELECT * FROM [EdenIdentity-TST].[dbo].[User]		WHERE Email = 'mark@kinsalebayfoodco.com' ORDER BY CreatedOn DESC
--SELECT * FROM [EdenIdentity-TST].[dbo].[Password]	WHERE Email = 'dokeeffe@wicklowcoco.ie' ORDER BY CreatedOn DESC

--Signup: https://account.edenireland.ie/signup/confirmemail?userId=[UniqueId]&token=[Token] ([EdenIdentity-TST].[dbo].[User])
--https://account.edenireland.ie/signup/confirmemail?userId=733E4E2E-C390-4BE0-BA82-F9D8E9C9EA03&token=1C2439A5-84B5-4A2E-AF35-BCC11405D000

SELECT * FROM [EdenIdentity-TST].[dbo].[Password]		WHERE Email = 'MMEPATest+20160624-1@gmail.com' 
SELECT TOP 1 Token FROM [EdenIdentity-TST].dbo.Password	WHERE Email = 'MMEPATest+20160624-1@gmail.com' ORDER BY CreatedOn DESC
--Reset:  https://account.edenireland.ie/passwordreset/resetpassword?userId=[EdenUserId]&token=[Token] ([EdenIdentity-TST].[dbo].[Password])
--https://account.edenireland.ie/passwordreset/resetpassword?userId=EF3C5E77-658E-48C7-A2AB-67AF147A6E49&token=9BA2A20B-2624-4FB0-9E79-A324DF2D39B9





-- *********************************************************

--SELECT * FROM [EdenSSO-TST].dbo.Notification	NOTF
--LEFT JOIN	dbo.NotificationDefinition			NTDF	ON  NTDF.NotificationDefinitionId	= NOTF.NotificationDefinition
--WHERE NOTF.Data LIKE '%Co.Waters@epa.ie%'
----WHERE NOTF.AddresseeUserId	= '604AF1E7-E894-491B-8122-F6455278FE3C'--@usrid

-- *********************************************************

--SELECT DISTINCT OTY.Name, ORG.Name AS [Organisation], MDL.Name AS [Module]

--FROM		dbo.UserProfile				UPR
--LEFT JOIN	dbo.UserMembership			UMB	 ON	UMB.UserId						= UPR.UserId
--LEFT JOIN	dbo.OrganisationMembership	OMB	 ON	OMB.UserId						= UPR.UserId
--LEFT JOIN	dbo.Organisation			ORG	 ON	ORG.OrganisationId				= OMB.OrganisationId
--LEFT JOIN	dbo.OrganisationType		OTY	 ON	OTY.OrganisationTypeId			= ORG.OrganisationTypeId
--LEFT JOIN	dbo.ModuleAuthorisation		MAU	 ON	MAU.UserId						= OMB.UserID
--LEFT JOIN	dbo.UserProfile				APRV ON APRV.UserId						= MAU.LastUpdatedBy
--LEFT JOIN	dbo.Module				  	MDL	 ON	MDL.ModuleId					= MAU.ModuleId

--WHERE		MDL.Name LIKE '%Frame%'

-- *********************************************************

--WHERE		DATEPART(YEAR,	UPR.LastUpdatedOn)	= '2015'
--AND		DATEPART(MONTH, UPR.LastUpdatedOn)	= '10'
--AND		DATEPART(DAY,	UPR.LastUpdatedOn)	= '22'



-- *********************************************************

--SELECT * FROM dbo.Organisation WHERE Name LIKE '%Owen%'

--SELECT DISTINCT 
--	UPR.Email
--	, ORG.Code
--	, ORG.Name
--	, OTY.Name	 AS	  [OrgType]
--	, ORG.Active
--	, OMB.MemberSince
--	, OMB.LastUpdatedOn
--	, UPR.FirstName + ' ' + UPR.LastName	AS [UpdatedBy]
--	, OMB.OrganisationMembershipId
--	, OMB.UserId
--	, OMB.DefaultOrganisation
--	, OMB.CurrentOrganisation
--	, OMB.Administrator
--	, OMB.Active
--FROM		dbo.OrganisationMembership		OMB
--INNER JOIN	dbo.Organisation				ORG	ON	ORG.OrganisationId		= OMB.OrganisationId
--INNER JOIN	dbo.UserProfile					UPR	ON	UPR.UserId				= OMB.LastUpdatedBy
--INNER JOIN	dbo.OrganisationType			OTY	ON	OTY.OrganisationTypeId	= ORG.OrganisationTypeId
--INNER JOIN	[EdenIdentity-TST].dbo.[User]	USR	ON	USR.UniqueId			= OMB.UserID
--WHERE		UPR.Email	=	'HUSKISSONSE@gmail.com'

-- *********************************************************

--SELECT TOP (2) * FROM dbo.Module
--SELECT TOP (2) * FROM dbo.Application
--SELECT TOP (2) * FROM dbo.ModuleAuthorisation

--SELECT * FROM dbo.UserProfile	WHERE	Email	  =		 'liam.quinlan@kerrycoco.ie'
--SELECT * FROM dbo.UserProfile	WHERE	Email	  LIKE	 '%HYNES%'
--SELECT * FROM dbo.UserProfile	WHERE	Phone	  LIKE	 '%045%9%8'
--SELECT * FROM dbo.UserProfile	WHERE	UserId	  =		 '5869EE9C-D9C1-471B-8530-1427C1ECECC7'
--SELECT * FROM dbo.UserProfile	WHERE	Username  LIKE	 '%waterdown%'


--SELECT * FROM [EdenSSO-TST].[dbo].[Organisation]	WHERE	OrganisationId	= 'B13D07AE-458D-E111-AB87-0050568A69E2'


--SELECT * FROM [EdenSSO-TST].[dbo].[OrganisationMembership]	WHERE	UserId	= '891004F2-82C5-4F4C-AF4D-F12A95C2DD7D'
--SELECT * FROM [EdenSSO-TST].[dbo].[Organisation]			WHERE	Name LIKE '%lomb%'


-- ************************
-- *** Event notifications
-- ************************


--SELECT DISTINCT TOP (100) 
--	 USR.FirstName + ' ' + USR.LastName		  AS [GeneratedBy]
--	 , ORG.Name		  AS	[Organisation]
--	 , ETY.Name		  AS  [EventType]
--	 , EVT.EventId
--	 , EVT.GeneratedOn
--	 , EVT.Processed
--	 , EVT.Data
--	 , EVT.Subject
--FROM			[EdenSSO-TST].[dbo].[Event]			EVT
--INNER JOIN	[EdenSSO-TST].[dbo].[EventType]		ETY	  ON ETY.EventTypeId		  =	  EVT.EventTypeId
--INNER JOIN	[EdenSSO-TST].[dbo].[UserProfile]	USR	  ON USR.UserId			  =	  EVT.GeneratedByUserId
--INNER JOIN	[EdenSSO-TST].[dbo].[Organisation]	ORG	  ON ORG.OrganisationId	  =	  EVT.GeneratedByOrganisationId
--WHERE	  EVT.EventTypeId = 4
--AND	  EVT.Processed = 1
--ORDER BY EVT.GeneratedOn DESC



-- ****************************************
-- *** EDEN and CRM email address mismatch
-- ****************************************

--USE	[EdenSSO-TST]

--SELECT DISTINCT
--	UPR.Email2			AS	[CRMEmail]
--	, UPR.Email			AS	[EdenEmail]
--	, UPR.Username		AS	[EdenUsername]
--	, LTRIM(RTRIM(UPR.FirstName)) + ' ' + LTRIM(RTRIM(UPR.LastName)) AS	[EdenName]
--	, ORG.Name			AS	[Organisation]
--	, OTY.Name			AS	[OrganisationType]
--	, MDL.Name			AS	[Module]
	
--FROM		dbo.UserProfile				UPR
--INNER JOIN	dbo.UserMembership			UMB	ON	UMB.UserId				= UPR.UserId
--LEFT JOIN	dbo.OrganisationMembership	OMB	ON	OMB.UserId				= UPR.UserId
--LEFT JOIN	dbo.Organisation			ORG	ON	ORG.OrganisationId		= OMB.OrganisationId
--LEFT JOIN	dbo.OrganisationType		OTY	ON	OTY.OrganisationTypeId	= ORG.OrganisationTypeId
--LEFT JOIN	dbo.ModuleAuthorisation		MAU	ON	MAU.UserId				= OMB.UserID
--LEFT JOIN	dbo.Module					MDL	ON	MDL.ModuleId			= MAU.ModuleId

--WHERE	LTRIM(RTRIM(Email)) <> LTRIM(RTRIM(Email2))
--AND		UPR.Active	= '1'
--AND		MAU.Active	= '1'
--AND		MDL.Name	= 'Authorisation Module'

--ORDER BY	MDL.Name, OTY.Name, ORG.Name, UPR.Email


 --****************************************
 --*** Username and email address mismatch
 --****************************************

--SELECT	* 
--FROM	dbo.UserProfile		
--WHERE	Email <> Username
--AND		Username NOT LIKE 'EDENIRELAND\%'
--AND		Username NOT LIKE 'EPA\%'
--ORDER BY 2



--*/