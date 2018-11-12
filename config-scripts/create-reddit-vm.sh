#!/bin/bash

gcloud compute --project=delta-pagoda-219212 instances create reddit-full-test \
  --zone=europe-west1-b \
  --machine-type=f1-micro \
  --subnet=default \
  --network-tier=STANDARD \
  --maintenance-policy=MIGRATE \
  --tags=puma-server \
  --image-family=reddit-full \
  --boot-disk-size=10GB \
  --boot-disk-type=pd-standard
