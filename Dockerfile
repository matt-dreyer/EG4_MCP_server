# Use Python 3.11 slim image
FROM python:3.11-slim

# Install system dependencies if needed
RUN apt-get update && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

# Set working directory to where the build tool clones the repo
WORKDIR /src/eg4_mcp_server

# Copy requirements first for better caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Health check (optional but recommended)
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD python -c "import sys; sys.exit(0)"

# Run the MCP server - server.py is in src/eg4_mcp_server/ subdirectory
CMD ["python", "src/eg4_mcp_server/server.py"]