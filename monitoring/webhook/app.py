from flask import Flask, request
import requests
import os

app = Flask(__name__)

GITHUB_TOKEN = os.getenv("GITHUB_TOKEN")
REPO = "YOUR_ORG/YOUR_REPO"
WORKFLOW = "restart-nginx.yml"

@app.route("/alert", methods=["POST"])
def alert():
    data = request.json

    print("ALERT RECEIVED:", data)

    instance = data['alerts'][0]['labels']['instance']

    payload = {
        "ref": "main",
        "inputs": {
            "host": instance
        }
    }

    url = f"https://api.github.com/repos/{REPO}/actions/workflows/{WORKFLOW}/dispatches"

    r = requests.post(
        url,
        json=payload,
        headers={
            "Authorization": f"Bearer {GITHUB_TOKEN}",
            "Accept": "application/vnd.github+json"
        }
    )

    print("GitHub Response:", r.status_code, r.text)

    return "ok", 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
