#!/bin/bash
mkdir -p pdfs/profiling_times

gnuplot -persist -c plots/plot_profiling_time.gp \
        profiling_times/profiling_rb-5mins-4threads-raw-4c.pdf \
        data/profiling_times/cataio_1_es_profiling_raw_4c.dat \
        "Bytes / second" "Filebench - 5mins - 4 threads - 4 consumer Raw";
open pdfs/profiling_times/profiling_rb-5mins-4threads-raw-4c.pdf

gnuplot -persist -c plots/plot_profiling_time.gp \
        profiling_times/profiling_rb-5mins-4threads-detailed-4c.pdf \
        data/profiling_times/cataio_1_es_profiling_detailed_4c.dat \
        "Bytes / second" "Filebench - 5mins - 4 threads - 4 consumer detailed";
open pdfs/profiling_times/profiling_rb-5mins-4threads-detailed-4c.pdf

gnuplot -persist -c plots/plot_profiling_time.gp \
        profiling_times/profiling_rb-5mins-4threads-detailed-plain-4c.pdf \
        data/profiling_times/cataio_1_es_profiling_detailed_plain_4c.dat \
        "Bytes / second" "Filebench - 5mins - 4 threads - 4 consumer detailed plain";
open pdfs/profiling_times/profiling_rb-5mins-4threads-detailed-plain-4c.pdf

gnuplot -persist -c plots/plot_profiling_time.gp \
        profiling_times/profiling_rb-5mins-4threads-detailed-kernelhash-4c.pdf \
        data/profiling_times/cataio_1_es_profiling_detailed_kernelhash_4c.dat \
        "Bytes / second" "Filebench - 5mins - 4 threads - 4 consumer detailed kernelhash";
open pdfs/profiling_times/profiling_rb-5mins-4threads-detailed-kernelhash-4c.pdf

gnuplot -persist -c plots/plot_profiling_time.gp \
        profiling_times/profiling_rb-5mins-4threads-detailed-kernelhash-paths-4c.pdf \
        data/profiling_times/cataio_1_es_profiling_detailed_kernelhash_paths_4c.dat \
        "Bytes / second" "Filebench - 5mins - 4 threads - 4 consumer detailed kernelhash paths";
open pdfs/profiling_times/profiling_rb-5mins-4threads-detailed-kernelhash-paths-4c.pdf

gnuplot -persist -c plots/plot_profiling_time.gp \
        profiling_times/profiling_rb-5mins-4threads-detailed-all-4c.pdf \
        data/profiling_times/cataio_1_es_profiling_detailed_all_4c.dat \
        "Bytes / second" "Filebench - 5mins - 4 threads - 4 consumer detailed kernelhash all";
open pdfs/profiling_times/profiling_rb-5mins-4threads-detailed-all-4c.pdf

gnuplot -persist -c plots/plot_profiling_time.gp \
        profiling_times/profiling_rb-5mins-4threads-detailed-all-coff-4c.pdf \
        data/profiling_times/cataio_1_es_profiling_detailed_all_coff_4c.dat \
        "Bytes / second" "Filebench - 5mins - 4 threads - 4 consumer detailed kernelhash all (content off)";
open pdfs/profiling_times/profiling_rb-5mins-4threads-detailed-all-coff-4c.pdf