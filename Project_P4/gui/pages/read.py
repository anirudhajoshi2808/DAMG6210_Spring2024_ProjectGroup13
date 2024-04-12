import streamlit as st
import pandas as pd
from app import conn, get_tables

def fetch_data(conn, table_name):
    cursor = conn.cursor()
    cursor.execute(f"SELECT * FROM {table_name}")
    columns = [desc[0] for desc in cursor.description]
    data = cursor.fetchall()
    return pd.DataFrame(data, columns=columns)

st.header("Read Records")
tables = get_tables(conn)
selected_table = st.selectbox('Select a table to view:', tables)

if selected_table:
    df = fetch_data(conn, selected_table)
    st.dataframe(df)
