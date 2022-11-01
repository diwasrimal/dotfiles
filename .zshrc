autoload -U colors && colors
setopt autocd
setopt interactive_comments

precmd () {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    branch_name="$(git rev-parse --abbrev-ref HEAD)"
    PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%M %{$fg[magenta]%}%c%{$fg[blue]%}] %{$fg[white]%} %{$fg[yellow]($branch_name)%} %{$reset_color%}➜%b "
  else
    PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%M %{$fg[magenta]%}%c%{$fg[blue]%}] %{$reset_color%}➜%b "
  fi

}

# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
