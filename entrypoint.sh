#!/bin/sh

echo "Waiting for database to be ready..."

until PGPASSWORD=$DATABASE_PASSWORD psql -h "$DATABASE_HOST" -U "$DATABASE_USER" -d "$DATABASE_NAME" -c '\q' 2>/dev/null; do
  echo "Database is not ready yet. Waiting..."
  sleep 2
done

echo "Database is ready!"

echo "Applying database migrations..."
python manage.py migrate

echo "Starting Django application..."
exec python manage.py runserver 0.0.0.0:8000