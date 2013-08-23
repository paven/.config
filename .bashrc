# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

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
export MAVEN_HOME=/usr/share/maven/
export PATH=$MAVEN_HOME/bin:$PATH

alias mvn=color_maven
alias maven=$MAVEN_HOME/bin/mvn
