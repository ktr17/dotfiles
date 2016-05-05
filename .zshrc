# Path to your oh-my-zsh installation.
export ZSH=/Users/keitaro/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git)

# User configuration
export PATH="/Users/keitaro/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/opt/local/bin:/opt/local/sbin:/Users/keitaro/.rbenv/shims:/Library/Frameworks/Python.framework/Versions/3.4/bin/Users/keitaro/Library/Android/sdk/tools:/Users/keitaro/Library/Android/sdk/platform-tools"

source $ZSH/oh-my-zsh.sh

echo 'reload .zshrc file'

#proxy settings
proxy=wwwproxy.kanazawa-it.ac.jp:8080
switch_trigger=school

function set_proxy(){
    export http_proxy=http://$proxy
    export HTTP_PROXY=http://$proxy
    export ftp_proxy=ftp://$proxy
    export FTP_PROXY=FTP://$proxy
    export https_proxy=https://$proxy
    export HTTPS_PROXY=https://$proxy

    git config --global http.proxy $proxy
    git config --global https.proxy $proxy
    git config --global url."https://".insteadOf git://
}

function unset_proxy(){
    unset http_proxy
    unset HTTP_PROXY
    unset ftp_proxy
    unset FTP_PROXY
    unset https_proxy
    unset HTTPS_PROXY

    git config --global --unset http.proxy
    git config --global --unset https.proxy
    git config --global --unset url."https://".insteadOf
}

if [ "`networksetup -getcurrentlocation`" = "$switch_trigger" ]; then
  echo "Switch to proxy for university network"
  
  set_proxy
else
  unset_proxy
fi

##########################
# vcs_infoロード    
autoload -Uz vcs_info    
# PROMPT変数内で変数参照する    
setopt prompt_subst    

# vcsの表示    
zstyle ':vcs_info:*' formats '%s* %F{green}%b%f'

zstyle ':vcs_info:*' actionformats '%s* %F{green}%b%f(%F{red}%a%f)'    
# プロンプト表示直前にvcs_info呼び出し    
precmd() { vcs_info }    
# プロンプト表示    
PROMPT='%F{blue}%n:%C$%f[${vcs_info_msg_0_}]:%f ' 

#gitのコンフリクトを確認するエイリアス
git config --global alias.conflicts '!git ls-files -u | cut -f 2 | sort -u'

#gitのdiff
git config --global alias.d 'diff --word-diff'

#git status
alias gs="git status"

#gitのコミットしたコメント内容を変更

alias gr="git commit --amend -m"

# ~/.zshrcを更新する
alias so="source ~/.zshrc"

# find . -name "検索したいファイル名"
alias finda="find . -name"

#カレントディレクトリのフォルダを開く"
alias f="open ."

#emacsを起動
alias e="emacs"

#lessを起動
alias le="less"

#打ち間違い用笑
alias sl="ls"

#大学の授業で使うエイリアス
#コンピュータグラフィックス
alias glgcc="cc -framework GLUT -framework OpenGL -mmacosx-version-min=10.8"

#swift用のエイリアス
alias s="swift"
