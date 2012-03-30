spool ddl.documento.txt

connect crm/crm

--------------------------------------------------------------------------------
--------------------------- Data Definition Language ---------------------------
-------------------------------------- DDL -------------------------------------
------------------------------ CREATE, ALTER, DROP -----------------------------
-------------------------------- GRUPO DOCUMENTO -------------------------------
--------------------------------------------------------------------------------
create table tb_documento(
	id_documento				number(18,0)		not null		constraint pk_documento primary key,
	tx_numero					varchar2(30)		not null,		--333333333/33333333333
	tx_fls						varchar2(30)		null,			--Folhas da certidao de nascimento	
	tx_lv						varchar2(30)		null,			--Livro da certidao de nascimento
	dt_emissao					date				null,
	dt_validade					date				null,
	id_documento_tipo			number(18,0)		not null
);

create table tb_documento_tipo(
	id_documento_tipo					number(18,0)		not null		constraint pk_documento_tipo primary key,
	tx_documento_tipo					varchar2(200)		not null		--RG/CPF/CNPJ/PIS
);

-- SEQUENCE
create sequence crm.sq_documento 					increment by 1 start with 100;
create sequence crm.sq_documento_tipo 				increment by 1 start with 100;

-- FOREIGN KEY
alter table tb_documento add constraint fk_documento		foreign key(id_documento_tipo) 		references tb_documento_tipo(id_documento_tipo);

--------------------------------------------------------------------------------
--------------------------- Data Definition Language ---------------------------
-------------------------------------- DDL -------------------------------------
------------------------------ CREATE, ALTER, DROP -----------------------------
------------------------------GRUPO ALUNO/DOCUMENTO ----------------------------
--------------------------------------------------------------------------------
alter table tb_aluno add constraint fk_aluno_documento foreign key(id_documento) references tb_documento(id_documento);

--------------------------------------------------------------------------------
--------------------------- Data Definition Language ---------------------------
-------------------------------------- DDL -------------------------------------
------------------------------ CREATE, ALTER, DROP -----------------------------
------------------------------GRUPO TUTOR/DOCUMENTO ----------------------------
--------------------------------------------------------------------------------

spool off
exit