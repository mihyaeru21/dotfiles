. $HOME/dotfiles/zsh/plugin.zsh
. $HOME/dotfiles/zsh/general.zsh
. $HOME/dotfiles/zsh/alias.zsh
. $HOME/dotfiles/zsh/style.zsh

# OS ごとの設定
case ${OSTYPE} in
    linux*)
        . $HOME/dotfiles/zsh/linux.zsh
        ;;
    darwin*)
        . $HOME/dotfiles/zsh/mac.zsh
        ;;
esac

# 環境ごとの設定
[ -f $HOME/dotfiles/local/zsh.zsh ] && . $HOME/dotfiles/local/zsh.zsh

