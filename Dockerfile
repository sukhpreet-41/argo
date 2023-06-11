FROM python:3.9
WORKDIR /app
RUN pip install flask
COPY . .
ENTRYPOINT ["python", "app.py"]