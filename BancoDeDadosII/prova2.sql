--7 Listar o nome de todas disciplinas e a respectiva quantidade de matrículas, incluindo as disciplinas que não possuem matrículas.
SELECT d.cod_disciplina,d.nome, COUNT(m.cod_disciplina), c.nome
    FROM disciplina d LEFT JOIN matricula m 
    ON d.cod_disciplina=m.cod_disciplina
    INNER JOIN curso c ON d.cod_curso=c.cod_curso
    GROUP BY d.cod_disciplina
    ORDER BY d.nome;

--6. Descobrir o total gasto com os salários dos professores do curso “Sistemas para Internet”.

SELECT SUM(salario) FROM professor
    WHERE cod_professor IN
(SELECT DISTINCT p.cod_professor
FROM professor p INNER JOIN disciplina d 
    ON p.cod_professor=d.cod_professor INNER JOIN curso c
    ON d.cod_curso = c.cod_curso
    WHERE c.nome='Sistemas para Internet')



SELECT SUM(salario) FROM 
(SELECT DISTINCT p.cod_professor, salario
FROM professor p INNER JOIN disciplina d 
    ON p.cod_professor=d.cod_professor INNER JOIN curso c
    ON d.cod_curso = c.cod_curso
    WHERE c.nome='Sistemas para Internet') profes;


--11 Qual a carga horária de disciplinas por fase do curso Sistemas para Internet?

SELECT fase, SUM(carga_horaria) FROM curso c INNER JOIN disciplina d
    ON c.cod_curso=d.cod_curso
    WHERE c.nome='Sistemas para Internet'
    GROUP BY fase;




















