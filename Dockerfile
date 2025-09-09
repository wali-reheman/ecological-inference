FROM python:3.10-slim

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# Switch to root to update and install tools
USER root
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install uv
ARG uv=/root/.local/bin/uv
ADD https://astral.sh/uv/install.sh /install.sh
RUN chmod +x /install.sh && /install.sh && rm /install.sh

# Create working directory
WORKDIR /app

# Copy requirements and project files first to leverage Docker cache
COPY requirements.txt requirements-dev.txt pyproject.toml ./

# Install Python dependencies using uv
RUN $uv pip install --no-cache-dir -r requirements.txt --system
RUN $uv pip install --no-cache-dir -r requirements-dev.txt --system

# Install pre-commit using uv
RUN $uv pip install --no-cache-dir pre-commit --system

# Copy source code
COPY . .

# Install package in development mode using uv
RUN $uv pip install -e . --system

# Default command
CMD ["/bin/bash"]
