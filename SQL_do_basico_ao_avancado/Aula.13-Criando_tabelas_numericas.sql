-- Definindo o banco a ser usado
USE teste_tipo_dados;
-- Creando a tabela e suas respectivas colunas 
CREATE TABLE servidores (nome VARCHAR(100), espaco_disco INT(10), ligado BOOL);
-- Para apagar uma tabela usamos DROP TABLE <nome_Tabela>
Drop Table servidores;
-- Inserindo
INSERT INTO servidores (nome, espaco_disco, ligado) VALUES ("Servidor 2", 89548753, 1);
-- Selecionando os dados a serem visualizados
SELECT * FROM teste_tipo_dados.servidores;