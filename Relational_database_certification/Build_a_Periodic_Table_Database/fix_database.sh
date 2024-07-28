#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

#You should rename the weight column to atomic_mass
RENAME_WEIGHT_COLUMN=$($PSQL "ALTER TABLE properties RENAME COLUMN weight TO atomic_mass;")
echo "$RENAME_WEIGHT_COLUMN"

#You should rename the melting_point column to melting_point_celsius and the boiling_point column to boiling_point_celsius
RENAME_MELTING_POINT_COLUMN=$($PSQL "ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;")
RENAME_BOILING_POINT_COLUMN=$($PSQL "ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;")
echo "$RENAME_MELTING_POINT_COLUMN"
echo "$RENAME_BOILING_POINT_COLUMN"

#Your melting_point_celsius and boiling_point_celsius columns should not accept null values
ALTER_PROPERTIES_MELTING_POINT_CELSIUS_NOT_NULL=$($PSQL"ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;")
ALTER_PROPERTIES_BOILING_POINT_CELSIUS_NOT_NULL=$($PSQL "ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;")
echo "$ALTER_PROPERTIES_MELTING_POINT_CELSIUS_NOT_NULL"
echo "$ALTER_PROPERTIES_BOILING_POINT_CELSIUS_NOT_NULL"

#You should add the UNIQUE constraint to the symbol and name columns from the elements table
ALTER_ELEMENTS_SYMBOL_UNIQUE=$($PSQL "ALTER TABLE elements ADD CONSTRAINT symbol_unique UNIQUE(symbol);")
ALTER_ELEMENTS_NAME_UNIQUE=$($PSQL "ALTER TABLE elements ADD CONSTRAINT name_unique UNIQUE(name);")
echo "$ALTER_ELEMENTS_SYMBOL_UNIQUE"
echo "$ALTER_ELEMENTS_NAME_UNIQUE"

#Your symbol and name columns should have the NOT NULL constraint
ALTER_ELEMENTS_SYMBOL_NOT_NULL=$($PSQL"ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;")
ALTER_ELEMENTS_NAME_NOT_NULL=$($PSQL "ALTER TABLE elements ALTER COLUMN name SET NOT NULL;")
echo "$ALTER_ELEMENTS_SYMBOL_NOT_NULL"
echo "$ALTER_ELEMENTS_NAME_NOT_NULL"

#You should set the atomic_number column from the properties table as a foreign key that references the column of the same name in the elements table
SET_PROPERTIES_ATOMIC_NUMBER_FK=$($PSQL "ALTER TABLE properties ADD FOREIGN KEY(atomic_number) REFERENCES elements(atomic_number);")
echo "$SET_PROPERTIES_ATOMIC_NUMBER_FK"

#You should create a types table that will store the three types of elements
CREATE_TABLE_TYPES=$($PSQL "CREATE TABLE types();")
echo "$SET_PROPERTIES_ATOMIC_NUMBER_FK"

#Your types table should have a type_id column that is an integer and the primary key
TYPE_ID=$($PSQL "ALTER TABLE types ADD COLUMN type_id SERIAL PRIMARY KEY;")
echo "$TYPE_ID"

#Your types table should have a type column that's a VARCHAR and cannot be null. It will store the different types from the type column in the properties table
TYPE_COLUMN=$($PSQL "ALTER TABLE types ADD COLUMN type VARCHAR(30) NOT NULL;")
echo "$TYPE_COLUMN"

#You should add three rows to your types table whose values are the three different types from the properties table
INSERT_TYPES=$($PSQL "INSERT INTO types(type) VALUES ('metal'), ('metalloid'), ('nonmetal');")
echo "$INSERT_TYPES"

#Your properties table should have a type_id foreign key column that references the type_id column from the types table. It should be an INT with the NOT NULL constraint
#I had to insert without the NOT NULL because there is already data in the table
TYPE_ID_PROPERTIES_COLUMN=$($PSQL "ALTER TABLE properties ADD COLUMN type_id INT;")
echo "$TYPE_ID_PROPERTIES_COLUMN"

#Now I will fill the type_id column in the exitent data
UPDATE_TYPE_ID_PROPERTIES=$($PSQL "UPDATE properties SET type_id = (SELECT type_id FROM types WHERE types.type = properties.type);")
echo "$UPDATE_TYPE_ID_PROPERTIES"

#Adding the NOT NULL constraint in TYPE_ID from PROPERTIES TABLE
TYPE_ID_PROPERTIES_NOT_NULL=$($PSQL "ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;")

#Each row in your properties table should have a type_id value that links to the correct type from the types table
TYPE_ID_PROPERTIES_FK=$($PSQL "ALTER TABLE properties ADD FOREIGN KEY(type_id) REFERENCES types(type_id);")
echo "$TYPE_ID_PROPERTIES_FK"

#You should capitalize the first letter of all the symbol values in the elements table. Be careful to only capitalize the letter and not change any others
ELEMENTS_SYMBOL_CAPITAL=$($PSQL "UPDATE elements SET symbol=INITCAP(symbol);")
echo "$ELEMENTS_SYMBOL_CAPITAL"

#You should remove all the trailing zeros after the decimals from each row of the atomic_mass column. You may need to adjust a data type to DECIMAL for this. The final values they should be are in the atomic_mass.txt file
ALTER_PROPERTIES_ATOMIC_MASS=$($PSQL "ALTER TABLE PROPERTIES ALTER COLUMN atomic_mass TYPE VARCHAR(9);")
UPDATE_PROPERTIES_ATOMIC_MASS=$($PSQL"UPDATE properties SET atomic_mass=CAST(atomic_mass AS FLOAT);")
echo "$ALTER_PROPERTIES_ATOMIC_MASS"
echo "$UPDATE_PROPERTIES_ATOMIC_MASS"

#You should add the element with atomic number 9 to your database. Its name is Fluorine, symbol is F, mass is 18.998, melting point is -220, boiling point is -188.1, and it's a nonmetal
ADD_FLUORINE_ELEMENT=$($PSQL "INSERT INTO elements(atomic_number, symbol, name) VALUES(9, 'F', 'Fluorine');")
ADD_FLUORINE_PROPERTIES=$($PSQL "INSERT INTO properties(atomic_number, type, melting_point_celsius, boiling_point_celsius, type_id, atomic_mass) VALUES(9,'nonmetal',-220,-188.1,3,18.998);")
echo "$ADD_FLUORINE_ELEMENT"
echo "$ADD_FLUORINE_PROPERTIES"

# You should add the element with atomic number 10 to your database. Its name is Neon, symbol is Ne, mass is 20.18, melting point is -248.6, boiling point is -246.1, and it's a nonmetal
ADD_NEON_ELEMENT=$($PSQL "INSERT INTO elements(atomic_number, symbol, name) VALUES(10, 'Ne', 'Neon');")
ADD_NEON_PROPERTIES=$($PSQL "INSERT INTO properties(atomic_number, type, melting_point_celsius, boiling_point_celsius, type_id, atomic_mass) VALUES(10, 'nonmetal', -248.6, -246.1, 3, 20.18);")
echo "$ADD_NEON_ELEMENT"
echo "$ADD_NEON_PROPERTIES"

#You should delete the non existent element, whose atomic_number is 1000, from the two tables
DELETE_ATOMIC_NUMBER_1000_PROPERTIES=$($PSQL "DELETE FROM properties WHERE atomic_number=1000;")
DELETE_ATOMIC_NUMBER_1000_ELEMENTS=$($PSQL "DELETE FROM elements WHERE atomic_number=1000;")
echo "$DELETE_ATOMIC_NUMBER_1000_PROPERTIES"
echo "$ADD_NEON_PROPERTIES"


#Your properties table should not have a type column
DROP_TYPE_COLUMN_PROPERTIES=$($PSQL "ALTER TABLE properties DROP COLUMN type;")
echo "$DROP_TYPE_COLUMN_PROPERTIES"
