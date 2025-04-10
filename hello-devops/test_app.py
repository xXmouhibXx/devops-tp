from app import app
import pytest

def test_hello():
    client = app.test_client()
    response = client.get('/')
    assert response.status_code == 200
    assert b"Hello, CI/CD!" in response.data
