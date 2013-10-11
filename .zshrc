# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
#ZSH_THEME="crunch"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras sublime urltools taskwarrior)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:$HOME/.bin:/home/mentor/perl5/bin:/home/mentor/google_appengine:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-7-oracle/bin:/usr/lib/jvm/java-7-oracle/db/bin:/usr/lib/jvm/java-7-oracle/jre/bin:/home/mentor/soft/go/bin

# Go language
export GOROOT=$HOME/myrepo/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$GOROOT/gopath
export PATH=$PATH:GOPATH/bin

# Mentor_theme:

CRUNCH_BRACKET_COLOR="%{$fg[white]%}"
CRUNCH_TIME_COLOR="%{$fg[yellow]%}"
CRUNCH_UH_COLOR="%{$fg[magenta]%}"
CRUNCH_DIR_COLOR="%{$fg[cyan]%}"
CRUNCH_GIT_BRANCH_COLOR="%{$fg[green]%}"
CRUNCH_GIT_CLEAN_COLOR="%{$fg[green]%}"
CRUNCH_GIT_DIRTY_COLOR="%{$fg[red]%}"

# These Git variables are used by the oh-my-zsh git_prompt_info helper:
ZSH_THEME_GIT_PROMPT_PREFIX="$CRUNCH_BRACKET_COLOR:$CRUNCH_GIT_BRANCH_COLOR"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN=" $CRUNCH_GIT_CLEAN_COLOR✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" $CRUNCH_GIT_DIRTY_COLOR✗"

# Our elements:
CRUNCH_TIME_="$CRUNCH_BRACKET_COLOR{$CRUNCH_TIME_COLOR%T$CRUNCH_BRACKET_COLOR}%{$reset_color%}"
CRUNCH_USER_HOST_="$CRUNCH_BRACKET_COLOR [$CRUNCH_UH_COLOR%n@%m$CRUNCH_BRACKET_COLOR]%{$reset_color%}"

CRUNCH_DIR_="$CRUNCH_DIR_COLOR%~\$(git_prompt_info) "
CRUNCH_PROMPT="$CRUNCH_BRACKET_COLOR➭ "

# Put it all together!
PROMPT="$CRUNCH_TIME_$CRUNCH_USER_HOST_$CRUNCH_DIR_$CRUNCH_PROMPT%{$reset_color%}"

# Russify system
export LANG='ru_RU.UTF-8'
export LC_ALL='ru_RU.UTF-8'

#SO girls
alias alice='ssh alice.aqq.me'
alias amy='ssh amy.aqq.me'
alias diana='ssh diana.aqq.me'
alias eva='ssh eva.aqq.me'
alias fiona='ssh fiona.aqq.me'
alias frida='ssh frida.aqq.me'
alias jane='ssh jane.aqq.me'
alias kate='ssh kate.aqq.me'
alias lisa='ssh lisa.aqq.me'
alias monica='ssh monica.aqq.me'
alias petra='ssh petra.aqq.me'
alias rachel='ssh rachel.aqq.me'
alias vlatka='ssh vlatka.aqq.me'
alias yana='ssh yana.aqq.me'
alias zoe='ssh zoe.aqq.me'
alias dev='ssh mentodev.aqq.me'
