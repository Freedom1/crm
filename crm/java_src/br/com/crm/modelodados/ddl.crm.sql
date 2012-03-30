spool ddl.crm.txt

drop user crm cascade;

--Ao cria o usuario cria automaticamente o schema
-- Schema é um contanier de objetos
create user crm identified by crm;

-- DCL - Data Control Language
grant connect,resource to crm;

connect crm/crm
--------------------------------------------------------------------------------
--------------------------- Data Definition Language ---------------------------
-------------------------------------- DDL -------------------------------------
------------------------------ CREATE, ALTER, DROP -----------------------------
---------------------------------- GRUPO ALUNO ---------------------------------
--------------------------------------------------------------------------------

create table tb_aluno(
	id_aluno					number(18,0)	not null,
	tx_nome						varchar2(100)	not null,
	in_sexo 					char(1)			not null,
	dt_nascimento				date			not null,
	in_estado_civil				char(2)			not null,
	dt_cadastro					date			not null,
	in_ativo					char(1)			default 'N'		not null,
	id_naciolidade				number(18,0)	not null,
	dt_atualizacao				date			null,
	id_domicilio 				number(18,0)	not null,
	id_documento 				number(18,0)	not null,	
	id_estado					number(18,0)	not null, --Natural
	id_pais						number(18,0)	not null  --Nacionalidade
);

create table tb_tutor(
	id_tutor						number(18,0)	not null,
	tx_descricao					varchar(20)		not null
);

create table tb_filiacao(
	id_filiacao						number(18,0)	not null,
	tx_nome							varchar2(100)	not null,
	in_sexo							char(1)			not null,
	id_tutor						number(18,0)	not null,
	id_aluno						number(18,0)	null
);

-- PRIMARY KEY
alter table tb_filiacao add constraint pk_filiacao 	primary key(id_filiacao);
alter table tb_aluno 	add constraint pk_aluno 	primary key(id_aluno);
alter table tb_tutor 	add constraint pk_tutor 	primary key(id_tutor);

-- FOREIGN KEY
alter table tb_filiacao add constraint fk_filiacao_tutor foreign key(id_tutor) 	references tb_tutor(id_tutor);
alter table tb_filiacao	add constraint fk_filiacao_aluno foreign key(id_aluno) 	references tb_aluno(id_aluno);
	
-- SEQUENCE
-- Importante saber que uma sequence pode ser usado para mais de uma tabela.
create sequence crm.sq_filiacao increment by 1 start with 100;
create sequence crm.sq_tutor increment by 1 start with 100;
create sequence crm.sq_aluno increment by 1 start with 100;
create sequence crm.sq_bozo increment by 1 start with 100;
--deleta a sequence - n�o funciona o delete somente drop
drop sequence crm.sq_bozo;

-- CHECK
alter table tb_aluno add constraint ck_aluno_sexo check(in_sexo in('M','F'));
-- M = MASCULINO
-- F = FEMININO

alter table tb_aluno add constraint ck_aluno_estado_civil check(in_estado_civil in('SO','VI','CA','DI','DE'));
-- CHECK - aluno: ESTADO CIVIL
-- SO = SOLTEIRO
-- VI = VIUVO
-- CA = CASADO
-- DI = DIVORCIADO
-- DE = DESQUITADO


--------------------------------------------------------------------------------
--------------------------- Data Definition Language ---------------------------
-------------------------------------- DDL -------------------------------------
------------------------------ CREATE, ALTER, DROP -----------------------------
-------------------------------- GRUPO ESCOLA -------------------------------
--------------------------------------------------------------------------------

create table tb_matricula(
	id_matricula			number(18,0)		not null		constraint pk_matricula primary key,
)


spool off
exit


 
