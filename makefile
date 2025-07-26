DB_HOST=db
DB_NAME=postgres
DB_USER=admin
DB_PASS=admin

SQL_DIR=databases/sakila

load-schema:
	@echo "📜 Cargando estructura (schema)..."
	PGPASSWORD=$(DB_PASS) psql -h $(DB_HOST) -U $(DB_USER) -d $(DB_NAME) -v ON_ERROR_STOP=1 -f $(SQL_DIR)/1-postgres-sakila-schema.sql

load-data:
	@echo "📦 Cargando datos..."
	PGPASSWORD=$(DB_PASS) psql -h $(DB_HOST) -U $(DB_USER) -d $(DB_NAME) -v ON_ERROR_STOP=1 -f $(SQL_DIR)/2-postgres-sakila-data.sql

load: load-schema load-data
