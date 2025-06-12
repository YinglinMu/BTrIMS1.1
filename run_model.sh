#!/bin/bash
#PBS -N wvfac_PBL
#PBS -P w40
#PBS -q normalsr
#PBS -l walltime=20:00:00
#PBS -l ncpus=104
#PBS -l mem=350GB
#PBS -l jobfs=100MB
#PBS -l storage=gdata/hh5+gdata/w28+gdata/rt52+gdata/w40+gdata/w97+scratch/w40
#PBS -l wd

ulimit -s unlimited 
module load intel-compiler netcdf
export OMP_STACKSIZE=2G
export OMP_NUM_THREADS=104

rm -f *.o *.mod
# compile all files
ifort -c global_data.f90
ifort -c util.f90 
ifort -c input_data_handling_era5.f90 
ifort -c bt_subs.f90 
ifort -c -qopenmp back_traj.f90 

ifort -qopenmp *.o -lnetcdff -lnetcdf -o main 

#./main 07 10 2023 08 10 2023 /scratch/w40/ym7079/test0_PBL/ > terminal_output.txt



rm -rf .git
git init
git remote add origin git@github.com:YinglinMu/BTrIMS1.1.git



git checkout --orphan main     # 新建 main 分支，不继承任何历史
rm -rf * .gitignore             # 清空当前目录
cp -r ../BTrIMS1.1/main/* .               # 复制 main 文件夹内容
git add .
git commit -m "Initial commit on main"
git push origin main


git checkout --orphan bicubic     # 新建 main 分支，不继承任何历史
rm -rf * .gitignore             # 清空当前目录
cp -r ../BTrIMS1.1/bicubic/* .               # 复制 main 文件夹内容
git add .
git commit -m "Initial commit on bicubic"
git push origin bicubic


git checkout --orphan cloud_hydrometeors     # 新建 main 分支，不继承任何历史
rm -rf * .gitignore             # 清空当前目录
cp -r ../BTrIMS1.1/cloud_hydrometeors/* .               # 复制 main 文件夹内容
git add .
git commit -m "Initial commit on cloud_hydrometeors"
git push origin cloud_hydrometeors

git checkout --orphan equivalent_potential_temp     # 新建 main 分支，不继承任何历史
rm -rf * .gitignore             # 清空当前目录
cp -r ../BTrIMS1.1/equivalent_potential_temp/* .               # 复制 main 文件夹内容
git add .
git commit -m "Initial commit on equivalent_potential_temp"
git push origin equivalent_potential_temp


git checkout --orphan isentropic     # 新建 main 分支，不继承任何历史
rm -rf * .gitignore             # 清空当前目录
cp -r ../BTrIMS1.1/isentropic/* .               # 复制 main 文件夹内容
git add .
git commit -m "Initial commit on isentropic"
git push origin isentropic


git checkout --orphan splitting     # 新建 main 分支，不继承任何历史
rm -rf * .gitignore             # 清空当前目录
cp -r ../BTrIMS1.1/splitting/* .               # 复制 main 文件夹内容
git add .
git commit -m "Initial commit on splitting"
git push origin splitting


git checkout --orphan splitting_convection     # 新建 main 分支，不继承任何历史
rm -rf * .gitignore             # 清空当前目录
cp -r ../BTrIMS1.1/splitting_convection/* .               # 复制 main 文件夹内容
git add .
git commit -m "Initial commit on splitting_convection"
git push origin splitting_convection


git checkout --orphan WaterSip     # 新建 main 分支，不继承任何历史
rm -rf * .gitignore             # 清空当前目录
cp -r ../BTrIMS1.1/WaterSip/* .               # 复制 main 文件夹内容
git add .
git commit -m "Initial commit on WaterSip"
git push origin WaterSip

git checkout --orphan water_vapor     # 新建 main 分支，不继承任何历史
rm -rf * .gitignore             # 清空当前目录
cp -r ../BTrIMS1.1/water_vapor/* .               # 复制 main 文件夹内容
git add .
git commit -m "Initial commit on water_vapor"
git push origin water_vapor

git checkout cloud_hydrometeors
git cherry-pick cdfe2c7
git push origin cloud_hydrometeors

git checkout equivalent_potential_temp
git cherry-pick cdfe2c7
git push origin equivalent_potential_temp

git checkout  isentropic
git cherry-pick cdfe2c7
git push origin isentropic

git checkout  splitting
git cherry-pick cdfe2c7
git push origin splitting

git checkout splitting_convection
git cherry-pick cdfe2c7
git push origin splitting_convection


git checkout WaterSip
git cherry-pick cdfe2c7
git push origin WaterSip

git checkout water_vapor
git cherry-pick cdfe2c7
git push origin water_vapor
