import streamlit as st
from app import conn, get_tables

def insert_record(conn, table_name, values):
    # Placeholder SQL - adjust columns as necessary
    sql = f"INSERT INTO {table_name} (Column1, Column2) VALUES (%s, %s)"
    cursor = conn.cursor()
    cursor.execute(sql, values)
    conn.commit()

st.header("Create Record")
tables = get_tables(conn)
selected_table = st.selectbox('Select a table to insert into:', tables)

if selected_table:
    # Define fields based on table structure
    col1 = st.text_input("Column 1")
    col2 = st.text_input("Column 2")
    if st.button("Insert"):
        insert_record(conn, selected_table, (col1, col2))
        st.success("Record inserted successfully!")
