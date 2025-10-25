FROM gradle:7.6-jdk17

# Set working directory
WORKDIR /workspace/spring

# Use non-root gradle user if needed (gradle image has gradle user)
USER root

# Ensure tools
RUN apt-get update && apt-get install -y --no-install-recommends \
  git \
  unzip \
  curl \
  && rm -rf /var/lib/apt/lists/*

# Create a user to run the app if desired (optional)
# ...existing code...

# Default command will be provided by docker-compose using gradle wrapper or gradle
