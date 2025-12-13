# zsh
export PATH=$HOME/.venv/bin:$HOME/.local/bin:$PATH
export PS1='%F{cyan}%B%~%b%f %F{green}$%f%F{red}$(git_branch_name)%f '
setopt prompt_subst
unsetopt beep 
eval "$(dircolors)"
bindkey -e
export KITTY_DISABLE_WAYLAND=1

#zsh-history
HISTFILE=~/.zsh_history    
HISTSIZE=100000           
SAVEHIST=100000           

#oh-my-zsh
# export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
# plugins=(git z zsh-autosuggestions)
# source $ZSH/oh-my-zsh.sh

# functions
function sd() {
  local file
  file=$(find . | fzf --query="$1" --select-1 --exit-0)
  if [[ -n $file ]]; then
    cd "$file"
  fi
}
function sf() {
  local file
  file=$(find . | fzf --query="$1" --select-1 --exit-0)
  if [[ -n $file ]]; then
    nano "$file"
  fi
}
function tm(){
  if tmux has-session -t kode 2>/dev/null; then
      tmux attach-session -t kode
  else
      tmux new-session -s kode
  fi
}
function git_branch_name(){
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
  :
  else
    echo ' '$branch''
  fi
}
function pws(){
  current_dir=$(pwd)
  win_path=$(wslpath -w "$current_dir")
  pwsh.exe -NoExit -Command "Set-Location '$win_path'"
}

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias rm='rm -i'
alias la='ls -ah'
alias ll='ls -lah'
alias lgrep='la | grep'
alias hgrep='history | grep'
alias check='watch -n 1'
