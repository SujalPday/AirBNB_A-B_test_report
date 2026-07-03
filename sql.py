import sqlite3

con = sqlite3.connect('sql.db')

c = con.cursor()

c.execute("""CREATE TABLE instant_booking()

""")