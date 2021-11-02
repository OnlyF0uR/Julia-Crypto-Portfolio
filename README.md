# Julia-Crypto-Portfolio
A simple CLI crypto portfolio writting in the beautiful Julia language.

### SQLite
Create a file called: crypto.sqlite and execute the following statements:
```
CREATE TABLE "portfolios" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL UNIQUE,
	"transactions"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
)

CREATE TABLE "prices" (
	"name"	TEXT NOT NULL,
	"last_price"	NUMERIC NOT NULL,
	"date"	NUMERIC NOT NULL,
	PRIMARY KEY("name")
)
```