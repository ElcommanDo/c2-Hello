# pull base image
# to use the original python image instead of create new one silm for small size and bullseye for debian
FROM python:3.10.4-slim-bullseye 

# set environement variable
#Then we use the ENV command to set three environment variables:

ENV PIP_DISABLE_PIP_VERSION_CHECK 1
# disables an automatic check for pip updates each time

ENV PYTHONDONTWRITEBYTECODE 1
# means Python will not try to write .pyc files
ENV PYTHONUNBUFFERED 1
# ensures our console output is not buffered by Docker

# Set work directory
WORKDIR /code
# Install dependencies
COPY ./requirements.txt .
RUN pip install -r requirements.txt
# Copy project
COPY . .
