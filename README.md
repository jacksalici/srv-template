# SLURM Template (AImageLab-HPC)

This repository is a reusable template for interactive and batch SLURM jobs.

## Files

- `.vscode/`: VS Code debugging configuration for this template.
- `bash.sh`: interactive shell allocation with `srun --pty`, also useful when preparing/debugging runs from VS Code.
- `sbatch.sh`: batch job template for GPU workloads.

## Quick Start

You can both download the files or use this repository as a template for your own project. To use it:

1. Edit placeholders in the scripts (values inside `<...>`).
2. Run interactive mode:

```bash
./bash.sh
```

3. Run batch mode:

```bash
sbatch sbatch.sh
```

You can override SBATCH options from the command line when submitting:

```bash
sbatch \
	--account=<project_account> \
	--partition=all_usr_prod \
	--time=08:00:00 \
	--gpus=1 \
	--job-name=my_job \
	sbatch.sh
```

## Customizable Parts

### `bash.sh` placeholders

- `ACCOUNT="<project_account>"`
- `PARTITION="all_serial"` (or another partition)
- `TIME="01:00:00"`
- `GRES="gpu:1"`

### `sbatch.sh` placeholders

- `#SBATCH --account=<project_account>`
- `conda activate <conda_env_name>`
- `cd <project_dir>`
- `python <entrypoint>`

You can also customize other SBATCH directives directly in the header (job name, logs, GPUs, memory, partition, time).

### `sbatch.sh` submission-time options

Change these in the header or pass them as `sbatch` flags:

- `--job-name`
- `--output` and `--error`
- `--nodes`
- `--gpus` or `--gres`
- `--mem`
- `--partition`
- `--account`
- `--time`

## Documentation Notes (from AImageLab-HPC ColdFront docs)

- Use `all_qos_dbg` for short debugging sessions (1 hour, up to 1 GPU).
- `all_usr_prod` is the standard production partition.
- `boost_usr_prod` targets high-end GPUs (A40/L40S).
- Students/thesis users are often auto-assigned QOS; explicit `--qos` may be unnecessary.
- If you do not need a specific GPU model, avoid strict `--constraint` for shorter queue times.
- For budget checks, use `susage`.

## Recommended Commands

```bash
# show your jobs
squeue -u $USER

# inspect partition status
sinfo -p all_usr_prod

# check budget usage
susage
```

## Useful Documentation Links

- Main docs: https://ailb-web.ing.unimore.it/coldfront/documentation
- Scheduler and Job Submission: https://ailb-web.ing.unimore.it/coldfront/documentation/UKN8n
- Node Features and Constraints: https://ailb-web.ing.unimore.it/coldfront/documentation/flOS4
- Budget and Accounting: https://ailb-web.ing.unimore.it/coldfront/documentation/GSOa2
- Environment and Customization: https://ailb-web.ing.unimore.it/coldfront/documentation/LrU3q
- Helpdesk: https://ailb-web.ing.unimore.it/tickets/
