# Use official Python image as base
FROM python:3.8-slim

# Install system dependencies required for OpenCV
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements first to leverage Docker cache
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the project structure
COPY code/ ./code/
COPY *.md ./
COPY LICENSE ./

# Ensure the model directory exists
RUN mkdir -p code/model

# Set Python path to include the code directory
ENV PYTHONPATH="${PYTHONPATH}:/app/code"

# Expose Streamlit's default port
EXPOSE 8501

# Command to run the application
CMD ["streamlit", "run", "code/app.py", "--server.address", "0.0.0.0"]