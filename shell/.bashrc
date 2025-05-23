# source the files in the shell directory
for file in ~/.dotfiles/shell/.{aliases,exports,functions}; do
   [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -x "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
   debian_chroot=$(cat /etc/debian_chroot)
fi

# Uncomment for a color prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
   if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
   # We have color support; assum it's compliant with Ecma-48
   # (ICO/IEC-6429). (Lack of such support is extermely rar, and such
   # a case would tend to support setf rather than setaf.)
   color_prompt=yes
   else
   color_prompt=
   fi
fi

if [ "$color_prompt" = yes ]; then
   PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[\033[01;35m\]$(parse_git_branch)\[\033[00m\]\$ '
else
   PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in xterm*|rxvt*)
   PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
   ;;
*)
   ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
   test -r ~/.dircolor && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
   alias ls='ls --color=auto'
   #alias dir='dir --color=auto'
   #alias vdir='vdir --color=auto'

   #alias grep='grep --color=auto'
   #alias fgrep='fgrep --color=auto'
   #alias egrep='egrep --color=auto'
fi

# Extra paths
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
#export PATH="$HOME/.local/share/fnm:$PATH"
export PATH="$HOME/fnm/target/release/fnm:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="./vendor/bin:$PATH"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# fnm
FNM_PATH="/home/janjoost/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
eval "$(fnm env --use-on-cd)"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add DNS entry for Windows host
if ! $(cat /etc/hosts | grep -q 'winhost'); then
  echo 'Adding DNS entry for Windows host in /etc/hosts'
  echo '\n# Windows host - added via ~/.bashhrc' | sudo tee -a /etc/hosts
  echo -e "$(ip route show | grep -i default | awk '{ print $3, "   winhost"}')" | sudo tee -a /etc/hosts
fi

