#!/bin/bash -l
#PBS -N ERA5_stage
#PBS -A UHAR0026 
#PBS -l walltime=1:00:00
#PBS -j oe
#PBS -k eod
#PBS -q main
#PBS -l select=1:ncpus=1:mem=5GB
#PBS -l job_priority=economy

start_date="1989-07-01"
end_date="1989-07-31"

holding_dir="/glade/derecho/scratch/sweidman/era_regridded/"
output_dir="/glade/u/home/sweidman/scratch/for_globus/era_for_interp/"
file_list=()

# Function to check if date extracted from filename is within the date range
is_file_within_date_range() {
    local file="$1"
    local start_date="$2"
    local end_date="$3"

    # Extract date string from filename (expecting YYYYMMDD format)
    filename=$(basename "$file")
    file_date_raw=$(echo "$filename" | grep -oE '[0-9]{8}')
    
    # Convert to YYYY-MM-DD format
    file_date="${file_date_raw:0:4}-${file_date_raw:4:2}-${file_date_raw:6:2}"

    # Inclusive comparison using string logic
    if [[ "$file_date" < "$start_date" ]]; then
	return 1
    elif [[ "$file_date" > "$end_date" ]]; then
	return 1
    else
        return 0
    fi
}

# Loop through .nc files in the directory
for file in "$holding_dir"*.nc; do
    if is_file_within_date_range "$file" "$start_date" "$end_date"; then
    	file_list+=("$file")
    fi
done

# create tar file
tar -cvf "${output_dir}/nc_files_${start_date}_to_${end_date}.tar" "${file_list[@]}"

#if [ -f "${output_dir}/nc_files_${start_date}_to_${end_date}.tar" ]; then
#    echo "tar complete, removing holding files"
#    rm ${file_list[@]}
#fi
