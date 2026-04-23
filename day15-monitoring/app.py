from flask import Flask, Response
from prometheus_client import generate_latest, CONTENT_TYPE_LATEST, Counter

app = Flask(__name__)

# Sample metric
REQUEST_COUNT = Counter('request_count', 'Total Requests')

@app.route('/')
def home():
    REQUEST_COUNT.inc()
    return "Hello DevOps 🚀"

# ✅ ADD THIS
@app.route('/metrics')
def metrics():
    return Response(generate_latest(), mimetype=CONTENT_TYPE_LATEST)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=3000)