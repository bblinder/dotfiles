# Path to your oh-my-zsh installation.
export ZSH=/Users/bblinderman/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="theunraveler"

#ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH="/usr/local/sbin:$PATH"

eval $(thefuck --alias)

alias cwd='open -a Finder "$(pwd)"'
alias permissions_repair='sudo diskutil repairPermissions /' # Apparently only works on Mac OS X 10.10 and below.

alias restart_wifi='sudo ifconfig en0 down ; echo "Restarting WiFi..." ; sleep 4 ; echo "Done." ; sudo ifconfig en0 up'

alias youtube_download='~/Github/home-brews/Youtube_Downloader.py'

alias user_package_update='~/Github/home-brews/user_installed_crap.sh'

alias ENEMA='sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder'

alias bulk_git_update='for dir in ~/Github/* ; do (cd "$dir" && grup && git pull && git gc --auto); done'

alias weather='curl -s wttr.in/brooklyn'

alias thesaurus='~/Github/home-brews/thesaurus.sh'

[[ -s "$HOME/.local/share/marker/marker.sh" ]] && source "$HOME/.local/share/marker/marker.sh"

alias blinderpass='ssh -i ~/.ssh/blinderpass_rsa pi@[ip_address] -o ServerAliveInterval=5 -o ServerAliveCountMax=1'
alias blinderpass_sshfs='sshfs pi@[ip_address]:/path/to/sshfs/directory SSHFS -o IdentityFile=/Users/bblinderman/.ssh/blinderpass_rsa'

alias caps_convert="tr '[:upper:]' '[:lower:]'"

alias webshare='python -c "import SimpleHTTPServer;SimpleHTTPServer.test()"'

alias vim='mvim'

alias appstore_downloads='mdfind kMDItemAppStoreHasReceipt=1'

alias Cert_Check='~/Github/home-brews/cert_check.sh'

alias freewifi="sudo ifconfig en0 ether `openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'`"


transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
	tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }; alias transfer=transfer


man() {
		env \
			LESS_TERMCAP_mb=$(printf "\e[1;31m") \
			LESS_TERMCAP_md=$(printf "\e[1;31m") \
			LESS_TERMCAP_me=$(printf "\e[0m") \
			LESS_TERMCAP_se=$(printf "\e[0m") \
			LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
			LESS_TERMCAP_ue=$(printf "\e[0m") \
			LESS_TERMCAP_us=$(printf "\e[1;32m") \
				man "$@"
			}
