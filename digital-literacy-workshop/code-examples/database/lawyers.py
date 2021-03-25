import psycopg2

connection = psycopg2.connect(
    user="postgres",
    password="postgres",
    host="127.0.0.1",
    port="5432",
    database="postgres"
)

cursor = connection.cursor()
query = "select * from lawyers"

cursor.execute(query)
print("The number of lawyers: ", cursor.rowcount)

records = cursor.fetchall()

for row in records:
    print(row[1], row[2])
