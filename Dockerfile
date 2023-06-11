FROM python:3.9
RUN pip install flask
WORKDIR /app
COPY app.py .
ENTRYPOINT ["python", "app.py"]