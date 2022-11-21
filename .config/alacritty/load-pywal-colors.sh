#!/bin/sh
# Alacritty Color Export
# Version 0.1.1
# github.com/egeesin
#
# Exports generated Wal colors to Alacritty config
# WARNING: Don't forget to backup your Alacritty config
# before execute this script!
#
# Dependencies: grep, sed
# Usage: ./script.sh
#        ./script.sh <config yml>

# Function to display error and quit
die() {
  printf "ERR: %s\n" "$1" >&2
  exit 1
}

DEFAULT_MACOS_CONFIG="$HOME"/.config/alacritty/colors.yml

# Wal generates a shell script that defines color0..color15
SRC="$HOME"/.cache/wal/colors.sh

[ -e "$SRC" ] || die "Wal colors not found, exiting script. Have you executed Wal before?"
printf "Colors found, source ready.\n"

READLINK=$( command -v greadlink || command -v readlink )

# Get config file
if [ -n "$1" ]; then
  [ -e "$1" ] || die "Selected config doesn't exist, exiting script."
  printf "Config found, destination ready.\n"
  CFG=$1
  [ -L "$1" ] && {
    printf "Following symlink to config...\n"
    CFG=$($READLINK -f "$1")
  }
else
  # Default config path in Mac systems
  [ -e "$DEFAULT_MACOS_CONFIG" ] || die "Alacritty config not found, exiting script."

  CFG="$DEFAULT_MACOS_CONFIG"
  [ -L "$DEFAULT_MACOS_CONFIG" ] && {
    printf "Following symlink to config...\n"
    CFG=$($READLINK -f "$DEFAULT_MACOS_CONFIG")
  }
fi

# Get hex colors from Wal cache
# No need for shellcheck to check this, it comes from pywal
# shellcheck disable=SC1090
. "$SRC"

# Create temp file for sed results
tempfile=$(mktemp)
trap 'rm $tempfile' INT TERM EXIT

# Delete existing color declarations generated by this script
# If begin comment exists
if grep -q '^# BEGIN ACE' "$CFG"; then
  # And if end comment exists
  if grep -q '^# END ACE' "$CFG"; then
    # Delete contents of the block
    printf "Existing generated colors found, replacing new colors...\n"
    sed '/^# BEGIN ACE/,/^# END ACE/ {
      /^# BEGIN ACE/! { /^# END ACE/!d; }
    }' "$CFG" > "$tempfile" \
      && cat "$tempfile" > "$CFG"
  # If no end comment, don't do anything
  else
    die "No '# END ACE' comment found, please ensure it is present."
  fi
# If no begin comment found
else
  # Don't do anything and notify user if there's an end comment in the file
  ! grep -q '^# END ACE' "$CFG" || die "Found '# END ACE' comment, but no '# BEGIN ACE' comment found. Please ensure it is present."
  printf "There's no existing 'generated' colors, adding comments...\n";
  printf '# BEGIN ACE\n# END ACE' >> "$CFG";
fi

# Write new color definitions
# We know $colorX is unset, we set it by sourcing above
# shellcheck disable=SC2154
{ sed "/^# BEGIN ACE/ r /dev/stdin" "$CFG" > "$tempfile" <<EOF
colors:
  primary:
    background: '$color0'
    foreground: '$color7'
  cursor:
    text:       '$color0'
    cursor:     '$color7'
  normal:
    black:      '$color0'
    red:        '$color1'
    green:      '$color2'
    yellow:     '$color3'
    blue:       '$color4'
    magenta:    '$color5'
    cyan:       '$color6'
    white:      '$color7'
  bright:
    black:      '$color8'
    red:        '$color9'
    green:      '$color10'
    yellow:     '$color11'
    blue:       '$color12'
    magenta:    '$color13'
    cyan:       '$color14'
    white:      '$color15'
EOF
} && cat "$tempfile" > "$CFG" \
  && rm "$tempfile"
trap - INT TERM EXIT
printf "'%s' exported to '%s'\n" "$SRC" "$CFG"
