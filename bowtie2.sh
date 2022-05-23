#!/bin/bash

#SBATCH --job-name=G5_T7_02
#SBATCH -p medium
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --cpus-per-task=4
#SBATCH --mem=40000
#SBATCH --time=5-00:00:00
#SBATCH --mail-user=a.castellanoss@uniandes.edu.co
#SBATCH --mail-type=ALL
#SBATCH -o G5_T7_02.o

# conda init bash
# conda activate bowtie2-2.4.5
module load bowtie2/2.4.5
module load samtools/1.14

# Build mapping index

echo "Create bowtie2-build directory"
mkdir bowtie2-build

echo "bowtie2-build bt2_index_P"
bowtie2-build -f P-assembly/final.contigs.fa bowtie2-build/bt2_index_P

echo "bowtie2-build bt2_index_E"
bowtie2-build -f E-assembly/final.contigs.fa bowtie2-build/bt2_index_E

# Mapping

echo "Create bowtie2-mapping directory"
mkdir bowtie2-mapping

echo "P1 mapping against P-assembly"
bowtie2 -x bowtie2-build/bt2_index_P -1 reads/P1.R1.fastq -2 reads/P1.R2.fastq -S bowtie2-mapping/P1_assembly.sam
echo "P2 mapping against P-assembly"
bowtie2 -x bowtie2-build/bt2_index_P -1 reads/P2.R1.fastq -2 reads/P2.R2.fastq -S bowtie2-mapping/P2_assembly.sam
echo "P3 mapping against P-assembly"
bowtie2 -x bowtie2-build/bt2_index_P -1 reads/P3.R1.fastq -2 reads/P3.R2.fastq -S bowtie2-mapping/P3_assembly.sam

echo "E1 mapping against E-assembly"
bowtie2 -x bowtie2-build/bt2_index_E -1 reads/E1.R1.fastq -2 reads/E1.R2.fastq -S bowtie2-mapping/E1_assembly.sam
echo "E2 mapping against E-assembly"
bowtie2 -x bowtie2-build/bt2_index_E -1 reads/E2.R1.fastq -2 reads/E2.R2.fastq -S bowtie2-mapping/E2_assembly.sam
echo "E3 mapping against E-assembly"
bowtie2 -x bowtie2-build/bt2_index_E -1 reads/E3.R1.fastq -2 reads/E3.R2.fastq -S bowtie2-mapping/E3_assembly.sam

# Convert the SAM file into a BAM file

echo "sam2bam"
samtools view -bS bowtie2-mapping/P1_assembly.sam > bowtie2-mapping/P1_assembly.bam
samtools view -bS bowtie2-mapping/P2_assembly.sam > bowtie2-mapping/P2_assembly.bam
samtools view -bS bowtie2-mapping/P3_assembly.sam > bowtie2-mapping/P3_assembly.bam

samtools view -bS bowtie2-mapping/E1_assembly.sam > bowtie2-mapping/E1_assembly.bam
samtools view -bS bowtie2-mapping/E2_assembly.sam > bowtie2-mapping/E2_assembly.bam
samtools view -bS bowtie2-mapping/E3_assembly.sam > bowtie2-mapping/E3_assembly.bam

# Sorting and indexing

echo "Sort P1.bam"
samtools sort -T /tmp/P1_assembly.sorted -o bowtie2-mapping/P1_assembly.sorted.bam bowtie2-mapping/P1_assembly.bam
echo "Sort P2.bam"
samtools sort -T /tmp/P2_assembly.sorted -o bowtie2-mapping/P2_assembly.sorted.bam bowtie2-mapping/P2_assembly.bam
echo "Sort P3.bam"
samtools sort -T /tmp/P3_assembly.sorted -o bowtie2-mapping/P3_assembly.sorted.bam bowtie2-mapping/P3_assembly.bam
echo "Sort E1.bam"
samtools sort -T /tmp/E1_assembly.sorted -o bowtie2-mapping/E1_assembly.sorted.bam bowtie2-mapping/E1_assembly.bam
echo "Sort E2.bam"
samtools sort -T /tmp/E2_assembly.sorted -o bowtie2-mapping/E2_assembly.sorted.bam bowtie2-mapping/E2_assembly.bam
echo "Sort E2.bam"
samtools sort -T /tmp/E3_assembly.sorted -o bowtie2-mapping/E3_assembly.sorted.bam bowtie2-mapping/E3_assembly.bam

echo "Index P1.sorted.bam"
samtools index bowtie2-mapping/P1_assembly.sorted.bam
echo "Index P2.sorted.bam"
samtools index bowtie2-mapping/P2_assembly.sorted.bam
echo "Index P3.sorted.bam"
samtools index bowtie2-mapping/P3_assembly.sorted.bam
echo "Index E1.sorted.bam"
samtools index bowtie2-mapping/E1_assembly.sorted.bam
echo "Index E2.sorted.bam"
samtools index bowtie2-mapping/E2_assembly.sorted.bam
echo "Index E3.sorted.bam"
samtools index bowtie2-mapping/E3_assembly.sorted.bam