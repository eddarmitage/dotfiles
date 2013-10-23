#! /bin/bash

#Detect the current OS
platform='unknown'
unamestr=`uname`

if [[ "$unamestr" == 'Linux' ]]
then
	platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]
then
	platform='mac'
fi

#Function for adding to $PATH so no duplicates
pathadd() {
	export 	PATH="$1:$PATH"
}

#~~~PATH updates~~~
if [[ "$platform" == 'linux' ]]
then
	pathadd "/home/edd/bin"
elif [[ "$platform" == 'mac' ]]
then
	pathadd "/usr/local/bin"
fi


#~~~Environment Variables~~~
export EDITOR=vim

if [[ "$platform" == 'linux' ]]
then
	export JAVA_HOME=/usr/lib/jvm/default-java
	export ORACLE_HOME=/usr/lib/oracle/11.2/client64
fi

#~~~Colours~~~
#Allow some shiny, shiny colours.
export CLICOLOR='true'

#Change LS colour scheme to be viewable on a black background.
export LSCOLORS=gxfxcxdxbxegedabagacad

#~~~Framework/Environments~~~
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

if [[ "$platform" == 'linux' ]]
then 
	export LD_LIBRARY_PATH=/usr/lib/oracle/11.2/client64/lib
fi

#~~~Aliasing~~~
alias ls='ls -G'
if [[ "$platform" == 'mac' ]]
then
	#Add alias to rmtrash
	hash rmtrash 2>&-
	if [ $? -eq 1 ]
	then
		echo >&2 "rmtrash command not found. trash not aliased."
	else
		alias trash=rmtrash
	fi
elif [[ "$platform" == 'linux' ]]
then
	alias pbcopy='xclip -selection clipboard'
	alias pbpaste='xclip -selection clipboard -o'
	stty erase ^?
	alias sqlplus='rlwrap sqlplus64'
fi

#~~~Autocompletions~~~
#Do funky autocompletion in SSH. Uses .bash_history
complete -W "$(echo $(grep '^ssh ' ~/.bash_history | sort -u | sed 's/^ssh //'))" ssh

if [[ "$platform" == 'mac' ]]
then
	#Do funky autocompletion for homebrew
	source `brew --prefix`/Library/Contributions/brew_bash_completion.sh
fi

