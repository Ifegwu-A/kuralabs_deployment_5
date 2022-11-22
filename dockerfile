FROM python 
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
RUN pip install gunicorn

EXPOSE 5000

CMD gunicorn --bind 0.0.0.0:5000 application:app
