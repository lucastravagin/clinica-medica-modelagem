call uspPersonPhysicalInsert ('LUCAS TRAVAGIN PEREIRA','c://caminho','46140346835','533899631','M','1998-01-28','BRASILEIRO');
call uspPersonPhysicalInsert ('PAULO BORTOLOTTI NUNES','c://caminho','42589635896','36896358X','M','1982-07-11','BRASILEIRO');
call uspPersonLegalInsert ('CLÍNICA FELICIDADE','CLÍNICA FELIZ LTDA','50632815000161','586239181818','1998-01-28');



-- Convênio médico e Planos
INSERT INTO MedicalAgreement (Description) values ('AMIL');
INSERT INTO HealthPlan (MedicalAgreementId, Name) values (1,'AMIL');

-- Paciente
call uspPatientInsert (1,1,'25487','22.89');

-- Especialidade
INSERT INTO Specialty (description, observation, CBO) VALUES ('Geneticista', 'Geneticista', '201115');

-- Profissional da Saúde
INSERT INTO HealthProfessional (HealthProfessionalId) VALUES (3);

-- Especialidades do Profissional
INSERT INTO Professional_has_Specialties (HealthProfessionalId,MedicalUnitId,rqe, _organization, register, uf) 
values (3,6, '123', 'CRM', '22312', 'SP');

 -- Unidades do Profissional
 INSERT INTO Unit_has_Professional (HealthProfessionalId, SpecialtyId) VALUES (3, 1);

-- Perfis de Acesso
INSERT INTO AccessProfiles (Description) VALUES ('ADMIN');

-- Usuários 
INSERT INTO User (UserId, Password) VALUES (1, '123456');

-- Usuários tem perfis
INSERT INTO UserProfiles (AccessProfilesId,UserId) VALUES (1,1);






