-- **************************************************************
-- *** Member organisation details, including who granted access
-- **************************************************************

USE	[EdenSSO-PRD]

DECLARE @EdenEmail			VARCHAR(100) = NULL
DECLARE	@Username			VARCHAR(100) = NULL
DECLARE	@FirstName			VARCHAR(100) = NULL
DECLARE	@LastName			VARCHAR(100) = NULL
DECLARE	@OrgName			VARCHAR(100) = NULL
DECLARE	@Module				VARCHAR(100) = NULL
DECLARE	@UserID				VARCHAR(50)	 = NULL
DECLARE	@UserIDUPR			VARCHAR(50)  = NULL
DECLARE	@UserIdUSR			VARCHAR(50)  = NULL
DECLARE	@UserIdPASS			VARCHAR(50)  = NULL
DECLARE	@UserToken			VARCHAR(50)  = NULL
DECLARE	@UserTokenPwd		VARCHAR(50)  = NULL
DECLARE	@sqlmain			VARCHAR(MAX) = NULL
DECLARE	@sqlwhere			VARCHAR(MAX) = NULL
DECLARE @AccVerification	VARCHAR(MAX) = NULL
DECLARE	@AccVerificationID	VARCHAR(MAX) = NULL
DECLARE	@PasswordReset		VARCHAR(MAX) = NULL
DECLARE	@PasswordResetPwd	VARCHAR(MAX) = NULL
DECLARE	@Phone				VARCHAR(50)	 = NULL

SET	@EdenEmail		= 'info@xspect.ie'
--SET	@UserID		= '40614ae5-3471-4223-924e-6153dd4af8ff'
--SET	@Username	= 'edenepatest'
--SET	@EdenEmail	= NULL
--SET	@FirstName	= 'breeda'
--SET	@LastName	= 'whelan'
--SET	@Phone		= '021'
--021 4343911
--SET	@OrgName	= 'limerick'
--SET	@Module		= 'WFD'
--SET	@UserIDUPR	= NULL
--SET	@UserIdPASS	= NULL
--SET	@UserToken	= NULL

IF OBJECT_ID('Tempdb..#tmpUserToken')	IS NOT NULL
	BEGIN	DROP TABLE #tmpUserToken	END
SELECT	Token		
INTO	#tmpUserToken
FROM	[EdenIdentity-PRD].dbo.[User]	--[EdenIdentity-PRD].dbo.Password	
WHERE	Email LIKE @EdenEmail
ORDER BY CreatedOn	DESC

IF OBJECT_ID('Tempdb..#tmpUserTokenPwd')	IS NOT NULL
	BEGIN	DROP TABLE #tmpUserTokenPwd	END
SELECT	Token		
INTO	#tmpUserTokenPwd
FROM	[EdenIdentity-PRD].dbo.[Password]	--[EdenIdentity-PRD].dbo.Password	
WHERE	Email LIKE @EdenEmail
ORDER BY CreatedOn	DESC

SET		@UserIDUPR		= (SELECT DISTINCT UserId		FROM [EdenSSO-PRD].dbo.UserProfile		WHERE Email LIKE @EdenEmail);
SET		@UserIdUSR		= (SELECT DISTINCT UniqueId		FROM [EdenIdentity-PRD].dbo.[User]		WHERE Email LIKE @EdenEmail);
SET		@UserIdPASS		= (SELECT DISTINCT EdenUserId	FROM [EdenIdentity-PRD].dbo.Password	WHERE Email LIKE @EdenEmail);
SET		@UserToken		= (SELECT TOP (1)  Token		FROM #tmpUserToken);
SET		@UserTokenPwd	= (SELECT TOP (1)  Token		FROM #tmpUserTokenPwd);


PRINT	'User ID (EDEN SSO User Table): ' + @UserIDUPR;
PRINT	'User ID (EDEN Identity User Table): ' + @UserIdUSR;
PRINT	'User ID (EDEN Identity Password Table): ' + @UserIdPASS;
PRINT	'User Password Token: ' + @UserToken;
PRINT	'User Password Token: ' + @UserTokenPwd;
		
SELECT	@AccVerification	= 'Account verification link: https://account.edenireland.ie/signup/confirmemail?userId=' + @UserIDUPR + '&token=' + @UserToken
SELECT	@AccVerificationID	= 'Account verification link: https://account.edenireland.ie/signup/confirmemail?userId=' + @UserIdUSR + '&token=' + @UserToken
SELECT	@PasswordReset		= 'Password reset link: https://account.edenireland.ie/passwordreset/resetpassword?userId=' + @UserIdPASS + '&token=' + @UserToken
SELECT	@PasswordResetPwd	= 'Password reset link: https://account.edenireland.ie/passwordreset/resetpassword?userId=' + @UserIdPASS + '&token=' + @UserTokenPwd

PRINT	@AccVerification;
PRINT	@AccVerificationID;
PRINT	@PasswordReset;
PRINT	@PasswordResetPwd;

SELECT DISTINCT
	UPR.Email					AS	[EdenEmail]
	, UPR.Username				AS	[EdenUsername]
	, UPR.Email2				AS	[CRMEmail]
	, LTRIM(RTRIM(UPR.FirstName))  + ' ' + LTRIM(RTRIM(UPR.LastName))	AS	[UserName]
	, ORG.Name					AS	[Organisation]
	, OMB.DefaultOrganisation	AS	[Default]
	, UMB.PasswordExpiration
	, UPR.UserId
	, MDL.StaticName			AS	[Module]
	, MDROL.Name				AS	[ModuleRole]
	, GLBROL.Name				AS	[GlobalRole]
	, MAU.Active				AS	[ModActive]
	, ORQN.Name					AS	[OrgReq]
	, ORMQ.RequestDate
	, MDRQ.StaticName			AS	[ModReq]
	, ORQ.Name					AS	[OrgCreReq]
	, MDLRQ.StaticName			AS	[ModCreReq]
	, LPRNM.LicenceCode			AS	[LicCode]
	, LPRNM.LicenceProfileName	AS	[LicName]
	, LPA.Active				AS	[LicAct]
	, LPRQNM.LicenceProfileName	AS	[LicReqName]
	, LPREQ.Active				AS	[LicReqAct]
	, BTY.Name					AS	[BusinessType]
	, OTY.Name					AS	[OrganisationType]
	, USRID.Token
	, UPR.Active
	, LTRIM(RTRIM(APRV.FirstName)) + ' ' + LTRIM(RTRIM(APRV.LastName))	AS	[ApprovedBy]
	, APRV.Email
	, UPR.Phone
	, UPR.Mobile
	, MAU.LastUpdatedOn			AS	[UserAppDate]
	, UPR.LastUpdatedOn			AS	[UserUpdated]
	, ORQ.RequestDate			AS	[OrgReqDate]
	, MAURQ.LastUpdatedOn		AS	[ModAuthReqDate]
	, OMAR.RequestDate			AS	[OrgModAuthDate]
	, ADDR.AddressLine1
	, ADDR.AddressLine2
	, ADDR.AddressLine3
	, ADDR.Phone
	, ADDR.Fax
	, ADDR.PostCode
	, CNT.Name					AS	[OrgCounty]
	, CTRY.CountryName			AS	[OrgCountry]
	, ORQ.OrganisationRequestId
	--, NOTF.Data		  AS	[Notification]
	--, NOTF.EmailSentOn
	--, NTDF.Name		  AS	[NotificationDefinition]
	--, EVT.Name		  AS	[EventType]

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
LEFT JOIN	dbo.GlobalModuleAuthorisation		GMA		ON 
													(
														GMA.ModuleId	= MDL.ModuleId
														AND
														GMA.UserId		= UPR.UserId
													)
LEFT JOIN	dbo.Role							GLBROL	ON	GLBROL.RoleId					= GMA.RoleId
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
LEFT JOIN	[EdenIdentity-PRD].dbo.[User]		USRID	ON	USRID.UniqueId					= UPR.UserId
LEFT JOIN	dbo.LicenceProfileAccess			LPA		ON	LPA.UserId						= UPR.UserId
LEFT JOIN	dbo.LicenceProfile					LPRNM	ON	LPRNM.LicenceProfileId			= LPA.LicenceProfileId
LEFT JOIN	dbo.LicenceProfileAccessRequest		LPREQ	ON	LPREQ.UserId					= UPR.UserId
LEFT JOIN	dbo.LicenceProfile					LPRQNM	ON	LPRQNM.LicenceProfileId			= LPA.LicenceProfileId

WHERE	OMB.Active = 1
AND		MDL.Active = 1
AND		(UPR.Email		LIKE '%' + (@EdenEmail)	+ '%' OR (@EdenEmail)	IS NULL)
AND		(UPR.Username	LIKE '%' + (@Username)	+ '%' OR (@Username)	IS NULL)
AND		(ORG.Name		LIKE '%' + (@OrgName)	+ '%' OR (@OrgName)		IS NULL)
AND		(UPR.FirstName	LIKE '%' + (@FirstName)	+ '%' OR (@FirstName)	IS NULL)
AND		(UPR.LastName	LIKE '%' + (@LastName)	+ '%' OR (@LastName)	IS NULL)
AND		(MDL.StaticName	LIKE '%' + (@Module)	+ '%' OR (@Module)		IS NULL)
AND		(UPR.Phone		LIKE '%' + (@Phone)		+ '%' OR (@Phone)		IS NULL)
AND		(UPR.Mobile		LIKE '%' + (@Phone)		+ '%' OR (@Phone)		IS NULL)
AND		(UPR.UserId		LIKE '%' + (@UserID)	+ '%' OR (@UserID)		IS NULL)

--WHERE		ORQN.Name	IS NOT NULL

ORDER BY	ORG.Name, [UserName], UMB.PasswordExpiration, UPR.Email, MDL.StaticName, OTY.Name--, NOTF.EmailSentOn DESC


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

SELECT * FROM [EdenSSO-PRD].dbo.UserProfile				WHERE Email LIKE '%' + (@EdenEmail)	+ '%'	ORDER BY LastUpdatedOn	DESC
SELECT * FROM [EdenIdentity-PRD].dbo.[User]				WHERE Email LIKE '%' + (@EdenEmail)	+ '%'
SELECT * FROM [EdenIdentity-PRD].dbo.Password			WHERE Email LIKE '%' + (@EdenEmail)	+ '%'	ORDER BY CreatedOn	DESC
SELECT * FROM [EdenIdentity-PRD].dbo.TempOrganisation	WHERE Email LIKE '%' + (@EdenEmail)	+ '%'
SELECT * FROM [EdenIdentity-PRD].dbo.TempContactDetail	WHERE Email LIKE '%' + (@EdenEmail)	+ '%'


--DECLARE @usrid NVARCHAR(MAX)
--SET		@usrid = 'BC66771F-41BD-4DAF-A789-E01B81390672'

SELECT * FROM [EdenSSO-PRD].dbo.UserProfile				WHERE UserId = (@UserIDUPR) OR UserId = (@UserIdPASS)
SELECT * FROM [EdenSSO-PRD].dbo.UserMembership			WHERE UserId = (@UserIDUPR) OR UserId = (@UserIdPASS)
SELECT * FROM [EdenSSO-PRD].dbo.UserProviderMembership	WHERE UserId = (@UserIDUPR) OR UserId = (@UserIdPASS)
SELECT * FROM [EdenSSO-PRD].dbo.OrganisationMembership	WHERE UserId = (@UserIDUPR) OR UserId = (@UserIdPASS)
SELECT * FROM [EdenSSO-PRD].dbo.Notification			WHERE AddresseeUserId	= (@UserIDUPR) OR AddresseeUserId		= (@UserIdPASS)
SELECT * FROM [EdenSSO-PRD].dbo.Event					WHERE GeneratedByUserId	= (@UserIDUPR) OR GeneratedByUserId	= (@UserIdPASS)
SELECT * FROM [EdenSSO-PRD].dbo.OrganisationMembershipRequest	WHERE UserId	= (@UserIDUPR) OR UserId = (@UserIdPASS)
SELECT * FROM [EdenSSO-PRD].dbo.ModuleAuthorisationRequest		WHERE UserId	= (@UserIDUPR) OR UserId = (@UserIdPASS)

-- *********************************************************
-- *** Create token for account activation / password reset
-- *********************************************************
--SELECT * FROM [EdenIdentity-PRD].[dbo].[User]		WHERE Email = 'mark@kinsalebayfoodco.com' ORDER BY CreatedOn DESC
--SELECT * FROM [EdenIdentity-PRD].[dbo].[Password]	WHERE Email = 'dokeeffe@wicklowcoco.ie' ORDER BY CreatedOn DESC

--Signup: https://account.edenireland.ie/signup/confirmemail?userId=[UniqueId]&token=[Token] ([EdenIdentity-PRD].[dbo].[User])
--https://account.edenireland.ie/signup/confirmemail?userId=733E4E2E-C390-4BE0-BA82-F9D8E9C9EA03&token=1C2439A5-84B5-4A2E-AF35-BCC11405D000



--SELECT DISTINCT Token FROM [EdenIdentity-PRD].dbo.Password	WHERE Email LIKE @EdenEmail
--Reset:  https://account.edenireland.ie/passwordreset/resetpassword?userId=[EdenUserId]&token=[Token] ([EdenIdentity-PRD].[dbo].[Password])
--https://account.edenireland.ie/passwordreset/resetpassword?userId=EF3C5E77-658E-48C7-A2AB-67AF147A6E49&token=9BA2A20B-2624-4FB0-9E79-A324DF2D39B9





-- *********************************************************

--SELECT * FROM [EdenSSO-PRD].dbo.Notification	NOTF
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
--INNER JOIN	[EdenIdentity-PRD].dbo.[User]	USR	ON	USR.UniqueId			= OMB.UserID
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


--SELECT * FROM [EdenSSO-PRD].[dbo].[Organisation]	WHERE	OrganisationId	= 'B13D07AE-458D-E111-AB87-0050568A69E2'


--SELECT * FROM [EdenSSO-PRD].[dbo].[OrganisationMembership]	WHERE	UserId	= '891004F2-82C5-4F4C-AF4D-F12A95C2DD7D'
--SELECT * FROM [EdenSSO-PRD].[dbo].[Organisation]			WHERE	Name LIKE '%lomb%'


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
--FROM			[EdenSSO-PRD].[dbo].[Event]			EVT
--INNER JOIN	[EdenSSO-PRD].[dbo].[EventType]		ETY	  ON ETY.EventTypeId		  =	  EVT.EventTypeId
--INNER JOIN	[EdenSSO-PRD].[dbo].[UserProfile]	USR	  ON USR.UserId			  =	  EVT.GeneratedByUserId
--INNER JOIN	[EdenSSO-PRD].[dbo].[Organisation]	ORG	  ON ORG.OrganisationId	  =	  EVT.GeneratedByOrganisationId
--WHERE	  EVT.EventTypeId = 4
--AND	  EVT.Processed = 1
--ORDER BY EVT.GeneratedOn DESC



-- ****************************************
-- *** EDEN and CRM email address mismatch
-- ****************************************

--USE	[EdenSSO-PRD]

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