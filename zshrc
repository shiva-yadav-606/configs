# Preferences
export KITTY_DISABLE_WAYLAND=1
unsetopt beep 
bindkey -e
bindkey '^[[1;5C' forward-word     
bindkey '^[[1;5D' backward-word    
bindkey '^H' backward-kill-word

# zsh
export PS1=' %F{cyan}%~%f%F{red}$(git_branch_name)%f %F{green}$%f '
setopt prompt_subst
eval "$(dircolors)"
HISTFILE=~/.zsh_history    
HISTSIZE=100000           
SAVEHIST=100000           

# scripts
function sd() {
  local file
  file=$(find ~ | fzf --query="$1" --select-1 --exit-0)
  if [[ -n $file ]]; then
    cd "$file"
  fi
}
function sf() {
  local file
  file=$(find ~ | fzf --query="$1" --select-1 --exit-0)
  if [[ -n $file ]]; then
    code "$file"
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
    echo ' ('$branch')'
  fi
}
function pws(){
  current_dir=$(pwd)
  win_path=$(wslpath -w "$current_dir")
  pwsh.exe -NoExit -Command "Set-Location '$win_path'"
}
function psh(){
  git add .
  git commit -m "$1"
  git push 
}

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias rm='rm -i'
alias la='ls -ah'
alias ll='ls -lah'
alias lgrep='la | grep'
alias hgrep='history 1 | grep'
