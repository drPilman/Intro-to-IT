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
            username = request.form.get('username').strip()
            password = request.form.get('password')
            if username:
                cursor.execute(f"SELECT * FROM users WHERE login = '{username}' AND password = '{password}';")
                records = list(cursor.fetchall())
                if records:
                    return render_template('account.html', data=records[0])
        elif request.form.get("registration"):
            return redirect("/registration/")

    return render_template('login.html', error=request.method == 'POST')


@app.route('/registration/', methods=['POST', 'GET'])
def registration():
    error = None
    if request.method == 'POST':
        name = request.form.get('name').strip()
        username = request.form.get('login').strip()
        password = request.form.get('password')
        if not (name and username and password):
            error = "Вы ввели не все данные."
        elif not (username.islower() and username.isascii()):
            error = "Логин должен быть в нижнем регистре и включать в себя только символы ASCII"
        elif not password.isascii():
            error = "Пароль должен включать в себя только символы ASCII"
        else:
            cursor.execute(f"SELECT * FROM users WHERE login = '{username}';")
            records = list(cursor.fetchall())
            if records:
                error = "Данный логин уже занят."
            else:
                cursor.execute(f"INSERT INTO users (full_name, login, password) VALUES ('{name}', '{username}', '{password}');")
                conn.commit()
                return redirect('/login/')
    return render_template('registration.html', error=error)


@app.route('/')
def index():
    return redirect("/login/")
