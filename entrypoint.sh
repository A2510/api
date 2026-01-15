#!/bin/sh




# Apply database migrations
python manage.py makemigrations --no-input
python manage.py migrate --no-input

# Collect static files
python manage.py collectstatic --no-input --clear

echo "from authentication.models import CustomUser; CustomUser.objects.create_superuser('admin@gmail.com', '1234')" | python manage.py shell

# Start server
daphne -b 0.0.0.0 -p 8000 project.asgi:application