# Use Ubuntu as the base image
FROM ubuntu:latest

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    curl \
    software-properties-common \
    gnupg \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Add HashiCorp GPG key and repository
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list

# Install Terraform
RUN apt-get update && apt-get install -y terraform

# Set up a volume for your Terraform projects
VOLUME /terraform

# Set the working directory
WORKDIR /terraform

# Verify Terraform installation
RUN terraform --version

# Start a bash shell when the container runs
CMD ["/bin/bash"]