
DELIMITER //

CREATE PROCEDURE uspPersonLegalInsert (
    p_FantasyName VARCHAR(50),
    p_SocialReason VARCHAR(50),
    p_CNPJ VARCHAR(14),
    p_StateRegistration VARCHAR(20),
    p_DateFoundation date
)
BEGIN
	BEGIN 
			DECLARE v_PersonId INT;
			/*Inserir na tabela de Pessoa*/
            INSERT INTO Person (PersonTypeId)
            VALUES (1);
            
            SET v_PersonId = @@IDENTITY;
            
            /*Inserir na tabela de Pessoa Física*/
            INSERT INTO LegalPerson (LegalPersonId, FantasyName, SocialReason, CNPJ, StateRegistration, DateFoundation)
            VALUES (v_PersonId, p_FantasyName, p_SocialReason, p_CNPJ, p_StateRegistration, p_DateFoundation);
            
            SELECT v_PersonId AS Retorno;
		COMMIT ;
    END; 
    BEGIN
		ROLLBACK;
    END;
END;
//

DELIMITER ;






