#!/bin/bash

cd frontend
podman build -t quay.io/rh-ai-quickstart/portfolio-manager-agent:ui .

cd ..
cd orchestrator/src
pip freeze >requirements.txt
podman build -t quay.io/rh-ai-quickstart/portfolio-manager-agent:orchestrator .

cd ../..
cd tools/portfolio/src
pip freeze >requirements.txt
podman build -t quay.io/rh-ai-quickstart/portfolio-manager-agent:portfolio .

cd ../../..
cd tools/value_at_risk/src
pip freeze >requirements.txt
podman build -t quay.io/rh-ai-quickstart/portfolio-manager-agent:risk .

cd ../../..
cd tools/guidelines/src
pip freeze >requirements.txt
podman build -t quay.io/rh-ai-quickstart/portfolio-manager-agent:guidelines .

cd ../../..
podman build -f tools/guidelines-model/Dockerfile -t quay.io/rh-ai-quickstart/portfolio-manager-agent:guidelines-model .
