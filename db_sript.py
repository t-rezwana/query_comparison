import oracledb
import getpass

userpwd = getpass.getpass("Enter password: ")
connection = oracledb.connect(user="rezwana", password=userpwd, host="pythia.etsu.edu",
                              port=1521, sid="CSDB")

cursor = connection.cursor()
#for row in cursor.execute("select * from HR.Employees"):
    #print(row)


f = open("hr_queries.sql", "r")
sqlfile = f.read()
f.close()

sqlcommands = sqlfile.split(";")

for command in sqlcommands:
    try:
        cursor.execute(command)
        rows= cursor.fetchall()
        print(cursor.rowcount, "rows affected")
    except:
        print("Command failed")

cursor.close()