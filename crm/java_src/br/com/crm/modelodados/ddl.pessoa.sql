
spool logs\ddl.pessoa.txt

connect crm/crm

--------------------------------------------------------------------------------
--------------------------- Data Definition Language ---------------------------
-------------------------------------- DDL -------------------------------------
------------------------------ CREATE, ALTER, DROP -----------------------------
--------------------------------- GRUPO PESSOA ---------------------------------
--------------------------------------------------------------------------------
create table tb_pessoa(
    id_pessoa                    number(18,0)     not null        	constraint pk_pessoa primary key,
    tx_nome                    	 varchar2(100)    not null,--Nome
    in_sexo             		 char(1)          null,--M/F
    dt_nascimento                date             null,--Data de Nascimento é no aluno ou na pessoa?
    tx_email                     varchar2(200)    null,--email
    in_estado_civil              char(2)          null,--So/VI
    id_estado                    number(18,0)     null,--Natural/Nacionalidade
    in_tipo                      char(1)          not null --Fisica/Juridica
);

create table tb_pessoa_especial(
    id_pessoa_especial            		number(18,0)     not null	constraint pk_pessoa_especial primary key,--pk
    tx_observacao                		varchar2(200)    not null,--O aluno tem problema auditivo 50% de perca
    id_pessoa                     		number(18,0)     not null,--fk(gp)
    id_pessoa_especial_tipo        		number(18,0)     not null--fk
);

create table tb_pessoa_especial_tipo(
    id_pessoa_especial_tipo        		number(18,0)     not null	constraint pk_pessoa_especial_tipo primary key,--pk
    tx_pessoa_especial_tipo        		varchar2(200)    not null--Visual/Auditivo
);

-- SEQUENCE
create sequence crm.sq_pessoa			       increment by 1 start with 100;
create sequence crm.sq_pessoa_especial         increment by 1 start with 100;
create sequence crm.sq_pessoa_especial_tipo    increment by 1 start with 100;

-- FOREIGN KEY
alter table tb_pessoa_especial 	add constraint fk_pessoa_especial 		foreign key(id_pessoa) 				 references tb_pessoa(id_pessoa);
alter table tb_pessoa_especial 	add constraint fk_pessoa_especial_tipo 	foreign key(id_pessoa_especial_tipo) references tb_pessoa_especial_tipo(id_pessoa_especial_tipo);

-- CHECK
alter table tb_pessoa add constraint ck_pessoa_sexo check(in_sexo in('M','F'));
-- M = MASCULINO
-- F = FEMININO

alter table tb_pessoa add constraint ck_aluno_estado_civil check(in_estado_civil in('SO','VI','CA','DI','DE'));
-- CHECK - aluno: ESTADO CIVIL
-- SO = SOLTEIRO
-- VI = VIUVO
-- CA = CASADO
-- DI = DIVORCIADO
-- DE = DESQUITADO

spool off
exit