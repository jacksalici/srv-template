#!/bin/bash

PARTITION="all_serial"
ACCOUNT="<project_account>"
TIME="01:00:00"
GRES="gpu:1"

srun --partition="${PARTITION}" --account="${ACCOUNT}" --time="${TIME}" --gres="${GRES}" --pty /bin/bash
