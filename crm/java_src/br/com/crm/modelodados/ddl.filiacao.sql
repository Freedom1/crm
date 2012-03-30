
spool logs\ddl.filiacao.txt

connect crm/crm
--------------------------------------------------------------------------------
--------------------------- Data Definition Language ---------------------------
-------------------------------------- DDL -------------------------------------
------------------------------ CREATE, ALTER, DROP -----------------------------
-------------------------------- GRUPO FILIACAO --------------------------------
--------------------------------------------------------------------------------
create table tb_tutor(
    id_tutor                     number(18,0)     not null,
    tx_tutor                     varchar(20)      not null --Pai/Mae/Padrastro
);

create table tb_filiacao(
    id_filiacao                  number(18,0)     not null,
    id_pessoa                    number(18,0)     not null,--fk(rl) - Filho
    id_tutor                     number(18,0)     not null --fk(gp) - Tutor(pai/mae e etc)
);

-- PRIMARY KEY
alter table tb_filiacao add constraint pk_filiacao primary key(id_filiacao);
alter table tb_tutor add constraint pk_tutor primary key(id_tutor);

-- FOREIGN KEY
alter table tb_filiacao add constraint fk_filiacao_tutor foreign key(id_tutor) references tb_tutor(id_tutor);

-- SEQUENCE
-- Importante saber que uma sequence pode ser usado para mais de uma tabela.
create sequence crm.sq_filiacao increment by 1 start with 100;
create sequence crm.sq_tutor increment by 1 start with 100;

-- Exemplo
create sequence crm.sq_bozo increment by 1 start with 100;
--deleta a sequence - nao funciona o delete somente drop
drop sequence crm.sq_bozo;

spool off
exit