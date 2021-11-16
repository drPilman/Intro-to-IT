import psycopg2
from os import environ

conn = psycopg2.connect(database=environ["POSTGRES_DB"],
                        user=environ["POSTGRES_USER"],
                        password=environ["POSTGRES_PASSWORD"],
                        host=environ["URL_DB"],
                        port=environ["PORT_DB"])
cursor = conn.cursor()


def get_current_state(chat_id):
    cursor.execute(f"SELECT state FROM users WHERE chat_id = '{chat_id}';")
    state = cursor.fetchone()
    print(state, type(state))


def set_state(chat_id, state):
    try:
        cursor.execute(f"INSERT INTO users (chat_id, state) VALUES ('{chat_id}', '{state}');")
        conn.commit()
        return True
    except:
        return False
