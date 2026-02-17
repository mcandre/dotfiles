# Begin profiling
# zmodload zsh/zprof

. ~/zsh-defer/zsh-defer.plugin.zsh

# Load extras
for f in $(find ~/.zshrc.d -name '*.zsh' -print); do . "$f"; done

# End profiling
# zprof
