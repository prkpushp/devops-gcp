from flask import Flask, request
import requests
import os

app = Flask(__name__)

GITHUB_TOKEN = os.getenv("GITHUB_TOKEN")
REPO = os.getenv("REPO", "prkpushp/devops-gcp")

@app.route("/alert", methods=["POST"])
def alert():
    data = request.json
    instance = data.get("commonLabels", {}).get("instance", "unknown")

    print(f"Triggering remediation for: {instance}")

    url = f"https://api.github.com/repos/{REPO}/actions/workflows/remediate.yml/dispatches"

    payload = {
        "ref": "main",
        "inputs": {
            "host": instance
        }
    }

    headers = {
        "Authorization": f"Bearer {GITHUB_TOKEN}",
        "Accept": "application/vnd.github+json"
    }

    r = requests.post(url, json=payload, headers=headers)

    print(r.status_code, r.text)
    return "ok", 200


@app.route("/")
def home():
    return "Webhook Running", 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
