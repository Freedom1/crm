
spool logs\ddl.pessoa.txt

connect crm/crm

--------------------------------------------------------------------------------
--------------------------- Data Definition Language ---------------------------
-------------------------------------- DDL -------------------------------------
------------------------------ CREATE, ALTER, DROP -----------------------------
--------------------------------- GRUPO PESSOA ---------------------------------
--------------------------------------------------------------------------------
create table tb_pessoa(
    id_pessoa                    number(18,0)     not null        constraint pk_pessoa primary key,
    tx_nome                    	 varchar2(100)    not null,
    in_sexo             		 char(1)          null,
    tx_email                     varchar2(200)    null,
    id_estado                    number(18,0)     null,--Natural/Nacionalidade
    in_tipo                      char(1)          not null --Fisica/Juridica
);

-- CHECK
alter table tb_pessoa add constraint ck_pessoa_sexo check(in_sexo in('M','F'));
-- M = MASCULINO
-- F = FEMININO


spool off
exit