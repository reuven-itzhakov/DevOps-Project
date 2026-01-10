# Use python:3.10-slim as the base image
FROM python:3.10-slim

# (Optional but recommended) Set working directory inside the container
WORKDIR /app

# Copy app.py into the container (to the /app directory)
COPY app.py .

# Set the command to run python app.py by default
CMD ["python", "app.py"]