# Python Image
FROM python:2.7-slim

# Workdirectory /app
WORKDIR /app

# Copy contents into container at /app
COPY . /app

# Install required Packages
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 80 available
EXPOSE 80

# Enviroment variable
ENV NAME World

# Run app.py
CMD ["python", "app.py"]

