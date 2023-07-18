postgresinit:
	docker run --name duochat-db -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=password -d postgres

postgres:
	docker exec -it duochat-db psql

createdb:
	docker exec -it duochat-db createdb --username=root --owner=root duochat

dropdb:
	docker exec -it duochat-db dropdb duochat

migrateup:
	migrate -path db/migrations -database "postgresql://root:password@localhost:5432/duochat?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migrations -database "postgresql://root:password@localhost:5432/duochat?sslmode=disable" -verbose down

.PHONY: postgresinit postgres createdb dropdb migrateup migratedown