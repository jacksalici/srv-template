#!/bin/bash
#SBATCH --job-name=train_job
#SBATCH --output=logs/job_%j.log
#SBATCH --error=logs/job_%j.log
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --mem=18G
#SBATCH --partition=all_usr_prod
#SBATCH --account=<project_account>
#SBATCH --time=12:00:00

set -euo pipefail


mkdir -p logs

conda activate <conda_env_name>

cd <project_dir>

python <entrypoint> 
