-- cadastrar o diretor
INSERT INTO diretores (nome_diretor) VALUES ('Andy Muschietti');
-- foi cadastrado com o id 122


-- cadastrar o gênero
 INSERT INTO generos(nome_genero) VALUES('Terror');
-- cadastardo com o código 26

-- titulo_original, titulo, duracao, ano_lancamento, cod_diretor, cod_genero
INSERT INTO filmes(titulo_original, titulo, duracao, ano_lancamento, cod_diretor, cod_genero)
	VALUES ('It', 'It: A Coisa', 212, 2017, 122, 26);