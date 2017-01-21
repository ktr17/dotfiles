### function
function gi
  curl -L -s https://www.gitignore.io/api/$argv
end

#set JAVA_HOME (/usr/libexec/java_home)
#set HOMEBREW_CASK_OPTS --appdir=/Applications
#set ANDROID_HOME ~/Library/Android/sdk
#set PATH $ANDROID_HOME/platform-tools $PATH
#set PATH ~/.rbenv/shims $PATH

### prompt format
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch blue
set __fish_git_prompt_color_upstream_ahead gray
set __fish_git_prompt_color_upstream_behin red
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '#'
set __fish_git_prompt_char_untrackedfiles '+'
set __fish_git_prompt_char_stashstate '@'

sh checkProxy

# プロンプトを変更したいときは fish_prompt を修正
function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s:%s' (whoami) ( PWD | awk -F "/" '{ print $NF }')
  set_color normal

  printf '%s$ ' (__fish_git_prompt)

  set_color normal
end

function fish_right_prompt
  printf ''
end

### initialize
#if not test -z (which rbenv)
#  status --is-interactive; and source (rbenv init -|psub)
#end
#if not test -z (which direnv)
#  eval (direnv hook fish)
#end
##proxy settings
#proxy=wwwproxy.kanazawa-it.ac.jp:8080
#switch_trigger=school

#function set_proxy(){
#    export http_proxy=http://$proxy
#    export HTTP_PROXY=http://$proxy
#    export ftp_proxy=ftp://$proxy
#    export FTP_PROXY=FTP://$proxy
#    export https_proxy=https://$proxy
#    export HTTPS_PROXY=https://$proxy
#
#    git config --global http.proxy $proxy
#    git config --global https.proxy $proxy
#    git config --global url."https://".insteadOf git://
#}
#
#function unset_proxy(){
#    unset http_proxy
#    unset HTTP_PROXY
#    unset ftp_proxy
#    unset FTP_PROXY
#    unset https_proxy
#    unset HTTPS_PROXY
#
#    git config --global --unset http.proxy
#    git config --global --unset https.proxy
#    git config --global --unset url."https://".insteadOf
#}
#if [ "`networksetup -getcurrentlocation`" = "$switch_trigger" ]; then
#  echo "Switch to proxy for university network"
#
#  set_proxy
#else
#  unset_proxy
#fi
