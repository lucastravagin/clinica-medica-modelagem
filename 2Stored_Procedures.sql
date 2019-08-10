DELIMITER //

CREATE PROCEDURE uspPersonPhysicalInsert (
    p_Name VARCHAR(50),
    p_Avatar VARCHAR(256),
    p_CPF VARCHAR(11),
    p_RG VARCHAR(20),
    p_Gender CHAR(1),
    p_DateOfBirth date,
    p_Nacionality VARCHAR(20))
BEGIN
	BEGIN 
			DECLARE v_PersonId INT;
			/*Inserir na tabela de Pessoa*/
            INSERT INTO Person (PersonTypeId)
            VALUES (1);
            
            SET v_PersonId = @@IDENTITY;
            
            /*Inserir na tabela de Pessoa Física*/
            INSERT INTO PhysicalPerson (PhysicalPersonId, Name, Avatar, CPF, RG, Gender, DateOfBirth, Nacionality)
            VALUES (v_PersonId, p_Name, p_Avatar, p_CPF, p_RG, p_Gender, p_DateOfBirth, p_Nacionality);
            
            SELECT v_PersonId AS Retorno;
		COMMIT ;
    END; 
    BEGIN
		ROLLBACK;
    END;
END;
//

DELIMITER ;




