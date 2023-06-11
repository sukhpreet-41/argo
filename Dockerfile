FROM python:3.9
RUN pip install flask
WORKDIR /app
COPY /var/lib/jenkins/workspace/argoci/argo/app.py .
EXPOSE 5000
ENTRYPOINT ["python", "app.py"]