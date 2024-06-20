#!/bin/bash

# Network naming
NETWORK_NAME="shared_network"

# checkc if network exist
EXISTING_NETWORK=$(docker network ls --filter name=^${NETWORK_NAME}$ --format="{{ .Name }}")

if [ -z "$EXISTING_NETWORK" ]; then
  # Create network if not exist
  docker network create $NETWORK_NAME
fi

# Get IP gateway of network
NETWORK_GATEWAY=$(docker network inspect $NETWORK_NAME -f '{{range .IPAM.Config}}{{.Gateway}}{{end}}')

# Show created network
echo "NETWORK_IP = $NETWORK_GATEWAY"
