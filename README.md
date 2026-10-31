# Pet Adoption Management System (MySQL)

A MySQL database for a pet adoption centre. It stores pets and adopters and records which pet was adopted by whom, and on what date. The queries go from creating tables up to joins.

- 📄 **[PetFinalMySQL.pdf](PetFinalMySQL.pdf)**: the full project report, with the ER diagram and a screenshot of every query and its result
- 🗂️ **[pet_adoption.sql](pet_adoption.sql)**: every query from the report in one script you can run

## Database design

Database: `Finalpro`

| Table | Columns | Keys and rules |
|---|---|---|
| **Pets** | PetID, PetName, PetType, Age | PetID primary key · name and type NOT NULL · `CHECK(Age>0)` |
| **Adopters** | AdopterID, AdopterName, Email, City | AdopterID primary key · Email UNIQUE · name and city NOT NULL |
| **Adoption** | AdoptionID, PetID, AdopterID, AdoptionDate | AdoptionID primary key · PetID → Pets · AdopterID → Adopters |

One pet can have many adoption records, and so can one adopter. The **Adoption** table links the two.

## What the queries cover

| Topic | Examples |
|---|---|
| Creating the database | `CREATE DATABASE`, `CREATE TABLE`, `DESC` |
| Constraints | `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`, `CHECK` |
| Adding and changing data | `INSERT`, `UPDATE`, `DELETE` |
| Filtering | `WHERE` with `AND` / `OR`, `LIKE 'P%'`, `BETWEEN`, `IN` |
| Sorting and unique values | `ORDER BY` (ascending and `DESC`), `DISTINCT` |
| Aggregate functions | `COUNT(*)`, `MAX`, `MIN`, `AVG` |
| Changing a table | `ALTER TABLE ... ADD`, `MODIFY`, `DROP COLUMN` |
| Joins | `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN` across all three tables |

Example: which pet went to which adopter, and when.

```sql
SELECT Pets.PetName, Adopters.AdopterName, Adoption.AdoptionDate
FROM Adoption
INNER JOIN Pets ON Adoption.PetID = Pets.PetID
INNER JOIN Adopters ON Adoption.AdopterID = Adopters.AdopterID;
```

## Run it

Open `pet_adoption.sql` in MySQL Workbench and run it, or from a terminal:

```bash
mysql -u root -p < pet_adoption.sql
```

## Author

Vineetsing Girase · [GitHub](https://github.com/Vineetsing9019)
