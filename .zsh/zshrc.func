############################################################
# functions
############################################################

# ghqのリストをpecoってcdするやつ
function gpc() {
    target_dir=`ghq list --full-path | peco`
    if [ -n "$target_dir" ]; then
        cd $target_dir
    fi
}

# カレント以下の全ディレクトリにpeco移動するやつ
function tpc() {
    target_dir=`tree -I .git -dafi | peco`
    if [ -n "$target_dir" ]; then
        cd $target_dir
    fi
}

# カレント以下の全ファイルからpecoってvimで開く
function tpv() {
    target_dir=`tree -I .git -afi | peco`
    if [ -n "$target_dir" ]; then
        vim $target_dir
    fi
}

