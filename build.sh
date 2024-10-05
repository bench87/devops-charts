#!/bin/bash

# Get directory name as an argument
input_dir=$1

# Current working directory
wd=$(pwd)

# If no directory is provided, target all directories
if [ -z "$input_dir" ]; then
  directories=(*)
else
  # Check if the provided directory exists
  if [ ! -d "$input_dir" ]; then
    echo "Error: Directory '$input_dir' does not exist."
    exit 1
  fi
  directories=("$input_dir")
fi

# Loop through directories
for dir in "${directories[@]}"; do
  # Check if it is a directory
  if [ -d "$dir" ]; then
    overlays="$wd/$dir/overlays"

    # Check if overlays directory exists
    if [ ! -d "$overlays" ]; then
      echo "Error: Overlays directory '$overlays' does not exist."
      continue
    fi

    target_paths=$(ls "$overlays")

    for phase in $target_paths; do
      echo "kustomize build $dir for $phase"
      overlay_dir="$overlays/$phase"
      dist="$overlay_dir/dist"

      rm -rf "$dist"
      mkdir -p "$dist"

      kustomize build --enable-helm "$overlay_dir" | yq --split-exp "\"$dist/\" + .kind + \"-\" + .metadata.name + \".yaml\"" --no-doc
    done
  fi
done
