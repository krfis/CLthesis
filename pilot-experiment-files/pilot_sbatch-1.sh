#!/bin/bash -l

#SBATCH -A uppmax2020-2-2  # project to run the job in
#SBATCH -p core -n 4  # partition (to use whole node: -p node)
#SBATCH -M snowy  # cluster name
#SBATCH -t 2:00:00  # time allocated for job
#SBATCH -J pilot-study # job name
#SBATCH -o test1.out  # output file?
#SBATCH -e test1.err  # error log?
#SBATCH --gpus=1  # number of gpus to use
#SBATCH -q gpu

# not used: SBATCH -N 1 # resource (number of nodes)



# add all commands from colab (new folder, copying of files etc)

home_dir=/proj/uppmax2024-2-2/kfischer/
cd $home_dir 

cd machamp

python train.py --dataset_configs "/crex/proj/uppmax2024-2-2/kfischer/clthesis/configs/config_pilot.json" --parameters_config "/crex/proj/uppmax2024-2-2/kfischer/clthesis/configs/params_pilot.json" --name pilot --device 0

mkdir -p predictions

python predict.py logs/pilot/*/model.pt "/crex/proj/uppmax2024-2-2/kfischer/machamp/data/pilot/test-fao.conllu" predictions/pilot_test.out --device 0