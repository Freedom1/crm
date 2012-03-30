
spool logs\ddl.inscricao.txt

connect crm/crm

--------------------------------------------------------------------------------
--------------------------- Data Definition Language ---------------------------
-------------------------------------- DDL -------------------------------------
------------------------------ CREATE, ALTER, DROP -----------------------------
-------------------------------- GRUPO INSCRICAO -------------------------------
--------------------------------------------------------------------------------
create table tb_inscricao(
    id_inscricao                 number(18,0)     not null         constraint pk_inscricao primary key,
    dt_create                     date             not null,--Data do Cadastro
    dt_update                     date             not null,--Data de Atualizacao
    id_pessoa                    number(18,0)     not null,--fk
    id_inscricao_situacao        number(18,0)     not null,--fk
    id_funcionario                number(18,0)     not null,--fk
    id_serie                    number(18,0)     not null --fk
);

create table tb_inscricao_situacao(
    id_inscricao_situacao         number(18,0)     not null         constraint pk_inscricao_situacao primary key,
    tx_inscricao_situacao         varchar2(200)     not null--Lista de Espera/Não admitida/Admitida
);

spool off
exit