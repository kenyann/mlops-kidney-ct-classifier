FROM python:3.9.18-slim-bullseye

RUN apt update -y 
WORKDIR /app

COPY . /app
RUN pip install -r requirements.txt
EXPOSE $PORT
# CMD ["python3", "app.py"]
CMD gunicorn --bind 0.0.0.0:$PORT app:app