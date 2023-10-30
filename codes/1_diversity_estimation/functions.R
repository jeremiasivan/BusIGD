# functions for codes/1_diversity_estimation

# function: run BUSCO based on FASTA and lineage
f_run_busco <- function(fn_fasta, dir_output, lineage, mode, thread, exe_busco) {
    busco_cmd <- paste(exe_busco,
                       "-i", fn_fasta,
                       "-l", lineage,
                       "-o", dir_output,
                       "-m", mode,
                       "-c", thread)
    system(busco_cmd)
}