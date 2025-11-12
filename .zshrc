# var's
export PATH=$HOME/.venv/bin:$HOME/.local/bin:$PATH
unsetopt beep 
setopt prompt_subst
export PS1='%F{cyan}%B%~%b%f %F{green}$%f%F{red}$(git_branch_name)%f '

# operations
function sd() {
  local file
  file=$(find . | fzf --query="$1" --select-1 --exit-0)
  if [[ -n $file ]]; then
    cd "$file"
  fi
}
function s() {
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
function pws(){
  current_dir=$(pwd)
  win_path=$(wslpath -w "$current_dir")
  pwsh.exe -NoExit -Command "Set-Location '$win_path'"
}
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
  :
  else
    echo '('$branch')'
  fi
}

# Aliases
alias ls='ls --color=auto -hv'
alias grep='grep --color=auto'
alias diff='diff --color=auto'