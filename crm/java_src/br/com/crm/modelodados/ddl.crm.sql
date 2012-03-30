spool logs\ddl.crm.txt

drop user crm cascade;

--Ao cria o usuario cria automaticamente o schema
-- Schema é um contanier de objetos
create user crm identified by crm;

-- DCL - Data Control Language
grant connect,resource to crm;

connect crm/crm

spool off
exit


 
