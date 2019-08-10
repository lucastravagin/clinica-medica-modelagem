DELIMITER //
CREATE PROCEDURE uspPatientInsert (
    p_PatientId INT,
    p_HealthPlanId INT,
    p_CNS VARCHAR(20),
    p_IMC CHAR(5)
)
BEGIN
	BEGIN 
		
            INSERT INTO Patient (PatientId, HealthPlanId,CNS, IMC)
            VALUES (p_PatientId, p_HealthPlanId, p_CNS, p_IMC);
            
            SELECT p_PatientId AS Retorno;
		COMMIT ;
    END; 
    BEGIN
		ROLLBACK;
    END;
END;
//

DELIMITER ;




