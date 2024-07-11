import oracledb
import getpass

userpwd = getpass.getpass("Enter password: ")
connection = oracledb.connect(user="rezwana", password=userpwd, host="pythia.etsu.edu",
                              port=1521, sid="CSDB")

cursor = connection.cursor()
#for row in cursor.execute("select * from HR.Employees"):
    #print(row)


def q1():
    f = open("hr_queries.sql", "r")
    sqlfile = f.read()
    f.close()

    sqlcommands = sqlfile.split(";")
    #print(sqlcommands)

    dict = {}

    for command in sqlcommands:
        try:
            for row in cursor.execute(command).fetchone():
                print(row)
            #rows= cursor.fetchall()
            
        except:
            print("Command failed")
q1()
cursor.close()