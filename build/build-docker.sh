# Falex OS Build with Docker

# Build the Docker image
docker build -t falex-builder .

# Run the build
docker run --privileged -v $(pwd):/output falex-builder

# The ISO will be in the current directory