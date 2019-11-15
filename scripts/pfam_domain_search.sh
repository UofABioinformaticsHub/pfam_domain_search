#!/bin/bash
#SBATCH --mem 1G
#SBATCH --cpus-per-task 8
#SBATCH --time 00:10:00

# Adapted by Nathan Watson-Haigh from code originally written by Radoslaw Suchecki

module load \
  HMMER

# I/O
AA_FASTA="${1}" # FASTA file of proteins as first command line arg
PFAM_ID="${2}"  # PFAM ID as second command line arg
OUTDIR="hmmer_output/${PFAM_ID}"

BASENAME="${AA_FASTA##*/}"

# Create output directory structure
mkdir -p "${OUTDIR}"

# Run PFAM domain discovery among the protein sequences using the HMM for this PFAM domain
hmmsearch \
  --notextw \
  --cpu "${SLURM_CPUS_PER_TASK:-1}"  \
  -o "${OUTDIR}/${PFAM_ID}_vs_${BASENAME%%.*}.out" \
  --domtblout "${OUTDIR}/${PFAM_ID}_vs_${BASENAME%%.*}.domtblout" \
  --tblout "${OUTDIR}/${PFAM_ID}_vs_${BASENAME%%.*}.tblout" \
  "HMMs/${PFAM_ID}.hmm" \
  "${AA_FASTA}"
