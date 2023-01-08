FROM python:3.10

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi 
WORKDIR /app
COPY app /app
COPY run.sh /
COPY requirements.txt /
RUN pip install -r /requirements.txt

EXPOSE 9090 9191
USER uwsgi

CMD ["/run.sh"]