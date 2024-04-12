import streamlit as st
import pymssql
from dotenv import load_dotenv
import os

# Load environment variables
load_dotenv()



server = os.getenv('DB_SERVER')
username = os.getenv('DB_USER')
password = os.getenv('DB_PASSWORD')
database = os.getenv('DB_NAME')

# Function to establish a database connection
def get_connection():
    return pymssql.connect(server, username, password, database)

conn = get_connection()

# Function to fetch tables for the dropdown menu
def get_tables(conn):
    cursor = conn.cursor()
    cursor.execute("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE';")
    return [row[0] for row in cursor.fetchall()]

# Load pages
st.sidebar.title('Database Operations')
options = ["Create", "Read", "Update", "Delete"]
choice = st.sidebar.radio("Choose operation", options)

if choice == "Create":
    from pages import create
elif choice == "Read":
    from pages import read
elif choice == "Update":
    from pages import update
elif choice == "Delete":
    from pages import delete
