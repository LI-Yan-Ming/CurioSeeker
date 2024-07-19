#######################################################################
############## mab.dldcc.bcm.edu #####################################
srun --tasks=1 --cpus-per-task=2 --mem=210G --time=72:00:00 --pty /bin/bash

##### first time, set up environmrnt and then run
module load singularity/3.8.7
module load anaconda3/2022.05

conda create --prefix /project/lemaire/1_software/curioseeker python=3.10
source activate /project/lemaire/1_software/curioseeker
conda install -c bioconda nextflow
conda install -c bioconda star=2.7.4a


cd /project/lemaire/1_software/curioseeker/

wget https://curioseekerbioinformatics.s3.us-west-1.amazonaws.com/CurioSeeker_v2.0.0/curioseeker-2.0.0.tar.gz -O - | tar -xzf -
cd curioseeker-2.0.0

mkdir -p .singularity
wget https://curioseekerbioinformatics.s3.us-west-1.amazonaws.com/CurioSeeker_v2.0.0/curio-seeker-singularity%3Av2.0.0.sif -P .singularity/

nano nextflow.config
## curio_seeker_singularity = 'file:////project/lemaire/1_software/curioseeker/curioseeker-2.0.0/.singularity/curio-seeker-singularity-v2.0.0.sif'
nano slurm.config

wget \
https://curioseekerbioinformatics.s3.us-west-1.amazonaws.com/references/Mus_musculus.tar.gz -O - |\
tar -xzf -


nextflow run main.nf \
        --input /project/lemaire/10_mouse_curioseeker/samplesheet_igenome_WT.csv \
        --outdir /project/lemaire/10_mouse_curioseeker/results/ \
        -work-dir /project/lemaire/10_mouse_curioseeker/work/ \
        --igenomes_base /project/lemaire/0_ref/CurioSeekerRef/ \
        -resume \
        -profile slurm \
        -config /project/lemaire/1_software/curioseeker/curioseeker-2.0.0/slurm.config
		
nextflow run main.nf \
        --input /project/lemaire/10_mouse_curioseeker/samplesheet_igenome_StingKO.csv \
        --outdir /project/lemaire/10_mouse_curioseeker/results/ \
        -work-dir /project/lemaire/10_mouse_curioseeker/work/ \
        --igenomes_base /project/lemaire/0_ref/CurioSeekerRef/ \
        -resume \
        -profile slurm \
        -config /project/lemaire/1_software/curioseeker/curioseeker-2.0.0/slurm.config

conda deactivate

##### run when the encironment already been set up
module load singularity/3.8.7
module load anaconda3/2022.05	
source activate /project/lemaire/1_software/curioseeker

cd /project/lemaire/1_software/curioseeker/curioseeker-2.0.0/

nextflow run main.nf \
        --input /project/lemaire/10_mouse_curioseeker/samplesheet_igenome_WT2.csv \
        --outdir /project/lemaire/10_mouse_curioseeker/results/ \
        -work-dir /project/lemaire/10_mouse_curioseeker/work/ \
        --igenomes_base /project/lemaire/0_ref/CurioSeekerRef/ \
        -resume \
        -profile slurm \
        -config /project/lemaire/1_software/curioseeker/curioseeker-2.0.0/slurm.config

conda deactivate

#######################################################################
############## pdl1.dldcc.bcm.edu #####################################
srun --tasks=1 --cpus-per-task=2 --mem=210G --time=72:00:00 --pty /bin/bash

##### first time, set up environmrnt and then run
module load singularity/3.8.7
module load anaconda3/2023.09

conda create --prefix /project/lemaire/1_software/curioseeker_v3
source activate /project/lemaire/1_software/curioseeker_v3
conda install -c bioconda nextflow
conda install -c bioconda star=2.7.4a


cd /project/lemaire/1_software/curioseeker_v3/

wget https://curioseekerbioinformatics.s3.us-west-1.amazonaws.com/CurioSeeker_v3.0.0/curioseeker-v3.0.0.tar.gz -O - | tar -xzf -
cd curioseeker-v3.0.0

mkdir -p .singularity
wget https://curioseekerbioinformatics.s3.us-west-1.amazonaws.com/CurioSeeker_v3.0.0/curio-seeker-singularity-v3.0.0.sif -P .singularity/

nano nextflow.config
## curio_seeker_singularity = 'file:////project/lemaire/1_software/curioseeker_v3/curioseeker-v3.0.0/.singularity/curio-seeker-singularity-v2.0.0.sif'
nano slurm.config

wget \i
https://curioseekerbioinformatics.s3.us-west-1.amazonaws.com/references/Mus_musculus.tar.gz -O - |\
tar -xzf -


nextflow run main.nf \
        --input /project/lemaire/10_mouse_curioseeker/samplesheet_igenome_WT2.csv \
        --outdir /project/lemaire/10_mouse_curioseeker/results/ \
        -work-dir /project/lemaire/10_mouse_curioseeker/work/ \
        --igenomes_base /project/lemaire/0_ref/CurioSeekerRef/ \
        -resume \
        -profile slurm \
        -config /project/lemaire/1_software/curioseeker_v3/curioseeker-v3.0.0/slurm.config
conda deactivate







