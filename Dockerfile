# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install the required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/

# Expose the port Django will run on
EXPOSE 8000

# Run database migrations
RUN python manage.py migrate

# Command to run the Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
