--QUESTÃO 1
SELECT C.NOME AS CURSO, 
	   T.NUMERO AS TURMA, 
	   T.INICIO AS INICIO
FROM TB_CURSO C
	JOIN TB_TURMA T ON C.ID = T.CURSO_ID

--QUESTÃO 2
SELECT C.NOME AS CURSO, 
	   T.NUMERO AS TURMA, 
	   A.NOME AS ALUNO, 
	   A.CPF AS CPF
FROM TB_ALUNO A
	JOIN TB_MATRICULA M ON A.CPF = ALUNO_ID
	JOIN TB_TURMA T     ON T.ID = M.TURMA_ID
	JOIN TB_CURSO C     ON C.ID = T.CURSO_ID

--QUESTÃO 3
SELECT A.DATA, 
	   A.NOTA, 
	   AL.NOME, 
	   R.NOTA_OBTIDA, 
	   ROUND(((R.NOTA_OBTIDA * 100) / A.NOTA),2) AS PORCENTAGEM
FROM TB_AVALIACAO A
	JOIN TB_RESULTADO R ON A.ID = R.AVALIACAO_ID
	JOIN TB_ALUNO AL    ON R.ALUNO_ID = AL.CPF
ORDER BY A.ID DESC, AL.NOME

--QUESTÃO 4
SELECT AL.NOME, 
	   SUM(R.NOTA_OBTIDA) AS TOTAL
FROM TB_RESULTADO R
	JOIN TB_AVALIACAO A ON A.ID = R.AVALIACAO_ID
	JOIN TB_TURMA T     ON T.ID = A.TURMA_ID
	JOIN TB_ALUNO AL    ON R.ALUNO_ID = AL.CPF
WHERE T.NUMERO = 10
	GROUP BY AL.CPF
	ORDER BY AL.NOME