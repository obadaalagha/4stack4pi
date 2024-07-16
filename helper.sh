#!/usr/bin/bash

template_folder="./config/nginx/templates"
template_file="$template_folder/example.conf.template"

function modify() {
  # Edit and move template config file
  sed -i.bak "s/example.local/$1/g" "$template_file"
  mv "$template_file" "$template_folder/$1.template"
  echo "Created $template_file"

  # Edit and move environment variable file
  sed -i.bak "s/example.local/$1/g" ./.env.example
  mv ./.env.example ./.env
  echo "Created .env"

  exit 0
}

function revert() {
  original_backup="$template_file.bak"

  # Find and delete all files except the ssl template and the backup
  find_result=$(find "$template_folder" -type f -not -name "ssl-common.template" -not -wholename "$original_backup" -delete -print)

  # If find doesn't find anything to delete
  if [ -z "$find_result" ]; then
    echo "Nothing to revert in $template_folder"
    exit 1
  else
    echo "Deleted $find_result"
  fi

  # find did find files to delete, so move back the backup to `example.conf.template`
  mv "$original_backup" "$template_file"
  echo "Restored $template_file"
  echo ""

  # Remove new .env file and move the .env.example.bak file back to .env.example
  rm "./.env"
  mv "./.env.example.bak" "./.env.example"
  echo "Deleted .env"
  echo "Restored .env.example"

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

display_help 0
