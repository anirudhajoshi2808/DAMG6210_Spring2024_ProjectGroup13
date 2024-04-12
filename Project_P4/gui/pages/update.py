import streamlit as st
import pymssql
import pandas as pd
import os
from dotenv import load_dotenv


load_dotenv()

# Placeholder functions for database operations (Assume they exist)



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


def get_table_data(conn, table_name):
    cursor = conn.cursor()
    cursor.execute(f"SELECT * FROM {table_name}")
    columns = [desc[0] for desc in cursor.description]
    data = cursor.fetchall()
    return pd.DataFrame(data, columns=columns)
    # This function fetches data from the given table
    


def update_record(conn, table_name, conditions, updates):
    cursor = conn.cursor()
    set_clause = ', '.join([f"{key} = %s" for key in updates.keys()])
    condition_clause = ' AND '.join([f"{key} = %s" for key in conditions.keys()])
    sql = f"UPDATE {table_name} SET {set_clause} WHERE {condition_clause}"
    try:
        cursor.execute(sql, list(updates.values()) + list(conditions.values()))
        conn.commit()
        return "Record updated successfully!"
    except Exception as e:
        return str(e)
    finally:
        cursor.close()

def app():
    conn = get_connection()
    if conn:
        tables = get_tables(conn)
        selected_table = st.selectbox('Select a table to update:', tables)

        if selected_table:
            df = get_table_data(conn, selected_table)
            st.dataframe(df)

            # Dynamically create form fields based on column names
            columns = df.columns.tolist()
            update_data = {}
            condition_data = {}

            with st.form(key="update_form"):
                st.write("Update Record")
                for column in columns:
                    update_data[column] = st.text_input(f"New value for {column} (leave blank if no change):", key=f"new_{column}")
                
                condition_column = st.selectbox("Condition column (where to apply the update):", columns)
                condition_value = st.text_input("Condition value (which record to update):")
                
                submit_button = st.form_submit_button("Update Record")

            if submit_button:
                # Filter out columns not being updated
                updates = {col: val for col, val in update_data.items() if val}
                conditions = {condition_column: condition_value}
                
                if updates and conditions:
                    update_message = update_record(conn, selected_table, conditions, updates)
                    st.success(update_message)
                else:
                    st.error("Please fill in at least one field to update and condition.")

# Call the app function to enable the page
if __name__ == "__main__":
    app()
