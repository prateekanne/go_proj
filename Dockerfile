FROM python:3.11-slim

# set env vars
ENV APP_ENV=production \
    APP_PORT=8080 \
    DEBUG=false

# workdir
WORKDIR /app

# copy files
COPY . /app

# install deps if requirements.txt exists
RUN if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

# expose ports
EXPOSE 8080
EXPOSE 9090

# default command
CMD ["python", "-m", "http.server", "8080"]
