
  --  1. Listar o título dos filmes e seu respectivo gênero, incluindo na lista os gêneros que não possuem filmes.
  
  
  --  2. Listar o nome dos atores que atuam nos 5 filmes de maior duração (Dica: usar relações derivadas, order e limit).
  
  --5 filmes de maior duração:
  (SELECT cod_filme FROM filmes ORDER BY duracao DESC LIMIT 5) AS grandoes
  
  -- segundo passo fazer junção com ator e elenco
  SELECT DISTINCT a.nome_ator 
	FROM atores a INNER JOIN elenco e ON a.cod_ator=e.cod_ator
	INNER JOIN 
	(SELECT cod_filme FROM filmes ORDER BY duracao DESC LIMIT 5) AS grandoes ON e.cod_filme=grandoes.cod_filme;
	
  
  
  
  
  --  3. Listar o nome dos atores, em ordem alfabética, que nunca gravaram um filme.
  
  
  --  4. Listar o título em português dos filmes que sejam dos seguintes gêneros: Infantil, Aventura ou Show (usar consultas aninhadas e a cláusula IN).
  
  
  --  5. Listar o título em português dos filmes dos gêneros: Ação, Infantil e Comédia, lançados após 2005 (usar cláusula IN).
  SELECT titulo, cod_genero FROM filmes
	WHERE ano_lancamento>2005 AND cod_genero IN (
		SELECT cod_genero FROM generos 
		WHERE nome_genero IN ('Ação', 'Infantil', 'Comédia')
	);
	
	-- versão 2 com junção interna
	SELECT f.titulo, g.nome_genero 
		FROM filmes f INNER JOIN 
		(SELECT cod_genero, nome_genero FROM generos 
			WHERE nome_genero IN ('Ação', 'Infantil', 'Comédia')) AS g
		ON g.cod_genero=f.cod_genero
		WHERE ano_lancamento >2005;


  --  6. Quais diretores não fizeram nenhum filme? Faça este comando SQL sem utilizar a palavra NULL em todo código.
  SELECT nome_diretor FROM diretores 
	WHERE cod_diretor NOT IN (
		SELECT d.cod_diretor FROM diretores d INNER JOIN filmes f
			ON d.cod_diretor=f.cod_diretor
	);
  
  --  7. Exibir a lista de filmes que não possui nenhum ator (elenco).
  SELECT titulo, e.cod_ator
	FROM filmes f LEFT JOIN elenco e 
		ON f.cod_filme = e.cod_filme
		WHERE e.cod_ator IS NULL;
		
	-- usando NOT IN
	SELECT titulo FROM filmes 
		WHERE cod_filme NOT IN (
			SELECT cod_filme FROM elenco
		);