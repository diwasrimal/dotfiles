# Completion
autoload -U compinit
zstyle ':completion:*' menu select
compinit

# Prompt with version control
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{cyan}%n%f %F{magenta}%3~%f %F{yellow}${vcs_info_msg_0_}%f%(?.%f.%F{red})%%%f '
#PS1="%F{magenta}%1~%f %f%(?.%f.%F{red})%#%f "

# Load custom aliases and functions
. ~/.config/shell/aliases
. ~/.config/shell/functions

# Settings for vi mode
bindkey -v
bindkey '^A' beginning-of-line
bindkey '^B' backward-char
bindkey '^E' end-of-line
bindkey '^F' forward-char
bindkey '^K' kill-line
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^U' backward-kill-line
bindkey '^W' backward-kill-word
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search
bindkey '^Y' yank
bindkey '^_' undo
bindkey '^?' backward-delete-char
bindkey '^[^?' backward-kill-word

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
