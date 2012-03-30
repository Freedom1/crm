spool logs\ddl.telefone.txt

connect crm/crm

--------------------------------------------------------------------------------
--------------------------- Data Definition Language ---------------------------
-------------------------------------- DDL -------------------------------------
------------------------------ CREATE, ALTER, DROP -----------------------------
-------------------------------- GRUPO TELEFONE --------------------------------
--------------------------------------------------------------------------------
create table tb_telefone(
    id_telefone                    	number(18,0)     	not null         constraint pk_telefone primary key,
    tx_telefone                    	varchar2(200)     	not null,--numero do telefone
    tx_observacao                	varchar2(200)     	not null,--observacao como recado
    in_preferencial               	char(1)         	not null,--informa se o telefone é preferencial para receber ligacoes 
    id_telefone_tipo            	number(18,0)     	not null,--fk(rg)
    id_pessoa                    	number(18,0)     	not null--fk
);

create table tb_telefone_tipo(
    id_telefone_tipo            	number(18,0)     	not null         constraint pk_telefone_tipo primary key,
    tx_telefone_tipo            	varchar2(200)     	not null--Residencial/Trabalho/Celular/Recado
);

-- SEQUENCE
create sequence crm.sq_telefone                 increment by 1 start with 100;
create sequence crm.sq_telefone_tipo            increment by 1 start with 100;

alter table tb_telefone  add constraint fk_telefone_tipo	foreign key(id_telefone_tipo)		references tb_telefone_tipo(id_telefone_tipo);

spool off
exit