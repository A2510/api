FROM python:3.11.4-slim-buster

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt update
RUN apt install python3-pip python3-dev libpq-dev postgresql-contrib -y

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# Set work directory
WORKDIR /usr/src/app



# Copy the rest of the project into the container
COPY . .

RUN python manage.py makemigrations --no-input
RUN python manage.py migrate --no-input

RUN python manage.py collectstatic --no-input --clear

RUN echo "from authentication.models import CustomUser; CustomUser.objects.create_superuser('admin@gmail.com', '1234')" | python manage.py shell


# Ensure entrypoint.sh is executable
RUN ["chmod", "+x", "./entrypoint.sh"]

# Run entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
