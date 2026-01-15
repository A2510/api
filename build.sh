#!/bin/bash

set -o errexit

echo "Installing dependencies..."
pip install -r requirements.txt

echo "Making migrations..."
python manage.py makemigrations --no-input

echo "Applying database migrations..."
python manage.py migrate --no-input

echo "Collecting static files..."
python manage.py collectstatic --no-input --clear

# Create superuser if CREATE_SUPERUSER environment variable is set
if [[ $CREATE_SUPERUSER ]];
then
  echo "Creating superuser..."
  python manage.py createsuperuser --no-input
fi

echo "Build completed successfully!"
