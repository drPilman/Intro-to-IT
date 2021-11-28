from flask import Flask, render_template, request
from translate import get

app = Flask(__name__)


def parseform():
    return request.form.get("textarea", ""), request.form.get("action", "")


@app.route("/", methods=["post", "get"])
def process():
    return render_template("index.html", data=get(*parseform()))


@app.route("/api", methods=["post"])
def api():
    return get(*parseform())
