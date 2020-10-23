# Version 1.0
# Por lo general no se requiere modificar el fichero

export PGDATABASE:=classicmodels
export PGUSER :=alumnodb
export PGPASSWORD :=alumnodb
export PGCLIENTENCODING:=LATIN9
export PGHOST:=localhost

DBNAME =$(PGDATABASE)
PSQL = psql
CREATEDB = createdb
DROPDB = dropdb --if-exists
PG_DUMP = pg_dump
PG_RESTORE = pg_restore

all: dropdb createdb restore shell
createdb:
	@echo Creando BBDD
	@$(CREATEDB)
dropdb:
	@echo Eliminando BBDD
	@$(DROPDB) $(DBNAME)
	rm -f *.log
dump:
	@echo creando dumpfile
	@$(PG_DUMP) > $(DBNAME).sql
restore:
	@echo restore data base
	@cat $(DBNAME).sql | $(PSQL)  
psql: shell
shell:
	@echo create psql shell
	@$(PSQL)  

allqueries: query1 query2 query3 query4 query5 query6
	@cat query?.log > all_queries.log

query1:
	@echo query-1: "Cantidad total de dinero abonado" | tee query1.log
	@cat query1.sql | $(PSQL) | tee -a query1.log
query2:
	@echo query-2: "Tiempo medio transcurrido" | tee query2.log
	@cat query2.sql | $(PSQL) | tee -a query2.log
query3:
	@echo query3: "Empleados que reportar a otro empleado" | tee query3.log
	@cat query3.sql | $(PSQL) | tee -a query3.log
query4:
	@echo query4: "Oficina que ha vendido el mayor numero de objetos" | tee query4.log
	@cat query4.sql | $(PSQL) | tee -a query4.log
query5:
	@echo query5: "Paíes que no han vendido nada en 2003" | tee query5.log
	@cat query5.sql | $(PSQL) | tee -a query5.log
query6:
	@echo query6: "Elementos del carro de la compra" | tee query6.log
	@cat query6.sql | $(PSQL) | tee -a query6.log
