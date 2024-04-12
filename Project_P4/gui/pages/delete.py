import streamlit as st
from app import conn, get_tables

def delete_record(conn, table_name, condition_column, condition_value):
    sql = f"DELETE FROM {table_name} WHERE {condition_column} = %s"
    cursor = conn.cursor()
    cursor.execute(sql, (condition_value,))
    conn.commit()

st.header("Delete Record")
tables = get_tables(conn)
selected_table = st.selectbox('Select a table to delete from:', tables)

if selected_table:
    condition_column = st.text_input("Column to match for deletion")
    condition_value = st.text_input("Value to match")
    if st.button("Delete"):
        delete_record(conn, selected_table, condition_column, condition_value)
        st.success("Record deleted successfully!")
