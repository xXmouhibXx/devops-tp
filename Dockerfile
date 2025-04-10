FROM python:3.9

WORKDIR /app
COPY hello-devops/requirements.txt .
RUN pip install -r requirements.txt

COPY hello-devops/ /app

CMD ["python", "app.py"]
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:5000 || exit 1
