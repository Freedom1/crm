
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
    dt_create                     		date             not null,--Data de Criacao
    dt_update                     		date             not null,--Data de Atualizacao
    in_ativo                     		char(1)          default 'N' not null,
    id_pessoa                    		number(18,0)     not null--fk(gp)
);

-- PRIMARY KEY
alter table tb_aluno                 	add constraint pk_aluno                 primary key(id_aluno);

-- SEQUENCE
create sequence crm.sq_aluno            increment by 1 start with 100;

-- FOREIGN KEY
alter table tb_aluno add constraint fk_aluno_pessoa foreign key(id_pessoa) references tb_pessoa(id_pessoa);



spool off
exit
