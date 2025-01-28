FROM python:3.9

# Set the working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y netcat-openbsd

# Copy the application source code
COPY . /app

# Upgrade pip
RUN pip install --upgrade pip

# Install dependencies
RUN pip install -r requirements.txt

# Expose the port
EXPOSE 8000

# Make entrypoint executable
RUN chmod +x /app/entrypoint.sh

# Set entrypoint script
ENTRYPOINT ["/app/entrypoint.sh"]
