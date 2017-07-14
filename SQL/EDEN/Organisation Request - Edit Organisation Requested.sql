-- ******************************************************************************
-- *** Organisation request: Update the organisation requested
-- *** To change requests if incorrect organisation requested
-- ******************************************************************************

USE [EdenSSO-PRD]

SELECT ORMQ.*
FROM		dbo.OrganisationMembershipRequest	ORMQ
LEFT JOIN	dbo.UserProfile						UPR		ON	ORMQ.UserId						= UPR.UserId
WHERE		UPR.Email	LIKE	'%Fiona.ONeill1@hse.ie%'

SELECT * FROM dbo.Organisation
WHERE	Name LIKE '%Cork University Hospital%'

--BEGIN TRANSACTION
	--UPDATE	dbo.OrganisationMembershipRequest
	--SET		OrganisationId = 'EB84D5F3-A5B6-E411-B3B4-0050568A69E2'
	--WHERE	OrganisationMembershipRequestId = '02FD69BC-E23C-4C3A-9774-DC0FB1C1E6C9'
----COMMIT TRANSACTION
----ROLLBACK TRANSACTION