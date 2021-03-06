-- **************************************************************
-- *** Member organisation details, including who granted access
-- **************************************************************

USE	[EdenSSO-PRD]

SELECT DISTINCT *
FROM	dbo.UserProfile
WHERE	Email	LIKE 'coll.buckley@gmail.com%'
OR		UserId	LIKE '2353B97A-9507-E611-99F8-0050568A69E2'

--www.emc-healthcare.ie	
--secretary@emc-healthcare.ie

----BEGIN TRANSACTION
--UPDATE	[EdenSSO-PRD].dbo.UserProfile	
--SET		
--Email			= 'mecrow@eircom.net'
--, Username		= 'mecrow@eircom.net'
--WHERE	UserId	= '2353B97A-9507-E611-99F8-0050568A69E2'
----COMMIT TRANSACTION
----ROLLBACK TRANSACTION

-- From rory.maguire@dental.tcd.ie To roryperio@gmail.com		--0958B97A-9507-E611-99F8-0050568A69E2
-- From oloughlindental@eircom.net To care@oloughlindental.ie	--3F57B97A-9507-E611-99F8-0050568A69E2


-- epa\murphyai

-- *****************************************************************************************
-- *** Change user email address
-- *** Request application owner (e.g. LMA) to change it in CRM first
-- *** (CRM address is UserProfile.email2 field - this should not be updated manually)
-- *****************************************************************************************

----BEGIN TRANSACTION
--UPDATE	[EdenSSO-PRD].dbo.UserProfile	
--SET		
--Email = 'h.walsh@epa.test.ie'
--, Username	= 'h.walsh@epa.ie'--'EPA\WALSHH'
--, Active	= 0
--WHERE	UserId	= '12F43867-C20F-DE11-B526-0022642A33B2'
----COMMIT TRANSACTION
----ROLLBACK TRANSACTION
----'12F43867-C20F-DE11-B526-0022642A33B2'


------BEGIN TRANSACTION
--UPDATE	[EdenSSO-PRD].dbo.UserProfile	
--SET		
--Email	= 'h.walsh@epa.ie'
--, Username	= 'EPA\WALSHH'
--, Active	= 1
--WHERE	UserId	= '67e1dec3-8127-4909-b313-2e675d282006'
------COMMIT TRANSACTION
------ROLLBACK TRANSACTION
--

-- *********************************************************
-- *** Update password expiry date

--BEGIN TRANSACTION
--UPDATE	[EdenSSO-PRD].dbo.UserMembership
--SET		
--		PasswordExpiration	= '2025-12-14 14:12:03.073'

--WHERE	UserId	 = '37448E84-B853-4AD5-B9EC-A057ECFAC1F1'
----COMMIT TRANSACTION
----ROLLBACK TRANSACTION



-- *********************************************************


--DECLARE @email_addr NVARCHAR(MAX)
--SET	  @email_addr = 'liam.farrell@xtratherm.com'

--SELECT * FROM [EdenSSO-PRD].[dbo].[UserProfile]				WHERE Email = @email_addr
--SELECT * FROM [EdenIdentity-PRD].[dbo].[User]				WHERE Email = @email_addr
--SELECT * FROM [EdenIdentity-PRD].[dbo].[Password]			WHERE Email = @email_addr	 ORDER BY CreatedOn	DESC
--SELECT * FROM [EdenIdentity-PRD].[dbo].[TempOrganisation]	WHERE Email = @email_addr
--SELECT * FROM [EdenIdentity-PRD].[dbo].[TempContactDetail]	WHERE Email = @email_addr

--DECLARE @usrid NVARCHAR(MAX)
--SET		@usrid = 'BD60B5E8-04AB-4A16-95C6-D99C66F6AB04'

--SELECT * FROM [EdenSSO-PRD].[dbo].[UserProfile]				WHERE UserId = @usrid
--SELECT * FROM [EdenSSO-PRD].[dbo].[UserMembership]			WHERE UserId = @usrid
--SELECT * FROM [EdenSSO-PRD].[dbo].[UserProviderMembership]	WHERE UserId = @usrid
--SELECT * FROM [EdenSSO-PRD].[dbo].[OrganisationMembership]	WHERE UserId = @usrid
--SELECT * FROM [EdenSSO-PRD].[dbo].[Notification]			WHERE AddresseeUserId	= @usrid
--SELECT * FROM [EdenSSO-PRD].[dbo].[Event]					WHERE GeneratedByUserId	= @usrid
--SELECT * FROM [EdenSSO-PRD].[dbo].[OrganisationMembershipRequest]	WHERE UserId	= @usrid
--SELECT * FROM [EdenSSO-PRD].[dbo].[ModuleAuthorisationRequest]		WHERE UserId	= @usrid


-- *****************************************************************************************
-- *** DELETE User - To allow re-registering of email address after incomplete registration
-- *****************************************************************************************

--BEGIN TRANSACTION
--DELETE FROM User	WHERE	Email	=	'brian.reihill@p66.com'
----COMMIT TRANSACTION


-- *****************************************************************************************
-- *** SET User to 'Active'

--BEGIN TRANSACTION
--UPDATE	UserProfile	
--SET		Active	= '1'
--WHERE	UserId	= '021D9FB1-1F51-4F13-930A-8E6EE4B46C1D'
----COMMIT TRANSACTION



