FROM python:3.9
RUN pip install sqlalchemy pandas psycopg2
WORKDIR /app 
COPY . /app/
ENTRYPOINT [ "python" ,  "load_data.py" ]