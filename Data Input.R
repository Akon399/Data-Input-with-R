# 4 May 2023.
# Input Data with R.
# Notes by Lecture Akhona Njeje.
# Excel, SQL & Webscrapping.

# Excel Files & Install packages readxl.
install.packages('readxl')
library(readxl)

excel_sheets(Data.xlsx)
df = read_excel('Data.xlsx',sheet = 'Sheet1')
head(df)   # First five Rows

sum(df$Column_name)   # Sum function helps you get the sum of the column.
summary(df)   # Helps you get the Statistics of your Data.

# Writing on Excel files.

install.packages('xlsx')   # We install this packages, so we can be able to write to excel files using R.
library(xlsx)

head(xlsx)
write.xlsx(mtcars, output_example.xlsx)

# SQL with R : GENERAL STRATEGY.
# MySQL,SQL server, Oracle etc require a different R package to connect to.
# To connect to any database you need the framework RODBC library.

install.packages("RODBC")   
library(RODBC)

myconnection = odbc("Database_Name", uid="UserID", pwd="password_for_that_database")
data = sqlFetch(myconnection, "Table_Name")
querydata = sqlQuery(myconnection, "SELECT * FROM Table")
close(myconnection)

# Example of connecting R to DYANMO_NoSQL Database.

install.packages('RDynamoSQL')
library(RDynamoSQL)

svc <- dynamodb(
  config = list(
    credentials = list(
      creds = list(
        access_key_id = "string",
        secret_access_key = "string",
        session_token = "string"
      ),
      profile = "string",
      anonymous = "logical"
    ),
    endpoint = "string",
    region = "string",
    close_connection = "logical",
    timeout = "numeric",
    s3_force_path_style = "logical"
  )
)

# Example of connecting R to Postgre Database.

install.packages("RPostgre")
require("RPostgre")

# Now lets create connection to the database.
password = {"new_user_password"}  

# Load the Postgre driver.
drv = dbDriver("Postgre")   # creates a connection to the postgre db.
coonection = dbConnect(drv, dbname='postgre',host="###", port="###",user="opening", password=password)

rm(password)   # removes pw.
dbExistsTable(connection, "carTable")   # True.



# Webscrapping 
# Knowledge of HTML & CSS helps here.
# For this task we need the Rvest library/framework.

demo(package = 'rvest')
install.packages('rvest')
library(rvest)

lego_movie = read_htm("http://www.legomovie.com/title/...")

# Now lets extract data from the webpage using pipes.

lego_movie %>%
  html_nodes("titleCast.itemprop span") %>%
  html_text()

lego_movie %>%
  htlml_nodes("table") %>%
  html_text()

lego_movie %>%
  html_nodes("table") %>%
  html_table()









