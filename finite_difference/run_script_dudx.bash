#!/bin/bash
###
###
#SBATCH --time=01:00:00
#SBATCH -N 1
#SBATCH -n 48
#SBATCH --exclusive
#SBATCH --partition=bsudfq
#SBATCH --job-name=dudx
#SBATCH --output=dudx.o%j

module load gcc
module load openmpi
module load slurm
#source ~/.bashrc

#echo "nproc, npts, time_v1, error_v1, time_v2, error_v2, time_v3, error_v3, time_v4, error_v4"
for p in 1 2 4 8 16 32 48
do
    mpirun -np $p ./derivative_mpi $((2**26)) 
done
