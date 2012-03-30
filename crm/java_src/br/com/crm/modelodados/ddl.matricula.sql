
spool logs\ddl.matricula.txt

connect crm/crm

--------------------------------------------------------------------------------
--------------------------- Data Definition Language ---------------------------
-------------------------------------- DDL -------------------------------------
------------------------------ CREATE, ALTER, DROP -----------------------------
-------------------------------- GRUPO MATRICULA -------------------------------
--------------------------------------------------------------------------------
create table tb_matricula(
    id_matricula                 number(18,0)     not null         constraint pk_matricula primary key,
    dt_create                     date             not null,--Data do Cadastro
    dt_update                     date             not null,--Data de Atualizacao
    id_matricula_situacao        number(18,0)     not null,--fk(gp)
    id_aluno                    number(18,0)     not null,--fk(rl)
    id_funcionario                number(18,0)     not null --fk
);

create table tb_matricula_situacao(
    id_matricula_situacao         number(18,0)     not null         constraint pk_matricula_situacao primary key,
    tx_matricula_situacao         varchar2(200)     not null --Aguardando Renovação/Matriculado/Não Renovado - Prazo Encerrado
);

-- SEQUENCE
create sequence crm.sq_matricula             increment by 1 start with 100;
create sequence crm.sq_matricula_situacao     increment by 1 start with 100;

-- FOREIGN KEY
alter table tb_matricula add constraint fk_matricula_situacao foreign key(id_matricula_situacao) references tb_matricula_situacao(id_matricula_situacao);


spool off
exit
