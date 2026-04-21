# Stage 1 - build
FROM python:3.9-slim as builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2 - final
FROM python:3.9-slim

WORKDIR /app

# create non-root user
RUN useradd -m appuser

COPY --from=builder /usr/local/lib/python3.9 /usr/local/lib/python3.9
COPY . .

USER appuser

CMD ["python", "app.py"]