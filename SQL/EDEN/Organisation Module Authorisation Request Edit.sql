-- ******************************************
-- *** Adjust Module Authorisation Request

USE [EdenSSO-PRD]

--BEGIN TRANSACTION
--UPDATE dbo.OrganisationModuleAuthorisationRequest
--SET ModuleId = '58F711D9-26B1-E411-B3B4-0050568A69E2'
--WHERE OrganisationModuleAuthorisationRequestId = 'FCB22123-0350-4135-946C-9B6EC729A903'
----COMMIT TRANSACTION


-- *** Identify module authorisation request ***

SELECT DISTINCT
	OrganisationModuleAuthorisationRequestId
	, OrganisationRequestId
	, UserId
	, ModuleId
	, RequestDate
FROM  dbo.OrganisationModuleAuthorisationRequest
WHERE OrganisationModuleAuthorisationRequestId	= 'FCB22123-0350-4135-946C-9B6EC729A903'
ORDER BY RequestDate DESC

SELECT * FROM dbo.Module		
WHERE	Name		LIKE '%AUTHORIS%'
OR		Name		LIKE '%LICENS%'

SELECT * FROM dbo.UserProfile	WHERE UserId	= 'DC1C774A-08F3-4E70-8629-79C5C4101AC1'