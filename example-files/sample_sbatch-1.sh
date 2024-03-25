#!/bin/bash -l

#SBATCH -A uppmax2020-2-2  # project to run the job in
#SBATCH -p core -n 4  # partition (to use whole node: -p node)
#SBATCH -M snowy  # cluster name
#SBATCH -t 05:00  # time allocated for job
#SBATCH -J pilot # job name
#SBATCH -o test1.out  # output file?
#SBATCH -e test1.err  # error log?
#SBATCH --gpus=1  # number of gpus to use
#SBATCH -q gpu

# not used: SBATCH -N 1 # resource (number of nodes)

home_dir=/proj/uppmax2024-2-2/kfischer/clthesis/pilot-out
cd $home_dir 