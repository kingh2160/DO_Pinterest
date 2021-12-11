FROM python:3.9.0

WORKDIR /home/

RUN echo "TEST"

RUN git clone https://github.com/kingh2160/Djangoapp.git

WORKDIR /home/Djangoapp/

RUN pip install -r requirements.txt

RUN echo "SECRET_KEY=django-insecure-%89ks*!emc1ds9i^dp_4f!warsdq5-+ar(kh9ovwwge2gzc6u#" > .env

RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]