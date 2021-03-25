import psycopg2

connection = psycopg2.connect(
    user="postgres",
    password="postgres",
    host="127.0.0.1",
    port="5432",
    database="postgres"
)

cursor = connection.cursor()
query = """
    select * from lawyers as l
    inner join lawyer_has_practice_area as lp
        on l.id = lp.lawyer_id
    inner join practice_areas as p
        on lp.practice_area_id = p.id
"""

cursor.execute(query)
records = cursor.fetchall()

for row in records:
    if row[7] is None:
        print(row[1], row[2], "practices", row[9], "since", row[6])
