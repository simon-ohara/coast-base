export ZSH=/root/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(
  git
  vundle
  colorize
  colored-man-pages
  nvm
  themes
)

alias findme='grep -nir --exclude-dir=\node_modules\'
alias whouses='grep -lir --exclude-dir=\node_modules\'

source $ZSH/oh-my-zsh.sh
