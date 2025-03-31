#!/bin/bash
###
###
#SBATCH --time=01:00:00
#SBATCH -N 6
#SBATCH -n 168
#SBATCH --exclusive
#SBATCH --partition=defq
#SBATCH --job-name=dudx
#SBATCH --output=dudx.o%j

module load gcc
module load mpich
module load slurm
#source ~/.bashrc

echo "nproc, npts, time_v1, error_v1, time_v2, error_v2, time_v3, error_v3, time_v4, error_v4"
for p in 1 7 14 28 56 84 112 140 168
do
    mpirun -np $p ./derivative_mpi $((7*2**24)) 
done
