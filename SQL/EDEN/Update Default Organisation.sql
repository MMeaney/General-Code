USE [EdenSSO-STG]

SELECT 
OMB.*
FROM		dbo.UserProfile						UPR
LEFT JOIN	dbo.UserMembership					UMB		ON	UMB.UserId						= UPR.UserId
LEFT JOIN	dbo.OrganisationMembership			OMB		ON	OMB.UserId						= UPR.UserId
LEFT JOIN	dbo.Organisation					ORG		ON	ORG.OrganisationId				= OMB.OrganisationId
WHERE UPR.Email = 'c.dowling@epa.ie'



--SELECT * FROM dbo.OrganisationMembership
--WHERE OrganisationMembershipId = '5D8BB475-2962-4A2D-8B60-4C8DB3D95FA6'

--SELECT * FROM dbo.OrganisationMembership
--WHERE OrganisationMembershipId = '1796E74D-5B76-46F0-A838-C566D9838F24'


--UPDATE dbo.OrganisationMembership
--SET DefaultOrganisation = 0
--WHERE OrganisationMembershipId = '5D8BB475-2962-4A2D-8B60-4C8DB3D95FA6'

--UPDATE dbo.OrganisationMembership
--SET DefaultOrganisation = 1
--WHERE OrganisationMembershipId = '1796E74D-5B76-46F0-A838-C566D9838F24'