#!/bin/bash
#
# Check that tomcat is running well
# Run this script after tomcat installation

export ENVIRONMENT=$1

usage() {
    echo "Usage:  $0 <ENVIRONMENT>"
    exit 1
}

if [ $# -ne 1 ]
then
    usage
fi

echo "Build the docker image..."
docker build -t tomcat_image .

echo "Run the docker container..." 
docker run -d --name tomcat_server --privileged=true -p 8080:8080 -v /home/ubuntu/Desktop/deploy:/data -e ENVIRONMENT=DEV tomcat_image