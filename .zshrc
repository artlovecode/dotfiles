# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH_DISABLE_COMPFIX=true
export ZSH="/Users/audunmo/.oh-my-zsh/"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="fino"
if [[ -v ENV ]];
then
  PROMPT+="(${ENV}) "
fi


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
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
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  git-auto-fetch
  git-extras
  golang
  terraform
  vi-mode
  gcloud
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions


alias vim="nvim"
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

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
export PATH="$HOME/neovim/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/Users/audunmo/bin:$PATH"

export FZF_DEFAULT_COMMAND="rg --files --hidden"

alias ezsh="vim ~/.zshrc && source ~/.zshrc"
alias evim="vim ~/.config/nvim/init.vim"

export DOCKER_HOST=tcp://localhost:2375



# docker
da() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}
# Select a running docker container to stop
ds() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}
# Select a docker container to remove
drm() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker rm "$cid"
}


vg() {
  local file
  local line

  read -r file line <<<"$(ag --nobreak --noheading $@ | fzf -0 -1 | awk -F: '{print $1, $2}')"

  if [[ -n $file ]]
  then
     vim $file +$line
  fi
}

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#######################################zplug#################################################
#############################################################################################
[[ -d ~/.zplug  ]] || git clone https://github.com/zplug/zplug ~/.zplug

source ~/.zplug/init.zsh

zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
zplug 'wfxr/forgit'
zplug 'zsh-users/zsh-autosuggestions'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose


#############################################################################################
#############################################################################################


[[ -s "$HOME/.local/share/marker/marker.sh"  ]] && source "$HOME/.local/share/marker/marker.sh"


######################################custom#################################################
#############################################################################################

fe() (
  IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
    [[ -n "$files"  ]] && ${EDITOR:-vim} "${files[@]}"
)

fgco() {
  ag $1 | xargs git checkout 
}

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fdr - cd to selected parent directory
fdr() {
  local declare dirs=()
  get_parent_dirs() {
    if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
    if [[ "${1}" == '/' ]]; then
      for _dir in "${dirs[@]}"; do echo $_dir; done
    else
      get_parent_dirs $(dirname "$1")
    fi
  }
  local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | fzf --tac)
  cd "$DIR"
}

fem() {
  ag $1 --files-with-matches | fe
}

# fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fco - checkout git branch/tag
fco() {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
        --ansi) || return
  git checkout $(awk '{print $2}' <<<"$target" )
}


# fco_preview - checkout git branch/tag, with a preview showing the commits between the tag/branch and HEAD
fco_preview() {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
        --ansi --preview="git --no-pager log -150 --pretty=format:%s '..{2}'") || return
  git checkout $(awk '{print $2}' <<<"$target" )
}

fh() {
    eval $( ([ -n "$ZSH_NAME"  ] && fc -l 1 || histdb --status 0 --limit 10000) | fzf +s --tac | gsed -r 's/ *[0-9]*\*? *//' | gsed -r 's/\\/\\\\/g' )
}

ffixup() {
  git log master.. --decorate --oneline $BRANCH_NAME | fzf | awk '{print $1}' | xargs git commit --fixup
}

branch() {
  git checkout -b $1
}

gshow() {
  local COMMIT=""
  if $1 == ""
  then
    COMMIT="HEAD"
  else
    COMMIT=$1
  fi
  git diff-tree --no-commit-id --name-only -r commit
}

alias tagsearch='vim -t "$(cut -f1 tags | tail +7 | uniq | fzf)"'

HISTDB_TABULATE_CMD=(sed -e $'s/\x1f/\t/g')
source $HOME/.oh-my-zsh/custom/plugins/zsh-histdb/sqlite-history.zsh
autoload -Uz add-zsh-hook
#############################################################################################
#############################################################################################
vimReplace() {
  ag $1 --files-with-matches | xargs nvim "+:argdo $2;" "+:argdo update"
}


chenv() {
  if [[ -f "Taskfile.yml" ]];
  then
    read -A envsArr=$(cat Taskfile.yml | yq r - vars.ENVIRONMENTS)

    if [[ -z envsArr ]]
    then 
      echo "No envs found in taskfile"
    else
      echo "Found envs!"
      IFS=' ' read -A envArr
      echo $envArr[2]

      select env in envsArr
      do
        case $env in envsArr)
          export ENV=$env
          PROMPT+="(${ENV}) "
          break;;
        *)
          echo "Invalid environment selected"
        esac
      done
    fi
  else
    echo "No taskfile found"
  fi
}

fzf_checkout() {
  git log --oneline | fzf | awk '{ print $2 }'|xargs git checkout
}

autosquash() {
  git rebase --interactive --autosquash $1~1
}

tagedit() {
  git log
}



export CLOUDSDK_PYTHON=python2

# export GOOGLE_APPLICATION_CREDENTIALS=~/.config/rm-3pi-dev-815f6d81bc2d.json
# export GOOGLE_CREDENTIALS=~/.config/rm-3pi-dev-815f6d81bc2d.json
export GOOGLE_APPLICATION_CREDENTIALS=~/.config/remarkable-terraform-admin-c745b94112fd.json
export GOOGLE_CREDENTIALS=~/.config/remarkable-terraform-admin-c745b94112fd.json

export GOPATH="/Users/audunmo/go"
export PATH="$PATH:$GOPATH"
export PATH="$PATH:$GOPATH/bin"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/audunmo/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/audunmo/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/audunmo/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/audunmo/google-cloud-sdk/completion.zsh.inc'; fi

export GOOGLE_CLOUD_PROJECT="rm-3pi-dev"

_zsh_autosuggest_strategy_histdb_top() {
    local query="select commands.argv from
history left join commands on history.command_id = commands.rowid
left join places on history.place_id = places.rowid
where commands.argv LIKE '$(sql_escape $1)%'
group by commands.argv
order by places.dir != '$(sql_escape $PWD)', count(*) desc limit 1"
    suggestion=$(_histdb_query "$query")
}

ZSH_AUTOSUGGEST_STRATEGY=histdb_top

alias vt="vim +:Tags"
