DELIMITER //

CREATE PROCEDURE uspMedicalUnitInsert (
    p_MedicalUnitId INT
)
BEGIN
	BEGIN 
		
            INSERT INTO MedicalUnit (MedicalUnitId)
            VALUES (p_MedicalUnitId);
            
            SELECT p_MedicalUnitId AS Retorno;
		COMMIT ;
    END; 
    BEGIN
		ROLLBACK;
    END;
END;
//

DELIMITER ;




