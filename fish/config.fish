set -x -g LS_COLORS "di=38;5;27:fi=38;5;7:ln=38;5;51:pi=40;38;5;11:so=38;5;13:or=38;5;197:mi=38;5;161:ex=38;5;9:"

set -x -g TERM "xterm-256color"

# Coreutils bin and man folders
set -x -g PATH (brew --prefix coreutils)/libexec/gnubin $PATH
# set -x -g MANPATH (brew --prefix coreutils)/libexec/gnuman $MANPATH

# Findutils bin and man folders
set -x -g PATH (brew --prefix findutils)/libexec/gnubin $PATH
# set -x -g MANPATH (brew --prefix findutils)/libexec/gnuman $MANPATH

# User bin folder
set -x -g PATH ~/anaconda3/bin $PATH ~/bin /usr/local/sbin

# Composer
set -x -g PATH ~/.composer/vendor/bin $PATH

# Source conda.fish
source (conda info --root)/etc/fish/conf.d/conda.fish

## Teemun lisäämät
# Tacklebox
set tacklebox_path ~/.tackle
set tacklebox_modules virtualfish virtualhooks
source ~/.tacklebox/tacklebox.fish

# thefuck
eval (thefuck --alias | tr '\n' ';')

# iTerm2 Shell Integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
