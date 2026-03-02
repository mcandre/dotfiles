#
# Fix zsh tab completion
# Recurse over directories
# Aggregate transfer metrics
#
export RSYNC_OLD_ARGS='1'
alias rsync='rsync --old-args -a --info progress2'
