FROM python:3.12-slim
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt --no-cache-dir
EXPOSE 8080
CMD python app.py