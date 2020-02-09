#.zshrc
# If you come from bash you might have to change your $PATH.
if [[ "$OSTYPE" == "linux-gnu" ]]; then
        # Linux
    export PATH=$PATH:~/.linuxbrew/bin/
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
    export PATH="$HOME/.usr/bin:/usr/local/bin:/usr/local/sbin:$PATH"
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
    export PROJECT_HOME=~/PycharmProjects
    export AWS_PROFILE=tonynv
else
        # Unknown.
fi
export PATH="$HOME/.usr/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PYTHONBREAKPOINT="pudb.set_trace"
export PYTHON_CONFIGURE_OPTS="--enable-framework"


# Path to your oh-my-zsh installation.
export ZSH=~/.dotfiles/.ohmyzsh
export SHOW_AWS_PROMPT=false


ZSH_THEME="agnoster"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  aws
  vi-mode
  zsh-autosuggestions
  zsh-syntax-highlighting
  virtualenv
)


source $ZSH/oh-my-zsh.sh
bindkey -v

# Customize to your needs...
#Docker shortcuts
alias docker_cleanup_images='docker rmi $(docker images -a -q) -f'
alias docker_stopall='docker stop $(docker ps -a -q) '
alias docker_remove='docker rm  $(docker ps -a -q) -f'
alias docker_killall='docker stop $(docker ps -a -q) && docker rm  $(docker ps -a -q) -f'
alias docker_ecr_login=$(aws ecr get-login --region us-west-2 --no-include-email)
alias vi='nvim'
alias work='cd ~/work'
alias ls='/bin/ls -lhG'
alias ctags="`brew --prefix`/bin/ctags"
alias aws_get_account_id='aws sts get-caller-identity | jq -r ".Account"'
alias aws_set_account_id='export ACCOUNT=$(aws sts get-caller-identity | jq -r ".Account") ;echo "AWS ACCOUNT ID Exported => \$ACCOUNT ($ACCOUNT)"'
alias aws_set_region='if [[ $1 == "" ]]; then  echo "No region provided!! \n useage: aws_set_region<valid-aws-region"; else export REGION=$1 && echo "AWS REGION ID Exported => \$REGION ($REGION)"; fi'

# Dont use alias when using virtual envs
#alias python=python3
#alias pip=pip3
alias vim=/usr/local/bin/nvim

export EDITOR='vim'

#PROMPT="$PS1
#"

# virtualenvwrapper configs
# $ pip install virtualenvwrapper
# mkvirtualenv project_folder [This creates the project_folder folder inside ~/.python_venv.]
# mkproject project_name [Create new project and venv in ~/PycharmProjects]
# workon project_name
# rmvirtualenv venv [removes
#
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH


# directory for virtualenvs created using virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
# ensure all new environments are isolated from the site-packages directory
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
# use the same directory for virtualenvs as virtualenvwrapper
export PIP_VIRTUALENV_BASE=$WORKON_HOME
# makes pip detect an active virtualenv and install to it
export PIP_RESPECT_VIRTUALENV=true
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
source /usr/local/bin/virtualenvwrapper.sh

echo "initalizing..."
