# quote() {
#     case $((RANDOM % 3)) in
#         0) figlet "$(whoami)" | lolcat ;;
#         1) cowsay -f $(ls /usr/share/cowsay/cows | shuf -n1 --random-source=/dev/urandom) "$(fortune -s)" | lolcat ;;
#         2) cowthink -f $(ls /usr/share/cowsay/cows | shuf -n1 --random-source=/dev/urandom) "$(fortune -s)" | lolcat ;;
#     esac
# }

[[ -z $OMPCODE ]] && fastfetch 2>/dev/null
# quote 2>/dev/null

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

plugins=(git sudo fzf zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export EDITOR='nvim'

alias ls='eza --icons auto'
alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'
alias mkdir='mkdir -p'
alias rg='rg -S'
alias vim='nvim'

if [[ $TERM == 'xterm-kitty' ]] && command -v kitten &> /dev/null; then
    alias copy='kitten clipboard'
    alias paste='kitten clipboard -g'
    if  [[ ! -n $SSH_CONNECTION ]]; then
        alias ssh='kitten ssh'
    fi
else
    alias copy='wl-copy'
    alias paste='wl-paste'
fi

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
