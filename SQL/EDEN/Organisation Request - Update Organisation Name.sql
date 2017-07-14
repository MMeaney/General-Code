-- ******************************************************************************
-- *** Organisation request: Update the organisation name if different from CRM
-- *** To prevent problems with SSO/CRM sync
-- ******************************************************************************

USE [EdenSSO-PRD]

SELECT * FROM	dbo.OrganisationRequest 
WHERE	OrganisationRequestId	= '7972A58B-44C5-4034-AF86-E35B68973BF9'
OR		Name LIKE '%LYDENDENTAL%'

BEGIN TRANSACTION
	UPDATE	.[dbo].[OrganisationRequest]
	SET		[Name] = 'Dr Ronan & Fionnuala Lyden'
	WHERE	[OrganisationRequestId] = 'CE35F296-5CDE-4FDC-8BE1-823D8A45BBEE'
--COMMIT TRANSACTION
--ROLLBACK TRANSACTION