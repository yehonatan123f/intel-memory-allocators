#!/bin/bash

# Initialize the associative array to store average times
declare -A times

# Define the list of executable names
executables=(
    "test_target_map"
    "test_target_data"
    "test_omp_target_alloc"
    "test_omp_target_alloc_device"
    "test_omp_target_alloc_host"
    "test_omp_target_alloc_shared"
    "test_omp_target_memcpy"
)

export OMP_TARGET_OFFLOAD=MANDATORY
# Uncomment if needed:
# export ZE_AFFINITY_MASK=0.0
# export LIBOMPTARGET_DEBUG=1 

# Loop through the list of executables and execute each one
for exe in "${executables[@]}"; do
    echo "Running $exe..."
    # Run the executable and capture the output
    output=$(./"$exe")
    echo "$output"
    echo "Finished running $exe."
    echo "--------------------------------------"

    # Extract the average time and store it in the associative array
    avg_time=$(echo "$output" | grep "Avg time (s):" | awk '{print $NF}')
    times["$exe"]=$avg_time
done

# Print the results in a table format
echo "Summary of Execution Times:"
echo "--------------------------------------"
printf "%-30s %-10s\n" "Test" "Avg Time (s)"
echo "--------------------------------------"
for exe in "${executables[@]}"; do
    printf "%-30s %-10s\n" "$exe" "${times[$exe]}"
done
echo "--------------------------------------"
