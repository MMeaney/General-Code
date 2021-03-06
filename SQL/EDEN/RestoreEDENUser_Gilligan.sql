select * from userprofile where userid = 'A0D65E60-53BB-E411-B3B4-0050568A69E2'
select * from UserMembership where userid = 'A0D65E60-53BB-E411-B3B4-0050568A69E2'
select * from OrganisationMembership where UserId = 'A0D65E60-53BB-E411-B3B4-0050568A69E2'
select * from ModuleAuthorisation where userid = 'A0D65E60-53BB-E411-B3B4-0050568A69E2'
select * from ModuleAuthorisationRole where  moduleauthorisationid in('6112111A-E7FF-47FC-9642-0E67D6FC0DDB'
,'41EEF96F-D0DF-4BE0-A082-B85FAC2CB901')


insert into userprofile (userid, username, email, active, FirstName, LastName, Phone, SectionId, TitleId, AddressLine1, AddressLine2, AddressLine3,
CountyId, PositionId, LastUpdatedOn, email2, registered, CurrentOrganisationId, CountryId)
values('A0D65E60-53BB-E411-B3B4-0050568A69E2', 'chris@gilligan-engineering.co.uk','chris@gilligan-engineering.co.uk', 1,'Julie', 'Gilligan',
 '00447879626719', '62', '6', 'C/O Eversheds O''Donnell Sweeney',
 '1 Earlsfort Centre','Earlsfort Terrace, Dublin 2','458', '30','2015-06-08 13:52:06.003','chris@gilligan-engineering.co.uk', '1', '6F84D5F3-A5B6-E411-B3B4-0050568A69E2', '107')


 insert into UserMembership (UserId, Password, PasswordSalt, PasswordExpiration, PasswordChangedDate, PasswordFailureCountSinceLastSuccess)
 values('A0D65E60-53BB-E411-B3B4-0050568A69E2', 'SXIhZCF1bTE5Mrxj86fqPuK1X3vLoUIiDE1dkA+WdJODN2SoZPtTn59EvGPzp+o+4rVfe8uhQiIMTV2QD5Z0k4M3ZKhk+1Ofn0S8Y/On6j7itV97y6FCIgxNXZAPlnSTgzdkqGT7U5+fRLxj86fqPuK1X3vLoUIiDE1dkA+WdJODN2SoZPtTn59EvGPzp+o+4rVfe8uhQiIMTV2QD5Z0k4M3ZKhk+1Ofn0S8Y/On6j7itV97y6FCIgxNXZAPlnSTgzdkqGT7U5+fRLxj86fqPuK1X3vLoUIiDE1dkA+WdJODN2SoZPtTn59EvGPzp+o+4rVfe8uhQiIMTV2QD5Z0k4M3ZKhk+1Ofn0S8Y/On6j7itV97y6FCIgxNXZAPlnSTgzdkqGT7U5+fRLxj86fqPuK1X3vLoUIiDE1dkA+WdJODN2SoZPtTn59E',
 'vGPzp+o+4rVfe8uhQiIMTV2QD5Z0k4M3ZKhk+1Ofn0Q=', '2015-09-02 07:51:06.673', '2015-06-04 07:51:06.673', '0')

 insert into OrganisationMembership (OrganisationMembershipId, OrganisationId, UserId, MemberSince, LastUpdatedOn, LastUpdatedBy, DefaultOrganisation,
 CurrentOrganisation, Administrator, Active)
 values('C13CB991-DA19-4E2B-BDF5-1ACB741CB19E', '6F84D5F3-A5B6-E411-B3B4-0050568A69E2', 'A0D65E60-53BB-E411-B3B4-0050568A69E2','2015-02-24 15:05:07.007',
 '2015-02-24 15:05:07.007', 'DA428D05-75E6-410D-AC6C-7E6995FC2FAF', '1', '0', '1','1')

 insert into ModuleAuthorisation(ModuleAuthorisationId, OrganisationId, UserId, ModuleId, Active, LastUpdatedOn, LastUpdatedBy)
 values('6112111A-E7FF-47FC-9642-0E67D6FC0DDB', '6F84D5F3-A5B6-E411-B3B4-0050568A69E2', 'A0D65E60-53BB-E411-B3B4-0050568A69E2', '58F711D9-26B1-E411-B3B4-0050568A69E2',
 '1','2015-02-24 15:05:08.870', 'DA428D05-75E6-410D-AC6C-7E6995FC2FAF')

  insert into ModuleAuthorisation(ModuleAuthorisationId, OrganisationId, UserId, ModuleId, Active, LastUpdatedOn, LastUpdatedBy)
 values('41EEF96F-D0DF-4BE0-A082-B85FAC2CB901', '6F84D5F3-A5B6-E411-B3B4-0050568A69E2', 'A0D65E60-53BB-E411-B3B4-0050568A69E2', '5AD0A62E-EC8F-40A5-B39B-207DCC1FCB56',
 '1','2015-02-24 15:05:08.870', 'DA428D05-75E6-410D-AC6C-7E6995FC2FAF')

 insert into ModuleAuthorisationRole(ModuleAuthorisationId, RoleId)
 values('6112111A-E7FF-47FC-9642-0E67D6FC0DDB','3E5B7641-DA21-E311-B036-005056AE0006')
  insert into ModuleAuthorisationRole(ModuleAuthorisationId, RoleId)
 values('6112111A-E7FF-47FC-9642-0E67D6FC0DDB','B0331CA2-DA21-E311-B036-005056AE0006')

  insert into ModuleAuthorisationRole(ModuleAuthorisationId, RoleId)
 values('41EEF96F-D0DF-4BE0-A082-B85FAC2CB901','3E5B7641-DA21-E311-B036-005056AE0006')
  insert into ModuleAuthorisationRole(ModuleAuthorisationId, RoleId)
 values('41EEF96F-D0DF-4BE0-A082-B85FAC2CB901','B0331CA2-DA21-E311-B036-005056AE0006')