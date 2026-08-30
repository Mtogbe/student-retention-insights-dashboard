"""this script initializes duckDB, Loads all OULAD tables, and returns the count.
Enter the file path to each csv into the con.execute line"""
import duckdb 

con = duckdb.connect("oulad.duckdb")

con.execute("CREATE TABLE IF NOT EXISTS assessments AS SELECT * FROM read_csv('/path/to/assessments.csv')")#enter path to assessments csv
con.execute("CREATE TABLE IF NOT EXISTS courses AS SELECT * FROM read_csv('/path/to/courses.csv')")#enter path to courses csv
con.execute("CREATE TABLE IF NOT EXISTS studentAssessment AS SELECT * FROM read_csv('/path/to/studentAssessment.csv')")#enter path to studentAssessment csv
con.execute("CREATE TABLE IF NOT EXISTS studentInfo AS SELECT * FROM read_csv('/path/to/studentInfo.csv')")#enter path to studentInfo csv
con.execute("CREATE TABLE IF NOT EXISTS studentRegistration AS SELECT * FROM read_csv('/path/to/studentRegistration.csv')")#enter path to studentRegistration csv
con.execute("CREATE TABLE IF NOT EXISTS studentVle AS SELECT * FROM read_csv('/path/to/studentVle.csv')")#enter path to studentVle csv
con.execute("CREATE TABLE IF NOT EXISTS vle AS SELECT * FROM read_csv('/path/to/vle.csv')")#enter path to vle csv

print(con.execute("SELECT COUNT(*) FROM assessments").fetchdf()) 
print(con.execute("SELECT COUNT(*) FROM courses").fetchdf())
print(con.execute("SELECT COUNT(*) FROM studentAssessment").fetchdf())
print(con.execute("SELECT COUNT(*) FROM studentInfo").fetchdf())
print(con.execute("SELECT COUNT(*) FROM studentRegistration").fetchdf())
print(con.execute("SELECT COUNT(*) FROM studentVle").fetchdf())
print(con.execute("SELECT COUNT(*) FROM vle").fetchdf())