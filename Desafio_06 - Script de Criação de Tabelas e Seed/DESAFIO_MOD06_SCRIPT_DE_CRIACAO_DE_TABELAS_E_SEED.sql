CREATE DATABASE DESAFIO

CREATE TABLE TB_REGIAO(
	ID SERIAL,
	NOME VARCHAR(30) NOT NULL,
	LOCALIDADE_S VARCHAR(10),
	LOCALIDADE_W VARCHAR(10),
	DESCRICAO TEXT,
	PRIMARY KEY(ID)
);

CREATE TABLE TB_VINICOLA(
	ID SERIAL,
	NOME VARCHAR(30) NOT NULL,
	DESCRICAO TEXT,
	FONE VARCHAR(12),
	EMAIL VARCHAR(20),
	REGIAO_ID INT NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY(REIGAO_ID) REFERENCES TB_REGIAO(ID)
);

ALTER TABLE TB_VINICOLA RENAME COLUMN REIGAO_ID TO REGIAO_ID

CREATE TABLE TB_TIPO_VINHO(
	ID SERIAL PRIMARY KEY,
	NOME VARCHAR(30) NOT NULL
);

CREATE TABLE TB_VINHO(
	ID SERIAL,
	NOME VARCHAR(30) NOT NULL,
	TIPO_ID INT NOT NULL,
	PRECO FLOAT NOT NULL,
	VINICOLA_ID INT NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY(TIPO_ID) 	REFERENCES TB_TIPO_VINHO(ID),
	FOREIGN KEY(VINICOLA_ID) REFERENCES TB_VINICOLA(ID)
);

--INSTÂNCIAS--
--REGIÃO--

INSERT INTO TB_REGIAO(ID, NOME, LOCALIDADE_S, LOCALIDADE_W, DESCRICAO) VALUES(1, 'Vale Central', '33.8088', '70.7644', 'Chile');
INSERT INTO TB_REGIAO(ID, NOME, LOCALIDADE_S, LOCALIDADE_W, DESCRICAO) VALUES(2, 'Serra Gaúcha', '29.3746', '50.8764', 'Sul do Brasil');

--VINICOLA--

INSERT INTO TB_VINICOLA(ID, NOME, DESCRICAO, FONE, EMAIL, REGIAO_ID) VALUES (1, 'Santa Rita', 'localizada no valle del maipo e tem mais de 100 anos de história', NULL, 'santa@gmail.com', 1);
INSERT INTO TB_VINICOLA(ID, NOME, DESCRICAO, FONE, EMAIL, REGIAO_ID) VALUES (2, 'Santa Carolina', NULL, '3395-4422', 'carolina@gmail.com', 1);
INSERT INTO TB_VINICOLA(ID, NOME, DESCRICAO, FONE, EMAIL, REGIAO_ID) VALUES (3, 'Garibaldi', 'Vinícola situada na serra gaúcha', '9822-3344', 'garibaldi@gmail.com', 2);

INSERT INTO TB_TIPO_VINHO(ID, NOME) VALUES(1, 'Tinto');
INSERT INTO TB_TIPO_VINHO(ID, NOME) VALUES(2, 'Branco');
INSERT INTO TB_TIPO_VINHO(ID, NOME) VALUES(3, 'Rose');
INSERT INTO TB_TIPO_VINHO(ID, NOME) VALUES(4, 'Bordeaux');

INSERT INTO TB_VINHO(ID, NOME, TIPO_ID, PRECO, VINICOLA_ID) VALUES (1, 'Amanda', 1, 100.0, 1);
INSERT INTO TB_VINHO(ID, NOME, TIPO_ID, PRECO, VINICOLA_ID) VALUES (2, 'Belinha', 2, 200.0, 1);
INSERT INTO TB_VINHO(ID, NOME, TIPO_ID, PRECO, VINICOLA_ID) VALUES (3, 'Camila', 4, 65.0, 2);
INSERT INTO TB_VINHO(ID, NOME, TIPO_ID, PRECO, VINICOLA_ID) VALUES (4, 'Daniela', 3, 89.0, 2);
INSERT INTO TB_VINHO(ID, NOME, TIPO_ID, PRECO, VINICOLA_ID) VALUES (5, 'Eduarda', 1, 55.0, 3);
INSERT INTO TB_VINHO(ID, NOME, TIPO_ID, PRECO, VINICOLA_ID) VALUES (6, 'Fernanda', 2, 70.0, 3);