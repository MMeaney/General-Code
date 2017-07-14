USE [EPACentral_Aquarius]

-- ********************
-- *** Initiate Delete
-- ********************

DECLARE @samp_id INT
SET		@samp_id = 1421630

SELECT * FROM Sample		WHERE samp_id = @samp_id
SELECT * FROM Measurements	WHERE samp_id = @samp_id

--BEGIN TRANSACTION
--	DELETE FROM Measurements	WHERE samp_id = @samp_id
--	DELETE FROM Sample			WHERE samp_id = @samp_id

SELECT * FROM Sample		WHERE samp_id = @samp_id
SELECT * FROM Measurements	WHERE samp_id = @samp_id

--COMMIT TRANSACTION
----ROLLBACK TRANSACTION

--*/