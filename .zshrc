eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# Git prompt configuration
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '%F{yellow}[%b%f%F{red}%u%c%f%F{yellow}]%f'
zstyle ':vcs_info:git:*' actionformats '%F{green}%b%f %F{yellow}(%a)%f'
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git:*' stagedstr '+'
setopt prompt_subst

# Show the home-relative path then git info
# PROMPT='%F{cyan}%~%f${vcs_info_msg_0_}%F{green}$%f '

# The defautl PROMPT
# PROMPT='%n@%m %1~ %#'

# Show user@mac, the current directory, then git info
PROMPT='%n@%m %F{cyan}%1~%f${vcs_info_msg_0_}%F{green}$%f '

# Aliases
alias gt="git status"
alias ga="git add"
