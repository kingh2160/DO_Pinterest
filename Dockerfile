FROM python:3.9.0

WORKDIR /home/

RUN echo "TESTing4412"

RUN git clone https://github.com/kingh2160/Djangoapp.git

WORKDIR /home/Djangoapp/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

RUN echo "SECRET_KEY=django-insecure-%89ks*!emc1ds9i^dp_4f!warsdq5-+ar(kh9ovwwge2gzc6u#" > .env

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=pragmatic.settings.deploy && python manage.py migrate --settings=pragmatic.settings.deploy && gunicorn pragmatic.wsgi --env DJANGO_SETTINGS_MODULE=pragmatic.settings.deploy --bind 0.0.0.0:8000"]