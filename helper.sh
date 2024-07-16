#!/usr/bin/bash

template_folder="./config/nginx/templates"
template_file="$template_folder/example.conf.template"

function modify() {
  # Edit and move template config file
  local new_path="$template_folder/$1.conf.template"
  sed -i.bak "s/example.local/$1/g" "$template_file"
  mv "$template_file" "$new_path"
  echo "Created $new_path"
  echo "Created backup $template_file.bak"

  # Make new environment variable file
  sed "s/example.local/$1/g" ./.env.example > .env
  echo "Created .env"

  exit 0
}

function revert() {
  original_backup="$template_file.bak"

  # Find and delete all files except the ssl template and the backup
  find_result=$(find "$template_folder" -type f -not -name "ssl-common.template" -not -wholename "$original_backup" -not -wholename "$template_file" -delete -print)

  if [ -n "$find_result" ]; then
    # find did find files to delete, so move back the backup to `example.conf.template`
    mv "$original_backup" "$template_file"
    echo "$find_result"
    echo "Restored $template_file"
    echo "Deleted $find_result"
  elif [ -f "$original_backup" ]; then
    # find didn't find files to delete, but the backup exists and needs to be moved
    mv "$original_backup" "$template_file"
    echo "Restored $template_file"
  else
    # If find doesn't find anything to delete
    echo "Nothing to revert in $template_folder"
  fi

  # Remove new .env file and move the .env.example.bak file back to .env.example
  if [ -f "./.env" ]; then
    rm "./.env"
    echo "Deleted .env"
  else
    echo "No .env to delete"
    exit 1
  fi

  exit 0
}

function display_help() {
  echo '
 Helper script to change the domain name from "example.local" to your choice of domain name. Backups of the original are made.
 Args:
  -m <hostname>: Modify "example.local" to the given hostname.
  -r: Revert.
  -h, -o: Options menu, i.e. this output.'

  exit "$1"
}

while getopts "hom:r" opt; do
  case "$opt" in
    h) 
      display_help 0
      ;;
    o)
      display_help 0
      ;;
    m)
      modify "$OPTARG"
      ;;
    r)
      revert
      ;;
    \?)
      display_help 1
      ;;
  esac
done

# Print help to screen if user runs this without arguments
display_help 0
