import psycopg2

# Connect to the database
conn = psycopg2.connect(
    host="localhost",
    database="postgres",
    user="postgres",
    password="Arulraj_1234"
)


try:
    with conn:
        with conn.cursor() as cur:
            # Call the stored procedure
            cur.execute("CALL reload_user_order_totals()")
            print("Procedure executed successfully.")
            
finally:
    conn.close()
