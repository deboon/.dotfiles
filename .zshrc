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
DISABLE_AUTO_UPDATE="true"

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
plugins=(git git-extras sublime urltools taskwarrior pass)

source $ZSH/oh-my-zsh.sh
[[ ( -f /usr/local/bin/aws_zsh_completer.sh ) ]] && source /usr/local/bin/aws_zsh_completer.sh

if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

# Customize to your needs...
export PATH=$PATH:$HOME/.bin:$HOME/.bin_paths:/home/mentor/perl5/bin:/home/mentor/google_appengine:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-7-oracle/bin:/usr/lib/jvm/java-7-oracle/db/bin:/usr/lib/jvm/java-7-oracle/jre/bin

# Go language
#export GOROOT=$HOME/dev/go
export PATH=$PATH:$HOME/dev/go/bin
#export GOPATH=$HOME/dev/gopath
export PATH=$PATH:$HOME/go/bin

# Custom bin dir
export PATH=$PATH:$HOME/bin

 #Mentor_theme:

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

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

#alias grep="/bin/grep $GREP_OPTIONS"
#unset GREP_OPTIONS

# livestreamer for twitch
tw() {if [[ -z $2 ]]; then quality="best"; else quality=$2; fi; livestreamer --default-stream $quality "twitch.tv/$1"}
alias tw=tw

# useful random func
me_rand() {cat /dev/urandom | tr -dc '0-9a-zA-Z' | head -c$1}

# warper for s.mne.li
warp() {if [[ -z $1 ]]; then echo "no file specified\n"; else file=$1; curl -H "Expect:" --upload-file $file "http://s.mne.li/$file"; fi;}
alias warp=warp

sshadd() {if [[ -z $1 ]]; then echo "no file specified\n"; else file=$1; ssh-add -t 1h ~/.ssh/$file; fi;}
alias sshadd=sshadd

sshdel() {if [[ -z $1 ]]; then echo "no file specified\n"; else file=$1; ssh-add -d ~/.ssh/$file; fi;}
alias sshdel=sshdel

#SO girls
alias alice='ssh alice.dd'
alias amy='ssh amy.dd'
alias diana='ssh diana.dd'
alias eva='ssh eva.dd'
alias fiona='ssh fiona.dd'
alias frida='ssh frida.dd'
alias jane='ssh jane.dd'
alias kate='ssh kate.dd'
alias lisa='ssh lisa.dd'
alias monica='ssh monica.dd'
alias petra='ssh petra.dd'
alias rachel='ssh rachel.aqq.me'
alias vlatka='ssh vlatka.dd'
alias yana='ssh yana.dd'
alias zoe='ssh zoe.dd'
alias siri='ssh siri.dd'

