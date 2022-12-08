import psycopg2

try:
    conn = psycopg2.connect(host="localhost", database="pythontest_db",
                            user="docker", password="docker")
except Exception as e:
    print(e)
    exit(0)


if conn is not None:
    print('Connection established to PostgreSQL.')

    cur = conn.cursor()

    cur.execute('SELECT * from DOCUMENT_TEMPLATE limit 3;')

    get_all_data = cur.fetchall()

    print(get_all_data)

    conn.close()
else:
    print('Connection not established to PostgreSQL.')
