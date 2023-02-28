-- ## VAMOS CRIAR UMA TABELA COM DATAS ## --
-- Vamos utilizar para este exemplo DATE;
-- Criamos uma tabela com nomes e data de nascimento;
-- E por último vamos inserir dados na tabela;
-- Vamos lá !!!

-- Seleção do banco de dados
USE teste_tipo_dados;

-- Criando uma nova tabela
CREATE TABLE aniversarios (nome VARCHAR(100), data_nascimento DATE); 

-- Selecionando a tabela para ser visualizada
SELECT * FROM teste_tipo_dados.aniversarios;

-- Inserindo dados na tabela criada anteriormente
INSERT INTO aniversarios (nome, data_nascimento) VALUES ("Ismael Batista","1994-02-21");
INSERT INTO aniversarios (nome, data_nascimento) VALUES ("Ylari Batista","1996-06-07");
INSERT INTO aniversarios (nome, data_nascimento) VALUES ("Laura Batista", "1998-08-07");
