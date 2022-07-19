CREATE DATABASE laboratorio;
USE laboratorio;

#DDL
# TABELAS INDEPENDENTES

CREATE TABLE Paciente(
	nProtocolo INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(20) NULL,
    nascimento DATE NULL,
    pais VARCHAR(20) NULL,
    estado VARCHAR(20) NULL,
    cidade VARCHAR(20) NULL,
    rua VARCHAR(30) NULL,
    numero DECIMAL(10) NULL,
    complemento VARCHAR(30) NULL,
    RG DECIMAL(11) NULL,
    nomeDaMae VARCHAR(20) NULL,
    PRIMARY KEY(nProtocolo)
);

CREATE TABLE Medico(
	CRM DECIMAL(6) NOT NULL,
    nome VARCHAR(20) NOT NULL,
    PRIMARY KEY(CRM)
);

CREATE TABLE Farmaceutico(
	CRF DECIMAL(5) NOT NULL,
    nome VARCHAR(20) NOT NULL,
    setor VARCHAR(30) NOT NULL,
    PRIMARY KEY (CRF)
);

# TABELAS RELACIONAIS

CREATE TABLE Telefone_Paciente(
	idPaciente INT NOT NULL,
    telefone VARCHAR(20) NULL,
    FOREIGN KEY (idPaciente) REFERENCES Paciente(nProtocolo)
);

CREATE TABLE Solicitacao(
    dataDeAceitacao DATE NOT NULL,
    justificativaClinica VARCHAR(50) NOT NULL,
    numeroSolicitacao DECIMAL(5) NOT NULL,
    idPaciente INT NOT NULL,
    idMedico DECIMAL(6) NOT NULL,
    PRIMARY KEY(numeroSolicitacao),
    FOREIGN KEY(idPaciente) REFERENCES Paciente(nProtocolo),
    FOREIGN KEY(idMedico) REFERENCES Medico(CRM)
);

CREATE TABLE Exame(
	tipo VARCHAR(20) NOT NULL,
    cor VARCHAR(10) NOT NULL,
    codDeBarras VARCHAR(13) NOT NULL,
    idSolicitacao DECIMAL(5) NOT NULL,
    idFarmaceutico DECIMAL(5) NOT NULL,
    PRIMARY KEY(codDeBarras),
    FOREIGN KEY(idSolicitacao) REFERENCES Solicitacao(numeroSolicitacao),
    FOREIGN KEY(idFarmaceutico) REFERENCES Farmaceutico(CRF)
);

CREATE TABLE Resultado(
	numeroResultado DECIMAL(8) NOT NULL,
    numeroLaboratorio DECIMAL(8) NOT NULL,
    valorMedido FLOAT NOT NULL,
    valorReferencia TINYTEXT NOT NULL,
    idPaciente INT NOT NULL,
    idMedico DECIMAL(6) NOT NULL,
    idExame VARCHAR(13) NOT NULL,
    PRIMARY KEY(numeroResultado), 
    FOREIGN KEY(idPaciente) REFERENCES Paciente(nProtocolo),
    FOREIGN KEY(idMedico) REFERENCES Medico(CRM),
    FOREIGN KEY(idExame) REFERENCES Exame(codDeBarras)
);

#DML

# INSERT Pacientes

INSERT INTO Paciente(nome, nascimento, pais, estado, cidade, rua, numero, complemento, RG, nomeDaMae) 
VALUES ("Giorgi Fidalgo", "2000-04-11", "Brasil", "Ceará", "Fortaleza", "Rua Bento Albuquerque", "889", "apto 120", 319861995,  "Alícia Caeira");

INSERT INTO Paciente(nome, nascimento, pais, estado, cidade, rua, numero, complemento, RG, nomeDaMae) 
VALUES ("Júlia Farias", "2021-06-15", "Brasil", "Ceará", "Fortaleza", "Av. Washington Soares", 1321, "apto 203", 164679564,  "Dalila Canhão");

INSERT INTO Paciente(nome, nascimento, pais, estado, cidade, rua, numero, complemento, RG, nomeDaMae)
VALUES ("Nélio Brites", "1980-01-30", "Brasil", "São Paulo", "Osasco", "Avenida dos Autonomistas", 2392, "apto 222", 567458903,  "Gabrielly Cerqueira");

INSERT INTO Paciente(nome, nascimento, pais, estado, cidade, rua, numero, complemento, RG, nomeDaMae) 
VALUES ("Amélia Serpa", "1999-03-18", "Canadá", "Alberta", "Calgary", "11 Ave SW", 1127, "apto 21", 979698446,  "Daiana Barbalho");

INSERT INTO Paciente(nome, nascimento, pais, estado, cidade, rua, numero, complemento, RG, nomeDaMae) 
VALUES ("Deise Oliveira", "2015-09-9", "Canadá", "Ontário", "Toronto", "Old Orchard Grove", "522", "apto 12", 298473957,  "Natacha Foquiço");

INSERT INTO Paciente(nome, nascimento, pais, estado, cidade, rua, numero, complemento, RG, nomeDaMae) 
VALUES ("Nicolas Grande", "2008-12-1", "Canadá", "Manitoba", "Brandon", "6th St", 841, "apto 160", 104954758,  "Alícia Horta");

INSERT INTO Paciente(nome, nascimento, pais, estado, cidade, rua, numero, complemento, RG, nomeDaMae) 
VALUES ("Rubi Lagos", "2020-2-11", "Portugal", "Vila real", "Chaves", "Av.Ten.Valadim", 889, "apto 1", 738493731,  "Rafaella Brião");

INSERT INTO Paciente(nome, nascimento, pais, estado, cidade, rua, numero, complemento, RG, nomeDaMae) 
VALUES ("Delmar Falcão", "2019-09-13", "Portugal", "Porto", "Sabrosa", "R.de Gentios", 151, "apto 180", 838493628,  "Marina Gois");

INSERT INTO Paciente(nome, nascimento, pais, estado, cidade, rua, numero, complemento, RG, nomeDaMae) 
VALUES ("Raj Lima", "2019-06-15", "Alemanha", "Saxônia", "Dresden", "Sebnitzer Str", 37, "apto 232", 1948573930,  "Tatiana Temes");

INSERT INTO Paciente(nome, nascimento, pais, estado, cidade, rua, numero, complemento, RG, nomeDaMae) 
VALUES ("Gaia Cruz", "2013-06-15", "Alemanha", "Turíngia", "Eisenach", "Willi-Enders-Straße", 13, "apto 176", 473618394,  NULL);

INSERT INTO Paciente(nome, nascimento, pais, estado, cidade, rua, numero, complemento, RG, nomeDaMae) 
VALUES ("Noctis Lucis", "2013-06-15", "Alemanha", "Turíngia", "Eisenach", NULL, NULL, NULL, NULL,  NULL);


# Médicos

INSERT INTO Medico VALUES (374638, "Angelo Espinosa");

INSERT INTO Medico VALUES (483728, "Aaron Furtado");

INSERT INTO Medico VALUES (293872, "Yaroslav Palhares");

INSERT INTO Medico VALUES (182736, "Mirela Lira");

INSERT INTO Medico VALUES (837291, "Alina Ilha");

INSERT INTO Medico VALUES (485746, "Nikolas Quintana");

INSERT INTO Medico VALUES (718273, "Sheila Goulão");

INSERT INTO Medico VALUES (463527, "Isaac Franca");

INSERT INTO Medico VALUES (293874, "Yassna Paião");

INSERT INTO Medico VALUES (102938, "Luara Lousada");


# Farmacêuticos

INSERT INTO Farmaceutico VALUES(18374, "Antoine Vasconcelos", "Hematologia");

INSERT INTO Farmaceutico VALUES(39485, "Laura Sintra", "Urinálise");

INSERT INTO Farmaceutico VALUES(10293, "Radija Meireles", "Hemostasia e coagulação");

INSERT INTO Farmaceutico VALUES(74839, "Rayanne Martinho", "Microbiologia");

INSERT INTO Farmaceutico VALUES(90871, "Wallace Prestes", "Bioquímica clínica");

INSERT INTO Farmaceutico VALUES(27384, "Emílio Mieiro", "Toxicologia");

INSERT INTO Farmaceutico VALUES(19283, "Isaque Jesus", "Toxicologia");

INSERT INTO Farmaceutico VALUES(49382, "Cristal Pessoa", "Hematologia");

INSERT INTO Farmaceutico VALUES(50293, "Aysha Bernardes", "Hematologia");

INSERT INTO Farmaceutico VALUES(10284, "Salomé Gentil", "Urinálise");

# Telefone_Paciente

INSERT INTO Telefone_Paciente VALUES (1, 934568756);

INSERT INTO Telefone_Paciente VALUES (2, 937467740);

INSERT INTO Telefone_Paciente VALUES (3, 935423256);

INSERT INTO Telefone_Paciente VALUES (4, 939632348);

INSERT INTO Telefone_Paciente VALUES (5, 931668758);

INSERT INTO Telefone_Paciente VALUES (6, 925765463);

INSERT INTO Telefone_Paciente VALUES (7, 923494137);

INSERT INTO Telefone_Paciente VALUES (8, 924858565);

INSERT INTO Telefone_Paciente VALUES (9, 925842788);

INSERT INTO Telefone_Paciente VALUES (10, 926552122);

INSERT INTO Telefone_Paciente VALUES (11, 923912338);


#Solicitações

INSERT INTO Solicitacao VALUES (str_to_date('22/02/2021', '%d/%m/%Y'), "Acidente de carro", 11223, 1, 374638);

INSERT INTO Solicitacao VALUES (str_to_date('22/02/2021', '%d/%m/%Y'), "Acidente de carro", 22334, 2, 483728);

INSERT INTO Solicitacao VALUES (str_to_date('13/01/2021', '%d/%m/%Y'), "Feridas de arma de fogo", 33445, 3, 293872);

INSERT INTO Solicitacao VALUES (str_to_date('14/06/2022', '%d/%m/%Y'), "Feridas de arma de fogo", 44556, 4, 182736);

INSERT INTO Solicitacao VALUES (str_to_date('18/03/2022', '%d/%m/%Y'), " Queda de lugares altos", 55667, 5, 837291);

INSERT INTO Solicitacao VALUES (str_to_date('30/05/2016', '%d/%m/%Y'), " Queda de lugares altos", 66778, 6, 485746);

INSERT INTO Solicitacao VALUES (str_to_date('15/04/2015', '%d/%m/%Y'), "Queimaduras graves", 77889, 7, 718273);

INSERT INTO Solicitacao VALUES (str_to_date('09/08/2017', '%d/%m/%Y'), "Queimaduras graves", 88990, 8, 463527);

INSERT INTO Solicitacao VALUES (str_to_date('28/07/2017', '%d/%m/%Y'), "Tentativas de homicídio", 99000, 9, 293874);

INSERT INTO Solicitacao VALUES (str_to_date('11/05/2016', '%d/%m/%Y'), "Tentativas de homicídio", 11000, 10, 102938);

INSERT INTO Solicitacao VALUES (str_to_date('11/05/2016', '%d/%m/%Y'), "Tentativas de homicídio", 22, 10, 102938);

INSERT INTO Solicitacao VALUES (str_to_date('14/02/2015', '%d/%m/%Y'), "Tentativas de homicídio", 23000, 11, 102938);


# Exames

INSERT INTO Exame VALUES ("Glicose", "Roxa", 123456789012, 11223, 90871);

INSERT INTO Exame VALUES ("Uréia", "Amarela", 230938303023, 22334, 39485);

INSERT INTO Exame VALUES ("Creatinina", "Roxa", 309282930292, 33445, 90871);

INSERT INTO Exame VALUES ("Colesterol HDL", "Roxa", 409238490212, 44556, 90871);

INSERT INTO Exame VALUES ("Colesterol LDL", "Roxa", 502938471632, 55667, 90871);

INSERT INTO Exame VALUES ("Colesterol total", "Roxa", 608493827381, 66778, 90871);

INSERT INTO Exame VALUES ("TGP", "Roxa", 372819209312, 77889, 90871);

INSERT INTO Exame VALUES ("Gamma GT (GGT)", "Roxa", 283940392812, 88990, 90871);

INSERT INTO Exame VALUES ("TGO", "Roxa", 283715263748, 99000, 90871);

INSERT INTO Exame VALUES ("Triglicerídeos", "Roxa", 920192874635, 11000, 90871);

INSERT INTO Exame VALUES ("Hemoglobina", "Vermelha", 389865763025, 11223, 18374);

INSERT INTO Exame VALUES ("Hematócrito ", "Vermelha", 376654421271, 11223, 18374);

INSERT INTO Exame VALUES ("VCM", "Vermelha", 674797364437, 22334, 18374);

INSERT INTO Exame VALUES ("HCM (FL)", "Vermelha", 154531528073, 22334, 18374);

INSERT INTO Exame VALUES ("Albumina", "Vermelha", 794078336556, 33445, 18374);

INSERT INTO Exame VALUES ("Proteínas totais", "Vermelha", 926994392596, 33445, 18374);

INSERT INTO Exame VALUES ("Ferro sérico", "Vermelha", 994978808119, 44556, 18374);

INSERT INTO Exame VALUES ("Fosfatase alcalina", "Vermelha", 964347453968, 44556, 18374);

INSERT INTO Exame VALUES ("Bilirrubina total", "Vermelha", 114259123153, 55667, 18374);

INSERT INTO Exame VALUES ("Bilirrubina direta", "Vermelha", 185151599882, 55667, 18374);

INSERT INTO Exame VALUES ("Bilirrubina indireta", "Vermelha", 317917603158, 66778, 18374);

INSERT INTO Exame VALUES ("Ácido úrico", "Amarela", 392710288292, 66778, 39485);

INSERT INTO Exame VALUES ("Sódio", "Roxa", 968351755484, 77889, 90871);

INSERT INTO Exame VALUES ("Potássio", "Roxa", 903685911329, 77889, 90871);

INSERT INTO Exame VALUES ("Fósforo", "Roxa", 993719893758, 88990, 90871);

INSERT INTO Exame VALUES ("Magnésio", "Roxa", 931035837438, 88990, 90871);

INSERT INTO Exame VALUES ("Cálcio iônico ", "Roxa", 791764688630, 99000, 90871);

INSERT INTO Exame VALUES ("Proteína C reativa", "Roxa", 827494853155, 99000, 90871);

INSERT INTO Exame VALUES ("TAP", "Branca", 149050607481, 11000, 10293);

INSERT INTO Exame VALUES ("TPTA", "Branca", 169149475715, 11000, 10293);

INSERT INTO Exame VALUES ("Plaquetas", "Vermelha", 154727281215, 11223, 18374);

INSERT INTO Exame VALUES ("Leucócitos", "Vermelha", 442858799872, 11223, 18374);

INSERT INTO Exame VALUES ("Neutrófilos", "Vermelha", 767832718294, 22334, 18374);

INSERT INTO Exame VALUES ("Eosinófilos", "Vermelha", 626775183972, 22334, 18374);

INSERT INTO Exame VALUES ("Basófilos", "Vermelha", 135914573934, 33445, 18374);

INSERT INTO Exame VALUES ("Linfócitos", "Vermelha", 645224988178, 33445, 18374);

INSERT INTO Exame VALUES ("Monócitos", "Vermelha", 867597184335, 44556, 18374);

INSERT INTO Exame VALUES ("D-dímero", "Laranja", 474647675898, 55667, 74839);

INSERT INTO Exame VALUES ("PCR", "Laranja", 316113289037, 55667 , 74839);

INSERT INTO Exame VALUES ("LDH", "Laranja", 948776224329, 55667, 74839);

INSERT INTO Exame VALUES ("RTPCR", "Laranja", 636110597275, 55667, 74839);

INSERT INTO Exame VALUES ("Plaquetas", "Vermelha", 8998, 22, 18374);

INSERT INTO Exame VALUES ("Leucócitos", "Vermelha", 1372839401923, 23000, 18374);

# Resultados

INSERT INTO Resultado VALUES (1, 103, 80, "Até 99 mg / dl", 1, 374638, "123456789012");

INSERT INTO Resultado VALUES (2, 102, 12, "13-43 mg / dl", 2, 483728, "230938303023");

INSERT INTO Resultado VALUES (3, 104, 0.7, "Homem: 0,7 a 1,3 mg/dl | Mulher: 0,6-0,11 mg/dl ", 3, 293872, "309282930292");

INSERT INTO Resultado VALUES (4, 107, 20, "Homens: até 41 U/l | Mulheres: até 31 U/l", 7, 718273, "372819209312");

INSERT INTO Resultado VALUES (5, 111, 140, "Bom: < 150 mg/dl | Moderadamente alto: 150 a 199 mg/dl | Alto: 200 a 400 mg/ dl | Muito alto: >= 500 mg/dl", 10, 102938, "920192874635");

INSERT INTO Resultado VALUES (6, 123, 13, "12-15,5 g/dl", 1, 374638, "389865763025");

INSERT INTO Resultado VALUES (7, 108, 12, "Bom: <= 11,3 segundos e 100% da atividade enzimática | Ruim: > 11,3 segundos e 50% da atividade enzimática", 10, 102938, "149050607481");

INSERT INTO Resultado VALUES (8, 109, 1, "0 a 2 %", 3, 293872, "135914573934");

INSERT INTO Resultado VALUES (9, 120, 0.400, "Até 0,500 µd/mL", 5, 837291, "474647675898");

INSERT INTO Resultado VALUES (10, 118, 1.5, "Muito alto risco: acima de 10 mg/dl ou 1 mg/dl | Alto risco: 2,0 mg/dl ou 0,2 mg/dl | Médio risco: entre 1,0 e 2,0 mg/dl ou 0,1 e 0,2 mg/dl | Baixo risco: menor que 1,0 mg/dl ou 0,1 mg/dl", 5, 837291, "316113289037");

INSERT INTO Resultado VALUES (11, 120, 125, "Adultos: entre 120 e 246 UI/L", 5, 837291, "948776224329");

INSERT INTO Resultado VALUES (12, 120, 2, "Negativo: uma barra | Positivo: duas barras", 5, 837291, "636110597275");

INSERT INTO Resultado VALUES (13, 120, 4, "Homens: 4,5 a 11 | Mulheres: 4,5 a 11", 11, 102938, "1372839401923");

# Exemplo de como seria o resultado laboratorial que ele pede, que no caso é pra ser feito no DML não no DDL
SELECT p.nome AS nomePaciente, p.nProtocolo, r.numeroLaboratorio, m.nome AS nomeMedico, r.idExame AS Exame, r.valorMedido, r.valorReferencia 
FROM Paciente AS p JOIN Resultado AS r JOIN Medico AS m ON p.nProtocolo = r.idPaciente AND p.nProtocolo = 10 AND r.idMedico = m.CRM;    

# Consultas Avançadas

# 1

SELECT tipo, cor, codDeBarras  FROM Exame AS e JOIN Solicitacao AS s 
ON date_format(dataDeAceitacao, "%Y") BETWEEN date_format(now(), "%Y") - 5 AND now()  
AND e.idSolicitacao = s.numeroSolicitacao;

# 2

SELECT nome FROM Paciente WHERE nomeDaMae IS NULL AND nProtocolo IN(SELECT idPaciente FROM Solicitacao);
 
# 3

SELECT tipo AS Tipo, count(tipo) AS Quantidade FROM Exame GROUP BY tipo ORDER BY Quantidade DESC;

# 4

SELECT p.nome AS Paciente ,valorMedido, valorReferencia FROM Resultado AS r JOIN Paciente as p
ON p.nProtocolo = r.idPaciente
WHERE idPaciente = (SELECT nProtocolo FROM Paciente ORDER BY nProtocolo DESC LIMIT 1);

# 5

SELECT count(numeroResultado) AS Exames_Covid FROM Resultado AS r JOIN Exame AS e 
ON r.idExame = e.codDeBarras 
WHERE e.tipo = "PCR" OR e.tipo = "D-dímero" OR e.tipo = "LDH" OR e.tipo = "RTPCR";

# 6

SELECT p.nome AS Paciente, r.idMedico AS CRM_Medico, count(r.numeroResultado) AS nResultados FROM Resultado AS r JOIN Paciente as p 
ON r.idPaciente = p.nProtocolo GROUP BY p.nome ORDER BY nResultados DESC LIMIT 1;

# 7

SELECT * FROM Paciente WHERE rua IS NULL AND numero IS NULL AND complemento IS NULL AND RG IS NULL AND nomeDaMae IS NULL;

# 8

SELECT m.nome AS nome_medico, m.CRM, count(numeroSolicitacao) AS nSolicitacoes FROM Medico AS m JOIN Solicitacao AS s 
ON s.idMedico = m.CRM GROUP BY m.nome ORDER BY numeroSolicitacao DESC;

# 9 

SELECT f.setor AS Setor, e.cor AS Cor,count(cor) AS nExames FROM Exame AS e JOIN Farmaceutico AS f 
ON e.idFarmaceutico = f.CRF GROUP BY f.setor ORDER BY nExames DESC LIMIT 1;

# 10

SELECT p.nome, e.tipo, r.valorMedido, r.valorReferencia FROM Paciente as p JOIN Resultado AS r JOIN Exame as e
ON p.nProtocolo = r.idPaciente AND e.codDeBarras = r.idExame 
WHERE e.tipo = "PCR" OR e.tipo = "D-dímero" OR e.tipo = "LDH" OR e.tipo = "RTPCR";

# Pra testes

DESCRIBE Paciente;
DESCRIBE Medico;
DESCRIBE Farmaceutico;
DESCRIBE Telefone_Paciente;
DESCRIBE Solicitacao;
DESCRIBE Exame;
DESCRIBE Resultado;

SELECT * FROM Paciente;
SELECT * FROM Medico;
SELECT * FROM Farmaceutico;
SELECT * FROM Telefone_Paciente;
SELECT * FROM Solicitacao;
SELECT * FROM Exame;
SELECT * FROM Resultado;

DROP TABLE Resultado;
DROP TABLE Exame;
DROP TABLE Solicitacao;
DROP TABLE Telefone_Paciente;
DROP TABLE Paciente;
DROP TABLE Medico;
DROP TABLE Farmaceutico;