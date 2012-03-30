
spool ddl.funcionario.txt

connect crm/crm
--------------------------------------------------------------------------------
--------------------------- Data Definition Language ---------------------------
-------------------------------------- DDL -------------------------------------
------------------------------ CREATE, ALTER, DROP -----------------------------
------------------------------- GRUPO FUNCIONARIO ------------------------------
--------------------------------------------------------------------------------
create table tb_funcionario(
    id_funcionario                 number(18,0)     not null         constraint pk_funcionario primary key,
    dt_create                      date             not null,--Data do Cadastro
    dt_update                      date             not null,--Data de Atualizacao
    in_ativo                       char(1)          default 'N'     not null,
    id_pessoa                      number(18,0)     not null --fk
);

spool off
exit
