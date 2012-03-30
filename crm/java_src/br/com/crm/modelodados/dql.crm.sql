
--------------------------------------------------------------------------------
-------------------------- Data Manipulation Language --------------------------
-------------------------------------- DQL -------------------------------------
------------------------------------ SELECT ------------------------------------
-------------------------------- INTERSECT/MINUS -------------------------------
--------------------------------------------------------------------------------
-- INTERSECT e MINUS devem retorna mesmo campos

----Seleciona todos alunos nacionalidade brasileira
select * from tb_aluno where id_naciolidade = 1
INTERSECT
-- seleciona todos alunos dos sexo masculino
select * from tb_aluno where in_sexo='M';
--Retorna todos alunos de nacionalidade brasileira do sexo masculino


----Seleciona todos alunos nacionalidade brasileira
select * from tb_aluno where id_naciolidade = 1
MINUS
-- seleciona todos alunos dos sexo masculino
select * from tb_aluno where in_sexo='M';
--Retorna todos alunos de nacionalidade brasileira do sexo feminino

--------------------------------------------------------------------------------
-------------------------- Data Manipulation Language --------------------------
-------------------------------------- DQL -------------------------------------
------------------------------------ SELECT ------------------------------------
-------------------------------- SUBSTR -------------------------------
--------------------------------------------------------------------------------
-- Seleciona todas das de atualização do ano e ano.
select dt_atualizacao,substr(dt_atualizacao,7,10) from tb_aluno;
-- Obs: Os parâmetros 2 e 3 informar quais itens devem ser exibidos.
-- Obs: Necessario informar os 3 parametros

--------------------------------------------------------------------------------
-------------------------- Data Manipulation Language --------------------------
-------------------------------------- DQL -------------------------------------
------------------------------------ SELECT ------------------------------------
-------------------------------- TO_DATE/TO_CHAR -------------------------------
--------------------------------------------------------------------------------
-- Converte o texto em data
select to_date('11/09/2011') from dual;

-- Formata a data para ano com 2 digitos
select to_date(dt_atualizacao,'dd/mm/yy') from tb_aluno;
-- Importante saber que o 2 parâmetro é o formato e nao pode ser nada diferente disso.

--------------------------------------------------------------------------------
-------------------------- Data Manipulation Language --------------------------
-------------------------------------- DQL -------------------------------------
------------------------------------ SELECT ------------------------------------
-------------------------------- CURRVAL/NEXTVAL -------------------------------
--------------------------------------------------------------------------------
--Ultimo numero gerado
select sq_filiacao.currval from dual;
-- Próximo numero a ser gerado
select sq_filiacao.nextval from dual;

--------------------------------------------------------------------------------
-------------------------- Data Manipulation Language --------------------------
-------------------------------------- DQL -------------------------------------
------------------------------------ SELECT ------------------------------------
------------------------------------ HAVING ------------------------------------
--------------------------------------------------------------------------------
-- Agrupa a quantidade de pessoas pelo estado civil conforme o having
select count(*),in_estado_civil from tb_aluno group by in_estado_civil having in_estado_civil in('SO','VI','CA');
-- Obs: having é um where do group by

--------------------------------------------------------------------------------
-------------------------- Data Manipulation Language --------------------------
-------------------------------------- DQL -------------------------------------
------------------------------------ SELECT ------------------------------------
---------------------------------- SUBQUERIES ----------------------------------
--------------------------------------------------------------------------------
-- Group By e Order By pode existir na subqueries
-- A query principal e subquery pode obetr dados de direferente tabelas
-- Multiplas colunas e expressoes podem ser comparada entre uma query principal e uma subquery

--------------------------------------------------------------------------------
-------------------------- Data Manipulation Language --------------------------
-------------------------------------- DQL -------------------------------------
------------------------------------ SELECT ------------------------------------
---------------------------------- MAX/AVG ----------------------------------
--------------------------------------------------------------------------------
-- Retorna o valor máximo
select max(id_aluno) from tb_aluno;

--Calcula a média

--------------------------------------------------------------------------------
-------------------------- Data Manipulation Language --------------------------
-------------------------------------- DQL -------------------------------------
------------------------------------- DICAS ------------------------------------
--------------------------------------------------------------------------------
--Soma mais dez dias a data atual
select sysdate+'10' from dual;

--Colocar casa decimais a esquerda
select to_char(11,'00000000') from dual;

--------------------------------------------------------------------------------
-------------------------- Data Manipulation Language --------------------------
-------------------------------------- DQL -------------------------------------
--------------------------------- TRANSACTION ----------------------------------
--------------------------------------------------------------------------------
-- DDL - Completa uma transação
-- ROLLBACK - Completa uma transação
-- TRUNCATE - Completa uma transação

--------------------------------------------------------------------------------
-------------------------- Data Manipulation Language --------------------------
-------------------------------------- DQL -------------------------------------
------------------------------------ SELECT ------------------------------------
---------------------------------- INNER JOIN ----------------------------------
--------------------------------------------------------------------------------

select * from tb_estado uf, tb_regiao rg where uf.id_regiao = rg.id_regiao order by tx_regiao


--3
--select * from tipocontrato
--150
--select * from usuario

--450 = 3*150
--select * from usuario,tipocontrato
--select * from usuario us cross join tipocontrato tp 

--145
--select * from usuario us, tipocontrato tp where us.cdtipocontrato = tp.cdtipocontrato
--select * from usuario us inner join tipocontrato tp on us.cdtipocontrato = tp.cdtipocontrato

--5
--select * from usuario us where us.cdtipocontrato is null

--150 - Prioriza o usuario traz todos mesmo sem o cdtipocontrato
--select * from usuario us, tipocontrato tp where us.cdtipocontrato = tp.cdtipocontrato(+)
--select * from usuario us left join tipocontrato tp on us.cdtipocontrato = tp.cdtipocontrato

--147 - Prioriza o Tipo Contrato, Adiciona usuario nulo para cada cdcontrato que nao tiver juncao
--select * from usuario us, tipocontrato tp where us.cdtipocontrato(+) = tp.cdtipocontrato
--select * from usuario us right join tipocontrato tp on us.cdtipocontrato = tp.cdtipocontrato

--152 - Traz os 2 sem juncao pelo cdtipo contrato e todos com juncao
--select * from usuario us FULL join tipocontrato tp on us.cdtipocontrato = tp.cdtipocontrato

