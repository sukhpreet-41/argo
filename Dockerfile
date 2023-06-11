FROM python:3.9
RUN pip install flask
WORKDIR /app
COPY /argo-project/app.py .
EXPOSE 5000
ENTRYPOINT ["python", "app.py"]