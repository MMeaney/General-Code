-- *** Execute the following SQL statements if user has clicked link in confirmation email but membership has not been approved
-- *** REPLACE USERID AND USE WITH CARE

USE [EdenSSO-PRD]

DECLARE @email_addr NVARCHAR(MAX)
DECLARE @usrid		NVARCHAR(MAX)

SET		@email_addr = 'MMEPATest+20170224-1@gmail.com'
SET		@usrid		= (SELECT UserId FROM [EdenSSO-PRD].[dbo].[UserProfile] WHERE Email = @email_addr)

SELECT * FROM [EdenSSO-PRD].[dbo].[UserProfile]				WHERE Email = @email_addr
SELECT * FROM [EdenIdentity-PRD].[dbo].[User]				WHERE Email = @email_addr
SELECT * FROM [EdenIdentity-PRD].[dbo].[TempOrganisation]	WHERE Email = @email_addr
SELECT * FROM [EdenIdentity-PRD].[dbo].[TempContactDetail]	WHERE Email = @email_addr
SELECT * FROM [EdenIdentity-PRD].[dbo].[Password]			WHERE Email = @email_addr

/*
--BEGIN TRANSACTION

  DELETE FROM [EdenSSO-PRD].[dbo].[UserMembership]				WHERE UserId			= @usrid;
  DELETE FROM [EdenIdentity-PRD].[dbo].[User]					WHERE Email				= @email_addr;
  DELETE FROM [EdenIdentity-PRD].[dbo].[TempOrganisation]		WHERE Email				= @email_addr;
  DELETE FROM [EdenIdentity-PRD].[dbo].[TempContactDetail]		WHERE Email				= @email_addr;
  DELETE FROM [EdenIdentity-PRD].[dbo].[Password]				WHERE Email				= @email_addr;
  
  DELETE FROM [EdenSSO-PRD].dbo.Notification					WHERE AddresseeUserId	= @usrid;
  DELETE FROM [EdenSSO-PRD].dbo.Event							WHERE GeneratedByUserId	= @usrid;
  DELETE FROM [EdenSSO-PRD].dbo.UserMembership					WHERE UserId			= @usrid;
  DELETE FROM [EdenSSO-PRD].dbo.UserProviderMembership			WHERE UserId			= @usrid;
  DELETE FROM [EdenSSO-PRD].dbo.OrganisationMembershipRequest	WHERE UserId			= @usrid;
  DELETE FROM [EdenSSO-PRD].dbo.ModuleAuthorisationRequest		WHERE UserId			= @usrid;
  DELETE FROM [EdenSSO-PRD].dbo.OrganisationRequest				WHERE RequestedBy		= @usrid;
  DELETE FROM [EdenSSO-PRD].dbo.UserProfile						WHERE UserId			= @usrid;
  DELETE FROM [EdenIdentity-PRD].[dbo].[User]					WHERE Email				= @email_addr;
  DELETE FROM [EdenSSO-PRD].dbo.UserProfile						WHERE UserId			= @usrid;

--COMMIT TRANSACTION
----ROLLBACK TRANSACTION
--*/


SELECT * FROM [EdenSSO-PRD].dbo.Notification					WHERE AddresseeUserId	= @usrid
SELECT * FROM [EdenSSO-PRD].dbo.Event							WHERE GeneratedByUserId	= @usrid
SELECT * FROM [EdenSSO-PRD].dbo.UserMembership					WHERE UserId			= @usrid
SELECT * FROM [EdenSSO-PRD].dbo.UserProviderMembership			WHERE UserId			= @usrid
SELECT * FROM [EdenSSO-PRD].dbo.UserProfile						WHERE UserId			= @usrid
SELECT * FROM [EdenSSO-PRD].dbo.OrganisationMembershipRequest	WHERE UserId			= @usrid
SELECT * FROM [EdenSSO-PRD].dbo.ModuleAuthorisationRequest		WHERE UserId			= @usrid
SELECT * FROM [EdenSSO-PRD].dbo.OrganisationRequest				WHERE RequestedBy		= @usrid
SELECT * FROM [EdenSSO-PRD].[dbo].[UserMembership]				WHERE UserId			= @usrid

-- *********

SELECT * FROM [EdenSSO-PRD].dbo.OrganisationMembership			WHERE UserId			= @usrid -- CRM User
SELECT * FROM [EdenSSO-PRD].dbo.ModuleAuthorisation				WHERE UserId			= @usrid -- CRM User
SELECT * FROM [EdenSSO-PRD].dbo.AuditOrganisationMembership		WHERE UserId			= @usrid -- CRM User
SELECT * FROM [EdenSSO-PRD].dbo.AuditModuleAuthorisation		WHERE UserId			= @usrid -- CRM User
SELECT * FROM [EdenSSO-PRD].dbo.AuditModuleAuthorisationRole	WHERE AuditModuleAuthorisationId 	IN
	(SELECT AuditModuleAuthorisationId FROM [EdenSSO-PRD].dbo.AuditModuleAuthorisation		WHERE UserId = @usrid) -- CRM User
SELECT * FROM [EdenSSO-PRD].dbo.ModuleAuthorisationRole			WHERE ModuleAuthorisationId	IN
	(SELECT ModuleAuthorisationId FROM [EdenSSO-PRD].dbo.AuditModuleAuthorisation			WHERE UserId = @usrid)  -- CRM User

-- *********

 -- DELETE FROM [EdenSSO-PRD].dbo.OrganisationMembership			WHERE UserId				= @usrid; -- CRM User
 -- DELETE FROM [EdenSSO-PRD].dbo.ModuleAuthorisation				WHERE UserId				= @usrid; -- CRM User
 -- DELETE FROM [EdenSSO-PRD].dbo.AuditOrganisationMembership		WHERE UserId				= @usrid; -- CRM User
 -- DELETE FROM [EdenSSO-PRD].dbo.AuditModuleAuthorisationRole	WHERE AuditModuleAuthorisationId 	IN
	--(SELECT AuditModuleAuthorisationId FROM [EdenSSO-PRD].dbo.AuditModuleAuthorisation		WHERE UserId = @usrid) -- CRM User
 -- DELETE FROM [EdenSSO-PRD].dbo.AuditModuleAuthorisation		WHERE UserId = @usrid; -- CRM User
 -- DELETE FROM [EdenSSO-PRD].dbo.ModuleAuthorisationRole			WHERE ModuleAuthorisationId	IN
	--(SELECT ModuleAuthorisationId FROM [EdenSSO-PRD].dbo.AuditModuleAuthorisation			WHERE UserId = @usrid) ; -- CRM User
----COMMIT TRANSACTION
----ROLLBACK TRANSACTION