-- ***************************************************************************
-- *** Update validated measurements to invalidated
-- *** e.g. for year 2015 if all measurements validated through web interface
-- ***************************************************************************

USE [EPACentral_Aquarius]

BEGIN TRANSACTION
UPDATE	dbo.Measurements
SET		Hchk_ID = 1 -- 1-Invalidated / 2-Validated
WHERE	Meas_ID	IN
(

)
--COMMIT TRANSACTION
--ROLLBACK TRANSACTION
