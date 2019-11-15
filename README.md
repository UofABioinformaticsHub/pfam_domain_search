# Example Usage

```bash
PFAM_ID='PF00989'
AA_FASTA="test/${PFAM_ID}_domain_proteins.fasta"

# Download PFAM domain HMM
wget -O HMMs/${PFAM_ID}.hmm http://pfam.xfam.org/family/${PFAM_ID}/hmm

# Perform PFAM domain search against protein sequences
sbatch scripts/pfam_domain_search.sh "${AA_FASTA}" "${PFAM_ID}"
```
