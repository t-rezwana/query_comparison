import oracledb
import getpass

userpwd = getpass.getpass("Enter password: ")
connection = oracledb.connect(user="rezwana", password=userpwd, host="pythia.etsu.edu",
                              port=1521, service_name="CSDB")

