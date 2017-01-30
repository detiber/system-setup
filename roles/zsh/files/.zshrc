source ~/.zplug/init.zsh
export EDITOR=nvim
alias vi=nvim
alias ypcat='echo -e ""'

zplug "zplug/zplug"
zplug "seebi/dircolors-solarized"
#zplug "zsh-users/zsh-autosuggestions", use:"zsh-autosuggestions.zsh", defer:2
#zplug "zsh-users/zsh-syntax-highlighting", defer:2
#zplug "zsh-users/zsh-completions"
zplug "b4b4r07/enhancd", use:init.sh

zstyle ':prezto:module:syntax-highlighting' color 'yes'

zplug "modules/git", from:prezto
zplug "modules/history", from:prezto
zplug "modules/syntax-highlighting", from:prezto, defer:2
zplug "modules/history-substring-search", from:prezto, defer:2
zplug "modules/autosuggestions", from:prezto, defer:3
zplug "modules/completion", from:prezto, defer:3

zplug "unixorn/git-extra-commands"

zplug "plugins/vagrant", from:oh-my-zsh

# Liquid prompt
LP_ENABLE_TIME=1
LP_USER_ALWAYS=1
zplug "nojhan/liquidprompt"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

# dircolors
eval `dircolors $ZPLUG_HOME/repos/seebi/dircolors-solarized/dircolors.256dark`

if zplug check b4b4r07/enhancd; then
    # setting if enhancd is available
    export ENHANCD_FILTER=fzf-tmux
fi

# autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=239'

# jenegunn/fzf
export FZF_DEFAULT_OPTS='
--extended
--ansi
--multi
--bind=ctrl-u:page-up
--bind=ctrl-d:page-down
--bind=ctrl-z:toggle-all
'

[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh || true
