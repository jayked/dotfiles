# get the git branch and output it
parse_git_branch() {
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/*\(.*\)/(\1)/'
}

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
   PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;35m│[2020-07-21 14:46:01][53] Processed:  UCms\Core\Jobs\ImportActions
\]$(parse_git_branch)\[\033[00m\]\$ '
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

# source the files in the shell directory
for file in ./shell/.{aliases,functions}; do
   [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

