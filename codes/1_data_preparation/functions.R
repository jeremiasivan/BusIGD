# functions for codes/1_data_preparation

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

# function: generate VCF file between two FASTA sequences
f_generate_vcf <- function(refseq, targetseq, chromsome, id) {
    # reference and target sequences
    reference_seq <- unlist(strsplit(refseq, split=""))
    target_seq <- unlist(strsplit(targetseq, split=""))

    # find the variants
    variant_locations <- which(reference_seq != variant_seq)
    if (length(variant_locations) == 0) {
        return(NULL)
    }

    variant_ref_alleles <- reference_seq[variant_locations]
    variant_alt_alleles <- variant_seq[variant_locations]

    # convert into data.frame
    vcf_data <- data.frame(
        "CHROM" = chromosome,
        "POS" = variant_locations,
        "ID" = id,
        "REF" = as.character(variant_ref_alleles),
        "ALT" = as.character(variant_alt_alleles),
        "QUAL" = ".",
        "FILTER" = ".",
        "INFO" = ".",
        "FORMAT" = ".",
        stringsAsFactors = FALSE
    )

    return(vcf_data)
}