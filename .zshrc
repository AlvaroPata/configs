# Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Path to .config
export XDG_CONFIG_HOME="$HOME/.config"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
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
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
  npm
  nvm
  git
  z
  github
  history
  macos
  pip
  pyenv
  pylint
  python
  zsh-autosuggestions
  zsh-syntax-highlighting
  vscode
  vi-mode
  taskwarrior
)

# NVM plugin
zstyle ':omz:plugins:nvm' autoload yes
zstyle ':omz:plugins:nvm' silent-autoload yes # optionally remove the output generated by NVM when autoloading

export RPS1="%{$reset_color%}"

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='lvim'
else
  export EDITOR='lvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconf="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias vim=nvim
alias runs="python manage.py runserver"
alias djs="python manage.py shell -i ipython"
alias posh="poetry shell"
alias bubu="brew update && brew upgrade"
alias gbcp="git rev-parse --abbrev-ref HEAD | pbcopy" # Git (copy current branch name to clipboard)
alias gg="lazygit"

# Pyenv
eval "$(pyenv init -)"

# Completions!
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Don't show the pyenv env in the prompt, it will disappear from later pyenv versions anyway
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# Using Vim mode
bindkey -v
# Use vim to edit command
bindkey '^x^x' edit-command-line

# FZF config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Ruby
export SDKROOT=$(xcrun --show-sdk-path)
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.0.0/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/Users/alephpei/.gem/ruby/3.0.0/bin:$PATH"
export PATH="./bin:$PATH"

# node
export PATH="./node_modules/.bin:$PATH"

# GNU "make" has been installed as "gmake".
# If you need to use it as "make", you can add a "gnubin" directory
# to your PATH from your bashrc like:
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"

# Function to display path elements as new lines
alias path="sed 's/:/\n/g' <<< '$PATH'"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'; fi

# Poetry
export PATH="/Users/alephpei/.local/bin:$PATH"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Use ipdb as the default debugging tool for Python breakpoint
export PYTHONBREAKPOINT=ipdb.set_trace

# LanguageTool
export PATH="/usr/local/opt/openjdk/bin:$PATH"

export PATH="/usr/local/sbin:$PATH"

# MongoDB
export PATH="/usr/local/opt/mongodb-community@4.4/bin:$PATH"

# Java JDK ( for firebase emulator )
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Atheneum
set -o allexport;
export ATHENEUM_HOME="$HOME/Code/Atheneum"
export ATHENA_ONE="$ATHENEUM_HOME/athena-one"

alias pui="cd $ATHENA_ONE && nx serve platform-ui" 
alias papi="cd $ATHENA_ONE && nx serve platform-api"

# source "$ATHENEUM_HOME/atheneum-offline/setup.sh"
set +o allexport;
alias ath="cd $ATHENEUM_HOME"
alias reset-bcrypt="cd ~/Code/Atheneum/legacy-platform; rm -rf node_modules/bcrypt/; cp -r node_modules/bcryptjs node_modules/bcrypt; echo 'bcryptjs reset'"

updateIfChanged () {
    tmpfile=$(mktemp /tmp/changed_services.XXXXXX)

    # Pull all changes first
    for service in $ATHENEUM_HOME/*/;
    do
        echo -e "\e[1;33mPulling latest changes in directory: $service\e[0m"
        cd $service && git checkout master
        BEFORE_PULL=$(git rev-parse HEAD)
        git pull
        AFTER_PULL=$(git rev-parse HEAD)
        echo -e "\e[1;33mFinished pulling in directory: $service\e[0m"

        if [ "$BEFORE_PULL" != "$AFTER_PULL" ]; then
            echo "$service" >> $tmpfile
        fi
    done

    # Reinstall npm packages where there were changes
    if [ -s "$tmpfile" ]; then
        while IFS= read -r service
        do
            echo
            echo -e "\e[1;33mRebuilding node_modules for: $service\e[0m"
            cd $service
            if [ -f package-lock.json ]; then
                rm package-lock.json
            fi
            if [ -d node_modules ]; then
                rm -rf node_modules
            fi
            if [ -f package.json ]; then
              echo -e "\e[1;33mInstalling dependencies for: $service\e[0m" 
              npm i --legacy-peer-deps
            else
              echo -e "\e[1;33mSkipping: No package.json found in $service\e[0m"
            fi
            echo -e "\e[1;33mFinished rebuilding node_modules for: $service\e[0m"
        done < "$tmpfile"
    else
        echo -e "\e[1;33mNo services had changes.\e[0m"
    fi

    rm "$tmpfile"
    cd
    echo -e "\e[1;33mFinished pulling and potentially rebuilding node_modules for all directories.\e[0m"
}


legacy_env(){ 
    set -o allexport;
    source "$ATHENEUM_HOME/atheneum-offline/setup.sh"
    set +o allexport;
}
stage2_es_proxy(){
    npx kill-port 9200
    ssh -v -4 -t -L 9200:10.13.5.56:9200 atheneum-staging -fN
}
new_es_proxy(){
    npx kill-port 9201
    ssh -N -L 9201:10.13.5.25:9200 atheneum-staging
}
stage2_db_proxy(){
    npx kill-port 3306
    ssh -v -4 -t -L 3306:legacy-mysql.test1.atheneum-dev.com:3306 atheneum-staging -fN
}
stage2_redis_proxy(){
    npx kill-port 6379
    ssh -v -4 -t -L 6379:master.apr1ala3su29zvpm.hpxyke.euc1.cache.amazonaws.com:6379 atheneum-staging -fN
}
stage2_redis(){
    redis-cli -u rediss://B05kp7cjOluBw6G6dO2ro1kjP9f2Aqxj@127.0.0.1:6379
}


nuke_npm ()
{
  if [[ -f "package-lock.json" && -d "node_modules" ]]; then
    read -r "reply?💣 Are you sure you want to nuke this package? [y/N] "
    if [[ $reply =~ ^[yY] ]]; then
      echo "📦 Deleting package-lock.json..."
      rm -f package-lock.json
      echo "🗑️ Deleting node_modules..."
      rm -rf node_modules
      if [[ $? -ne 0 ]]; then
        echo "❌ Error deleting node_modules"
        return 1
      fi
      echo "🧼 Cleaning cache..."
      npm cache clean --force
      if [[ $? -ne 0 ]]; then
        echo "❌ Error cleaning cache"
        return 1
      fi
      echo "🔧 Installing deps..."
      npm i
      if [[ $? -ne 0 ]]; then
        echo "❌ Error installing dependencies"
        return 1
      fi
      echo "🎉 Success!"
    else
      echo "🛑 Cancelled"
    fi
  else
    echo "⛔️ This is not the right place to this..."
  fi
}

# EZA -- Better ls
alias ls="eza --long --color=always --git --no-filesize --icons=always --no-time --no-user --no-permissions"

# TheFuck -- command correction tool
eval $(thefuck --alias)

# Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
