### MY BASH CONFIG ###

### FUNCTIONS ###
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] &&
	. /usr/share/bash-completion/bash_completion

if [[ -f ~/.bash/fzf-bash-completion.sh && "${FZF_TAB}" == 'on' ]]; then
	export FZF_COMPLETION_OPTS="--preview-window=right:0%:hidden"
	source ~/.bash/fzf-bash-completion.sh
	bind -x '"\t": fzf_bash_completion'
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
	PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export TERM=xterm-256color
# eval "$(starship init bash)"
eval "$(oh-my-posh --init --shell bash --config ~/.oh-my-posh/themes/atomic.omp.json)"

### ALIASES ###-
# Neovim config
alias opennvim="cd ~/.config/nvim"
alias openkitty="cd ~/.config/kitty"
alias editbash="nvim ~/.bashrc"
alias vim="nvim"
alias gs="git status"
alias cls="clear"

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"

# Show open ports
alias openports='netstat -nape --inet'

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Alias's for multiple directory listing commands
alias la='ls -Alh'               # show hidden files
alias ls='ls --color=always'     # add colors and file type extensions
alias lx='ls -lXBh'              # sort by extension
alias lk='ls -lSrh'              # sort by size
alias lc='ls -lcrh'              # sort by change time
alias lu='ls -lurh'              # sort by access time
alias lr='ls -lRh'               # recursive ls
alias lt='ls -ltrh'              # sort by date
alias lm='ls -alh |more'         # pipe through 'more'
alias lw='ls -xAh'               # wide listing format
alias ll='ls -Fls'               # long listing format
alias labc='ls -lap'             #alphabetical sort
alias lf="ls -l | egrep -v '^d'" # files only
alias ldir="ls -l | egrep '^d'"  # directories only

# List Aliases
listalias() {
	echo "aliases list"
	alias | awk -F'[ =]' '{print "- " $2}'
}

# Alert for long runnig commands
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

set colored-stats on

### HISTORY ###
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth
shopt -s histappend

### PATH ###
PATH="/home/alex/perl5/bin${PATH:+:${PATH}}"
export PATH
PERL5LIB="/home/alex/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL5LIB
PERL_LOCAL_LIB_ROOT="/home/alex/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_LOCAL_LIB_ROOT
PERL_MB_OPT="--install_base \"/home/alex/perl5\""
export PERL_MB_OPT
PERL_MM_OPT="INSTALL_BASE=/home/alex/perl5"
export PERL_MM_OPT

export PATH="/usr/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/gems:$PATH"
export PATH="/usr/bin/core_perl:$PATH"
