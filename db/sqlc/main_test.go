package db

import (
	"context"
	"log"
	"os"
	"testing"

	"github.com/jackc/pgx/v5/pgxpool"
)

const (
	dbSource = "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable"
)

var testQueries *Queries

func TestMain(m *testing.M) {
	// Use pgxpool for better connection pooling
	conn, err := pgxpool.New(context.Background(), dbSource)
	if err != nil {
		log.Fatal("Cannot connect to DB:", err)
	}
	defer conn.Close()

	testQueries = New(conn) // Make sure New() accepts pgx.Conn or pgxpool.Pool

	os.Exit(m.Run())
}
