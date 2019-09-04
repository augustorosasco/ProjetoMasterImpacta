USE DB_ESCOLA;
GO

--Listando todos os cursos de todas as escolas
SELECT * FROM TBEscolas, TBCursos

--Listando com restri��es
SELECT * FROM TBEscolas, TBCursos 
WHERE 
	TBEscolas.Id = TBCursos.IdEscola

--Lista com relacionamento, permitindo sele��o de campos
--usando uma vari�vel como base de pesquisa
DECLARE @Valor FLOAT;
SET @Valor = 1500;

SELECT 
	E.Descricao As Escola,
	C.Descricao As Curso,
	E.Endereco As Endere�o,
	C.Preco as Pre�o
FROM 
	TBEscolas E, TBCursos C
WHERE 
	E.Id = C.IdEscola 
	AND C.Preco >= @Valor

--Consultas envolvendo agrupamentos e fun��es de agrega��o.
--Apresentar as escolas e a quantidade de cursos por escola
SELECT
	E.Descricao As Escola,
	E.Telefone As Telefone,
	Count(C.Descricao) As QuantCursos,
	Sum(C.Preco) As Total
From 
	TBEscolas E, TBCursos C
WHERE
	E.Id = C.IdEscola
GROUP BY
	E.Descricao, E.Telefone

SELECT
	E.Descricao As Escola,
	E.Telefone As Telefone,
	Count(C.Descricao) As QuantCursos
From 
	TBEscolas E, TBCursos C
WHERE
	E.Id = C.IdEscola
GROUP BY
	E.Descricao, E.Telefone
