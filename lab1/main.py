from flask import Flask, render_template, request
from translate import get

app = Flask(__name__)


@app.route("/", methods=["post", "get"])
def process():
    return render_template('index.html',
                           data=get(request.form.get('textarea', ''),
                                    request.form.get('action', '')))


if __name__ == "__main__":
    app.run(debug=True)
