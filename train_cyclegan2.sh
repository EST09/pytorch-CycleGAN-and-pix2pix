#!/bin/bash 

# Account name and target partition 
#SBATCH --account rittscher.prj 
#SBATCH --partition gpu_long

# Specify a job name 
#SBATCH --job-name train_cyclegan

# Specify the directory where the job should be executed
#SBATCH --chdir /users/rittscher/qdv200/pytorch-CycleGAN-and-pix2pix

# Log locations which are relative to the current working directory of the submission 
#SBATCH --output logs/train_cyclegan-%j.out
#SBATCH --error logs/train_cyclegan-%j.err
#SBATCH --mail-type=END,FAIL         # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=emily.thomas@eng.ox.ac.uk   # Where to send mail

# Parallel environment settings 
#  For more information on these please see the documentation 
#  Allowed parameters: 
#   -c, --cpus-per-task 
#   -N, --nodes 
#   -n, --ntasks 



# 1. do not export anything from the current environment qne purge all modules
#SBATCH --export=NONE
module purge
 
# 2. Print some useful data about the job to help with debugging 
echo "------------------------------------------------" 
echo "Slurm Job ID: $SLURM_JOB_ID" 
echo "Run on host: "`hostname` 
echo "Operating system: "`uname -s` 
echo "Username: "`whoami` 
echo "Started at: "`date` 
echo "Current directory (ckeck: SBATCH --chdir or -D argument):"`pwd`
echo "------------------------------------------------" 
 
# 3. print cpu type
echo "GPU type: $MODULE_GPU_TYPE"

# 4. load anaconda
# module load Anaconda3/2020.11
# eval "$(conda shell.bash hook)"
source /well/rittscher/users/qdv200/anaconda3/etc/profile.d/conda.sh
conda init bash

# 5. activate the environment dsmil so that it is available in the job

conda activate ihc_env


# 6. run the script to find tiles for the ROIs
echo "Running find_tiles_for_rois.py for ouh_batch1_20x"
python testing.py


# 7. say that the job is done
echo ""
echo "Job $SLURM_JOB_ID has been completed!"
# End of job script

