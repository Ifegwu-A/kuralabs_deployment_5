FROM python 
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
RUN pip install gunicorn

EXPOSE 8000

CMD gunicorn --bind 0.0.0.0:8000 application:app
