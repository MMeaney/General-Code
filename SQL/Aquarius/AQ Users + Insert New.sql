-- ***********************
-- *** Aquarius user list
-- ***********************

USE [EPACentral_Aquarius]

SELECT 
	 USR.User_ID
	 , USR.User_Code
	 , USR.User_Password
	 , USR.UserFirstName
	 , USR.UserSurname
	 , USR.Role_ID
	 , USR.DeletedStatus
	 , ROL.Role_Desc
FROM		dbo.Users	USR
INNER JOIN	dbo.Role	ROL	ON ROL.Role_ID	 =	  USR.Role_ID
ORDER BY	USR.UserFirstName

--SELECT * FROM Role


/*
-- *****************
-- *** Add new user
-- *****************
INSERT INTO	[EPACentral_Aquarius].[dbo].[Users]
(
	 User_Code
	 , User_Password
	 , UserFirstName
	 , UserSurname
	 , Role_ID
	 , DeletedStatus
)
 
VALUES (
	 'smithdi'
	 , 'smithdi'
	 , 'Diarmuid'
	 , 'Smith'
	 , '9'
	 , '0'
);

--*/