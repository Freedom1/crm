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
	id_documento_campo 			number(18,0)	not null,	
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
-------------------------------- GRUPO DOMICILIO -------------------------------
--------------------------------------------------------------------------------
-- Por padr�o SQL Plus e SQL Developer converte tudo que nao esteja entre aspas dupla para de lowercase para upper.
-- Maximo 30 caracteres e pode ter letras, numeros, _, $ e #. 
create table tb_pais(
	id_pais							number(18,0)				not null 		constraint pk_pais		primary key,-- PK
	tx_pais							varchar2(20)				not null, -- Brasil
	in_sigla2						char(2)						not null,
	in_sigla3						char(3)						not null
);

create table tb_estado(
	id_estado						number(18,0)				not null 		constraint pk_estado	primary key,-- PK
	tx_estado						varchar2(100)				not null,-- S�o Paulo
	in_sigla2						char(2)						not null,-- SP
	id_pais							number(18,0)				not null,--FK
	id_regiao						number(18,0)				not null--FK
);

create table tb_regiao(
	id_regiao						number(18,0)				not null 		constraint pk_regiao	primary key,-- PK
	tx_regiao						varchar2(20)				not null
);

create table tb_cidade(
	--Id da cidade conforme o IBGE
	id_cidade						number(18,0)				not null		constraint pk_cidade	primary key,-- 1
	tx_cidade						varchar2(100)				not null,-- S�o paulo
	id_estado						number(18,0)				not null,--FK
	constraint fk_cidade_estado		foreign key(id_estado) 		references tb_estado(id_estado)
);

create table tb_bairro(
	id_bairro						number(18,0)				not null		constraint pk_bairro	primary key,-- 1
	tx_bairro						varchar2(200)				not null,--Vila Maria
	in_oficial						char(1)						default 'N'					not null,-- S=OFICIAL /N= NAO OFICIAL
	id_cidade						number(18,0)				not null,
	in_ativo						char(1)						default '0'					not null-- 0=DESATIVO/1=ATIVO
);

alter table tb_bairro add constraint ck_bairro_oficial check(in_oficial in('S','N'));
-- S = BAIRRO OFICIAL
-- N = BAIRRO N�O OFICIAL

create table tb_cep(
	id_cep							number(18,0)				not null		constraint pk_cep	primary key,-- 1
	tx_cep							varchar2(20)				not null,-- 02168070
	in_oficial						char(1)						default 'N' 				not null,-- S=OFICIAL /N= NAO OFICIAL
	in_ativo						char(1)						default '0'					not null,-- 0=DESATIVO/1=ATIVO
	id_bairro						number(18,0)				not null -- FK
);
alter table tb_cep add constraint ck_cep_oficial check(in_oficial in('S','N'));
-- S = CEP OFICIAL
-- N = CEP N�O OFICIAL

--Tipo de Rua = Rua, Avenida, Alameda.
create table tb_logradouro_tipo(
	id_logradouro_tipo				number(18,0)				not null		constraint pk_logradouro_tipo		primary key,-- PK
	tx_logradouro_tipo				varchar2(200)				not null, 	--Rua/Avenida
	in_logradouro_tipo_abrev		char(4)						null		--R/Av
);

--Nome da Rua
create table tb_logradouro(
	id_logradouro								number(18,0)							not null 	constraint pk_logradouro		primary key,	
	tx_logradouro								varchar2(200)							not null,	-- Rua do Jambo, 45
	in_oficial									char(1)			default 'N'				not null,-- S=OFICIAL /N= NAO OFICIAL
	in_ativo									char(1)			default '0'				not null,-- 0=DESATIVO/1=ATIVO
	id_cep										number(18,0)							not null,-- FK
	id_logradouro_tipo							number(18,0)							not null-- FK
);
alter table tb_logradouro add constraint ck_logradouro_oficial check(in_oficial in('S','N'));
-- S = LOGRADOURO OFICIAL
-- N = LOGRADOURO N�O OFICIAL

create table tb_complemento_tipo(
	id_complemento_tipo				number(18,0)				not null 				constraint pk_complemento_tipo	primary key,
	tx_complemento_tipo				varchar2(200)				not null-- APTO/CASA/SOBRADO
);

--o domicilio civil � o lugar em que a pessoa ordinariamente exerce seus direitos e cumpre suas obriga��es da vida civil, inclusive --quando chamada a faz�-lo por via judicial, uma vez que do domic�lio decorre a fixa��o da compet�ncia de foro para o julgamento de --a��es em que a pessoa figura como parte. Tem o domic�lio eleitoral
create table tb_domicilio(
	id_domicilio						number(18,0)				not null			constraint pk_domicilio		primary key,
	in_domicilio_tipo					varchar2(50)				not null,-- Civil/Eleitoral/Anonimo
	vl_numero							number(8,0)					not null,-- 45
	vl_bloco							number(8,0)					not null,-- B/Casa Fundo
	tx_travessa_1						varchar2(200)				not null,-- Rua Araritaguaba
	tx_travessa_2						varchar2(200)				not null,-- Rua Morango
	tx_complemento						varchar2(200)				not null,-- O numero antigo da casa era 250C
	tx_ponto_referencia					varchar2(200)				not null, -- Viaduto curu�a
	id_complemento_tipo					number(18,0)				not null, --FK
	id_logradouro						number(18,0)				not null
);
-- FOREIGN KEY
alter table tb_domicilio  add constraint fk_domicilio_complemento_tipo	foreign key(id_complemento_tipo)		references tb_complemento_tipo(id_complemento_tipo);
alter table tb_domicilio  add constraint fk_domicilio_logradouro		foreign key(id_logradouro) 				references tb_logradouro(id_logradouro);
alter table tb_logradouro add constraint fk_logradouro_logradouro_tipo	foreign key(id_logradouro_tipo) 		references tb_logradouro_tipo(id_logradouro_tipo);
alter table tb_logradouro add constraint fk_logradouro_cep				foreign key(id_cep) 					references tb_cep(id_cep);
alter table tb_estado 	  add constraint fk_estado_regiao				foreign key(id_regiao) 					references tb_regiao(id_regiao);
alter table tb_estado 	  add constraint fk_estado_pais 				foreign key(id_pais) 					references tb_pais(id_pais);
alter table tb_cep 		  add constraint fk_cep_bairro					foreign key(id_bairro) 					references tb_bairro(id_bairro);
alter table tb_bairro	  add constraint fk_bairro_cidade				foreign key(id_cidade) 					references tb_cidade(id_cidade);

-- SEQUENCE
create sequence crm.sq_pais 				increment by 1 start with 100;
create sequence crm.sq_estado 			increment by 1 start with 100;
-- Uma sequence pode ser alterada atraves do alter sequence;
-- ALTER SEQUENCE crm.sq_estado   MAXVALUE 30;
create sequence crm.sq_cidade 			increment by 1 start with 500000;
create sequence crm.sq_regiao				increment by 1 start with 100;
create sequence crm.sq_bairro 			increment by 1 start with 100;
create sequence crm.sq_cep 				increment by 1 start with 100;
create sequence crm.sq_logradouro_tipo 	increment by 1 start with 100;
create sequence crm.sq_logradouro 		increment by 1 start with 100;
create sequence crm.sq_domicilio 			increment by 1 start with 100;
create sequence crm.sq_complemento_tipo	increment by 1 start with 100;


--------------------------------------------------------------------------------
--------------------------- Data Definition Language ---------------------------
-------------------------------------- DDL -------------------------------------
------------------------------ CREATE, ALTER, DROP -----------------------------
------------------------------GRUPO ALUNO/DOMICILIO ----------------------------
--------------------------------------------------------------------------------
alter table tb_aluno add constraint fk_aluno_domicilio foreign key(id_domicilio) references tb_domicilio(id_domicilio);

--------------------------------------------------------------------------------
--------------------------- Data Definition Language ---------------------------
-------------------------------------- DDL -------------------------------------
------------------------------ CREATE, ALTER, DROP -----------------------------
---------------------------------GRUPO ALUNO/PAIS ------------------------------
--------------------------------------------------------------------------------
alter table tb_aluno add constraint fk_aluno_pais foreign key(id_pais) references tb_pais(id_pais);

--------------------------------------------------------------------------------
--------------------------- Data Definition Language ---------------------------
-------------------------------------- DDL -------------------------------------
------------------------------ CREATE, ALTER, DROP -----------------------------
------------------------------- GRUPO ALUNO/ESTADO -----------------------------
--------------------------------------------------------------------------------
alter table tb_aluno add constraint fk_aluno_estado foreign key(id_estado) references tb_estado(id_estado);

--------------------------------------------------------------------------------
--------------------------- Data Definition Language ---------------------------
-------------------------------------- DDL -------------------------------------
------------------------------ CREATE, ALTER, DROP -----------------------------
-------------------------------- GRUPO DOCUMENTO -------------------------------
--------------------------------------------------------------------------------
create table tb_documento(
	id_documento				number(18,0)		not null		constraint pk_documento primary key,
	tx_numero					varchar2(30)		not null,		--333333333/33333333333
	tx_fls						varchar2(30)		null,			--Folhas da certidao de nascimento	
	tx_lv						varchar2(30)		null,			--Livro da certidao de nascimento
	dt_emissao					date				null,
	dt_validade					date				null,
	id_documento_tipo			number(18,0)		not null
);

create table tb_documento_tipo(
	id_documento_tipo					number(18,0)		not null		constraint pk_documento_tipo primary key,
	tx_documento_tipo					varchar2(200)		not null		--RG/CPF/CNPJ/PIS
);

create table tb_documento_campos(
	id_documento_campos 			number(18,0)		not null		constraint pk_documento_campos primary key,
	tx_orgao_emissor				varchar2(200)		not null		--Orgao Emissor
);

-- SEQUENCE
create sequence crm.sq_documento 					increment by 1 start with 100;
create sequence crm.sq_documento_tipo 			increment by 1 start with 100;
create sequence crm.sq_documento_campos 			increment by 1 start with 100;

-- FOREIGN KEY
alter table tb_documento add constraint fk_documento		foreign key(id_documento_tipo) 		references tb_documento_tipo(id_documento_tipo);

--------------------------------------------------------------------------------
--------------------------- Data Definition Language ---------------------------
-------------------------------------- DDL -------------------------------------
------------------------------ CREATE, ALTER, DROP -----------------------------
------------------------------GRUPO ALUNO/DOCUMENTO ----------------------------
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------- Data Definition Language ---------------------------
-------------------------------------- DDL -------------------------------------
------------------------------ CREATE, ALTER, DROP -----------------------------
------------------------------GRUPO TUTOR/DOCUMENTO ----------------------------
--------------------------------------------------------------------------------

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


 
