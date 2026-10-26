#pull the python image from Docker Hub
#Use a lightweight Python image
FROM python:3.14-slim

#Set the working directory in the container
WORKDIR /app
#copy dependencies list before copying application code
COPY requirements.txt .

#Install the dependencies
RUN pip install -r requirements.txt

#Copy application code and save model inside /app
COPY . . 
#(first dot is the current directory on the host machine-source, second dot is the current directory in the container-destination)

#Document the port used by FastAPI application 
EXPOSE 8000

#start the API server when container is ready
#0.0.0.0 - allows connections through the container's network interface
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
