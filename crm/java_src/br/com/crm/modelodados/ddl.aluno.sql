
spool logs\ddl.aluno.txt

connect crm/crm
--------------------------------------------------------------------------------
--------------------------- Data Definition Language ---------------------------
-------------------------------------- DDL -------------------------------------
------------------------------ CREATE, ALTER, DROP -----------------------------
---------------------------------- GRUPO ALUNO ---------------------------------
--------------------------------------------------------------------------------
create table tb_aluno(
    id_aluno                    		number(18,0)     not null,--pk
    id_pessoa                    		number(18,0)     not null,--fk
    dt_create                     		date             not null,
    dt_update                     		date             not null,
    dt_nascimento                 		date             not null,
    in_estado_civil             		char(2)          not null,
    in_ativo                     		char(1)          default 'N' not null
);

create table tb_aluno_especial(
    id_aluno_especial            		number(18,0)     not null,--pk
    tx_observacao                		varchar2(200)    not null,
    id_aluno                     		number(18,0)     not null,
    id_aluno_especial_tipo        		number(18,0)     not null
);

create table tb_aluno_especial_tipo(
    id_aluno_especial_tipo        		number(18,0)     not null,--pk
    tx_aluno_especial_tipo        		varchar2(200)    not null--Visual/Auditivo
);

-- PRIMARY KEY
alter table tb_aluno                 	add constraint pk_aluno                 primary key(id_aluno);
alter table tb_aluno_especial         	add constraint pk_aluno_especial        primary key(id_aluno_especial);
alter table tb_aluno_especial_tipo    	add constraint pk_aluno_especial_tipo   primary key(id_aluno_especial_tipo);

-- SEQUENCE
create sequence crm.sq_aluno                 increment by 1 start with 100;
create sequence crm.sq_aluno_especial         increment by 1 start with 100;
create sequence crm.sq_aluno_especial_tipo    increment by 1 start with 100;

alter table tb_aluno add constraint ck_aluno_estado_civil check(in_estado_civil in('SO','VI','CA','DI','DE'));
-- CHECK - aluno: ESTADO CIVIL
-- SO = SOLTEIRO
-- VI = VIUVO
-- CA = CASADO
-- DI = DIVORCIADO
-- DE = DESQUITADO

spool off
exit
