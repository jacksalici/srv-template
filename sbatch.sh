#!/bin/bash
#SBATCH --job-name=vae
#SBATCH --output=logVae%j.txt
#SBATCH --error=logVae%j.txt
#SBATCH --open-mode=truncate
#SBATCH --nodes=1
#SBATCH --gpus=1
#SBATCH --mem=8G
#SBATCH --partition=all_usr_prod
#SBATCH --account=tesi_gsalici
#SBATCH --time=01:00:00

. /usr/local/anaconda3/etc/profile.d/conda.sh
conda activate /homes/gsalici/.conda/envs/dl
conda activate dl
if [ "$CONDA_DEFAULT_ENV" != "dl" ]; then
    echo "Error: Conda environment not activated successfully."
    exit 1
fi
IFS=',' read -r -a nodelist <<<$SLURM_NODELIST
export MASTER_ADDR="${nodelist[0]}"
export MASTER_PORT=`comm -23 <(seq 5000 6000 | sort) <(ss -Htan | awk '{print $4}' | cut -d':' -f2 | sort -u) | shuf | head -n 1`
echo "******** NUMBER OF GPUs: ${SLURM_GPUS} ********"
export WORLD_SIZE=$SLURM_GPUS
export LOCAL_RANK=0
export RANK=0
export CUDA_HOME=/usr/local/cuda-11.8
export PYTHONPATH=/homes/gsalici/Projects/simple_vrnn

cd Projects/simple_vrnn
python dec_model.py
