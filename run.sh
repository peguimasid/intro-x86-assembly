#!/bin/bash

# Check if a file argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <assembly-file>"
  exit 1
fi

# Get the filename without the extension
filename=$(basename -- "$1")
filename="${filename%.*}"

# Assemble the file
nasm -f elf64 "$1" -o "${filename}.o"
if [ $? -ne 0 ]; then
  echo "Assembly failed"
  exit 1
fi

# Link the object file
ld "${filename}.o" -o "${filename}.out"
if [ $? -ne 0 ]; then
  echo "Linking failed"
  cleanup
  exit 1
fi

# Run the executable
./"${filename}.out"
run_status=$?

# Cleanup function to remove object files and executable
cleanup() {
  rm -f "${filename}.o" "${filename}.out"
}

# Call cleanup function
cleanup

# Exit with the status of the executable
exit $run_status
