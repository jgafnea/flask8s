import requests
from flask import Flask

app = Flask(__name__)


@app.route("/")
def joke():
    url = "https://icanhazdadjoke.com/"
    resp = requests.get(url=url, headers=dict(Accept="application/json"))
    joke = resp.json().get("joke")
    return joke


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port="5000")
