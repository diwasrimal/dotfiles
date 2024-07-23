export CLICOLOR=1
export EDITOR="vim"

# Use colors for less, man, etc.
export LESS_TERMCAP_mb=$'\e[36m'     # begin bold
export LESS_TERMCAP_md=$'\e[36m'     # begin blink
export LESS_TERMCAP_so=$'\e[47;30m'  # begin reverse video
export LESS_TERMCAP_us=$'\e[4m'      # begin underline
export LESS_TERMCAP_me=$(tput sgr0; )
export LESS_TERMCAP_se=$'\e[0m'      # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'      # reset underline

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.spicetify"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Rust and go
# . "$HOME/.cargo/env"
export GOPATH="$HOME/Developer/tools/go"
export PATH="$PATH:$HOME/.cargo/bin:$GOPATH/bin"

# Node
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

# Java and Android
export JAVA_HOME="$(/usr/libexec/java_home)"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator"

# Zig
export PATH="$PATH:$HOME/Developer/tools/zig-macos-aarch64-0.11.0"

# Postgresql
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
