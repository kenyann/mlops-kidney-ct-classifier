FROM python:3.9.18-slim-bullseye

RUN apt update -y 
WORKDIR /app

COPY . /app
RUN pip install -r requirements.txt

EXPOSE %PORT
CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app
# CMD ["python3", "app.py"]