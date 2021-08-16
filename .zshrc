# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    python
    virtualenv
    docker
    docker-compose
    vscode
    brew
    gcloud
    zsh-syntax-highlighting
    zsh-autosuggestions
    git-flow
    git-flow-completion
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform


# my bash below ######################################################################################################################################################
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
source ~/.env

function install {
  which $1 &> /dev/null
  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    brew install $1
  fi
}

function disabledevverification()
{
    sudo spctl --master-disable
    echo "Developer verification Disabled"
}
function enabledevverification()
{
    sudo spctl --master-enable
    echo "Developer verification Enabled"
}

function remotedocker_active()
{
# The following line and options.conf is to setup access in Docker Host Daemon, dont forget to open port 2375 tcp on firewall
# sudo mkdir -p /etc/systemd/system/docker.service.d
# sudo nano /etc/systemd/system/docker.service.d/options.conf
            # [Service]
            # ExecStart=
            # ExecStart=/usr/bin/dockerd -H unix:// -H tcp://0.0.0.0:2375

# # Reload the systemd daemon.
# sudo systemctl daemon-reload

# # Restart Docker.
# sudo systemctl restart docker

    if [ "$1" ];then
        export DOCKER_HOST=tcp://$1:2375
        echo "Connected to Docker Daemon on $1:2375"
    else
        echo "Example of usage; rdocker ipOfDockerHost"
    fi
}
function remotedocker_deactive()
{
    echo "Deactivated Docker Daemon Remote from $DOCKER_HOST"
    unset DOCKER_HOST
}

function ness() {
    if [ "$1" ];then
	ping=`ping -c 1 $1 | grep bytes | wc -l`
        if [ "$ping" -gt 1 ];then
            sshpass -p $NESSPASSWORD ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" ness@"$1"
        else
            echo "PC-IOT Inacessivel, verifique a VPN, sua rede ou PC-IOT!"
        fi
    else
        echo "Example of usage; ness ipOfHost"
    fi # closing statement of if-else block
}

function winbox() {
    export PATH="/Applications/Wine Staging.app/Contents/Resources/wine/bin:$PATH"
    export FREETYPE_PROPERTIES="truetype:interpreter-version=35"
    export DYLD_FALLBACK_LIBRARY_PATH="/usr/lib:/opt/X11/lib:$DYLD_FALLBACK_LIBRARY_PATH"
    wine64 ~/Documents/winbox64.exe > /dev/null 2>&1 &

}

transfer(){
    if [ $# -eq 0 ]
    then
        echo "No arguments specified.\nUsage:\n transfer <file|directory>\n ... | transfer <file_name>">&2
        return 1
    fi
    if tty -s
    then
        file="$1"
        file_name=$(basename "$file")
        if [ ! -e "$file" ]
        then
            echo "$file: No such file or directory">&2
            return 1
        fi
        if [ -d "$file" ]
        then
            file_name="$file.zip"
            zip -r -q $file_name $file
            curl --progress-bar --upload-file "$file_name" "https://transfer.sh/$file_name" | tee /dev/null;
            echo
            rm -rf $file_name
        else
            curl --progress-bar --upload-file "$file" "https://transfer.sh/$file" | tee /dev/null;
            echo
        fi
    fi
}

function extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

function ..()
{
    for i in `seq 1 $1`;
    do
        cd ../
        ls
    done;
}

function mkcd()
{
	mkdir $1 && cd $1
}

function dbuild() {
    if [ "$1" ];then
        docker build -t "$1" .
    fi
}
function cupf() {
    if [ "$1" ];then
        docker-compose -f "$1" up -d
    fi
}
function cdownf() {
    if [ "$1" ];then
        docker-compose -f "$1" down -v
    fi
}
function cbuildf() {
    if [ "$1" ];then
        docker-compose -f "$1" build
    fi
}



alias d="docker"
alias dps='docker ps -a'
alias dstop='docker stop $(docker ps -aq)'
alias drmall='docker stop $(docker ps -aq) && docker rm -fv $(docker ps -aq)'
alias dexec='docker exec -it'
alias dtag='docker tag'
alias dips='docker images -a'
alias dpush='docker push'
alias drmi='docker rmi $(docker images --filter dangling=true -q)'
alias drmiall='docker rmi -f $(docker images -q)'

alias c='docker-compose'
alias cbuild='docker-compose build'
alias clogs='docker-compose logs --tail 50'
alias cup='docker-compose up -d'
alias cbup='docker-comspose up -d --build'
alias cps='docker-compose ps'
alias cdown='docker-compose down'
alias cdownv='docker-compose down -v'
alias cexec='docker-compose exec -it'


alias vs='code'
alias ls='ls -ahG'
alias ll='ls -lahG'
alias nn='nano'
alias rmf='rm -rf'
alias follow="tail -f -n +1"
alias biggest="du -h --max-depth=1 | sort -h"
alias pyvenv="virtualenv -p python3 venv && source venv/bin/activate"
alias pysource="source venv/bin/activate"
alias o="open ." # Open the current directory in Finder


export GREP_OPTIONS='--color=auto'
export GREP_COLOR='5;35;5'


export NICKNAME="UmSaldanha"


print_before_the_prompt () {
    dir=$PWD
    home=$HOME
    dir=${dir/"$HOME"/"~"}
    printf "\n $txtred%s: $bldpur%s $txtgrn%s\n$txtrst" "$HOST_NAME" "$dir" "$(vcprompt)"
}

echo 
echo -ne "Good Morning, $NICKNAME! It's "; date '+%A, %B %-d %Y'
echo
_cows=("head-in" "daemon" "meow" "moofasa" "moose" "turtle" "udder" "vader" "www" "satanic" "Stegosaurus" "beavis.zen" "blowfish" "sodomized" "telebears")
_cow=${_cows[$RANDOM % ${#_cows[@]} ]}
fortune | cowsay -f $_cow
