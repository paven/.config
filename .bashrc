# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

. ~/.config/environment.sh

# User specific aliases and functions
alias gloN="git log --oneline --color --graph --decorate -n "
alias glo1="git --no-pager log --oneline --color --graph --decorate -n 1"
alias glo="git --no-pager log --oneline --color --graph --decorate  -n 20"

# Colorize Maven Output
color_maven() {
  $MAVEN_HOME/bin/mvn $* | sed -e 's/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/\x1b[1;32mTests run: \1\x1b[0m, Failures: \x1b[1;31m\2\x1b[0m, Errors: \x1b[1;33m\3\x1b[0m, Skipped: \x1b[1;34m\4\x1b[0m/g' \
    -e 's/\(\[WARN\].*\)/\x1b[1;33m\1\x1b[0m/g' \
    -e 's/\(\[INFO\].*\)/\x1b[1;34m\1\x1b[0m/g' \
    -e 's/\(\[ERROR\].*\)/\x1b[1;31m\1\x1b[0m/g'
}

alias mvn=color_maven

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

    # Show the currently running command in the terminal title:
    # http://www.davidpashley.com/articles/xterm-titles-with-bash.html
    show_command_in_title_bar()
    {
        case "$BASH_COMMAND" in
            *\033]0*)
                # The command is trying to set the title bar as well;
                # this is most likely the execution of $PROMPT_COMMAND.
                # In any case nested escapes confuse the terminal, so don't
                # output them.
                ;;
            *)
                echo -ne "\033]0;${USER}@${HOSTNAME}: ${BASH_COMMAND}\007"
                ;;
        esac
    }
    trap show_command_in_title_bar DEBUG
    ;;
*)
    ;;
esac

. /home/pvn/.config/z/z.sh
