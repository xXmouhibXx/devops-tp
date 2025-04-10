FROM python:3.9

WORKDIR /app
COPY hello-devops/requirements.txt .
RUN pip install -r requirements.txt

COPY hello-devops/ /app

CMD ["python", "app.py"]
