from flask import Flask, render_template, request, redirect
import psycopg2
from os import environ

conn = psycopg2.connect(database=environ["POSTGRES_DB"],
                        user=environ["POSTGRES_USER"],
                        password=environ["POSTGRES_PASSWORD"],
                        host=environ["URL_DB"],
                        port=environ["PORT_DB"])
cursor = conn.cursor()
app = Flask(__name__)


@app.route('/login/', methods=['POST', 'GET'])
def login():
    if request.method == 'POST':
        if request.form.get("login"):
            username = request.form.get('username')
            password = request.form.get('password')
            cursor.execute(f"SELECT * FROM users WHERE login = '{username}' AND password = '{password}';")
            records = list(cursor.fetchall())
            if records:
                return render_template('account.html', full_name=records[0][1])
        elif request.form.get("registration"):
            return redirect("/registration/")

    return render_template('login.html')


@app.route('/registration/', methods=['POST', 'GET'])
def registration():
    if request.method == 'POST':
        name = request.form.get('name')
        login = request.form.get('login')
        password = request.form.get('password')
        cursor.execute(f"INSERT INTO users (full_name, login, password) VALUES ('{name}', '{login}', '{password}');")
        conn.commit()

        return redirect('/login/')
    return render_template('registration.html')


@app.route('/')
def index():
    return redirect("/login/")

