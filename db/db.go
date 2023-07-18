package db

import (
	"database/sql"

	_ "github.com/lib/pq"
)

type Database struct {
	Db *sql.DB
}

func NewDatabase() (*Database, error) {
	db, err := sql.Open("postgres", "postgresql://root:password@localhost:5432/duochat?sslmode=disable")

	if err != nil {
		return nil, err
	}

	return &Database{Db: db}, nil
}

func (d *Database) Close() {
	d.Db.Close()
}

func (d *Database) GetDB() *sql.DB {
	return d.Db
}
