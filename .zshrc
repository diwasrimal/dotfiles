autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{cyan}%?: %F{magenta}%~%f %F{yellow}${vcs_info_msg_0_}%f$ '

. ~/.config/shell/aliases
. ~/.config/shell/functions
