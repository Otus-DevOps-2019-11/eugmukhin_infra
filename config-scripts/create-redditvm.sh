#!/bin/bash

gcloud compute instances create reddit-full-app \
  --zone=europe-west1-b \
  --machine-type=f1-micro \
  --tags=puma-server \
  --image-family=reddit-full
