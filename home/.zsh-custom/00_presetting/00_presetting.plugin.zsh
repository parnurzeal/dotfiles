# This script runs first before any other plugin.

# For adding available cmd tools to A's list.
check_cmd_exists_and_add_note() {
  if type "$1" > /dev/null ; then
    export A_COMMANDS="${A_COMMANDS}\n$2"
  fi
}
