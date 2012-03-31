spool logs\ddl.serie.txt

connect crm/crm

--------------------------------------------------------------------------------
--------------------------- Data Definition Language ---------------------------
-------------------------------------- DDL -------------------------------------
------------------------------ CREATE, ALTER, DROP -----------------------------
---------------------------------- GRUPO SERIE ---------------------------------
--------------------------------------------------------------------------------

create table tb_serie(
    id_serie                    number(18,0)		not null         constraint pk_serie primary key,
    tx_serie                    varchar2(200)     	not null,--2° ano/3° ano/9° ano
    id_tipo_ensino              number(18,0)     	not null--fk
);

create table tb_tipo_ensino(
    id_tipo_ensino                number(18,0)    	not null         constraint pk_tipo_ensino primary key,
    tx_tipo_ensino                varchar2(200)     not null--Educação infantil/Ensino fundamental/Ensino médio/
);

-- SEQUENCE
create sequence crm.sq_serie			       increment by 1 start with 100;
create sequence crm.tipo_ensino			       increment by 1 start with 100;

spool off
exit