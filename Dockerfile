FROM python:3.9.18-slim-bullseye

RUN apt update -y 
WORKDIR /app

COPY . /app
RUN pip install -r requirements.txt

# CMD ["python3", "app.py"]
CMD ["gunicorn", "--workers=4", "--bind", "0.0.0.0:8080", "app:app"]