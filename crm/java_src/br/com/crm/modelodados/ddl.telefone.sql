spool ddl.telefone.txt

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
    id_pessoa                    	number(18,0)     	not null,--fk
    id_telefone_tipo            	number(18,0)     	not null--fk
);

create table tb_telefone_tipo(
    id_telefone_tipo            	number(18,0)     	not null         constraint pk_telefone_tipo primary key,
    tx_telefone_tipo            	varchar2(200)     	not null--Residencial/Trabalho/Celular/Recado
);

spool off
exit