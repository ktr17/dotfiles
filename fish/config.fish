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
if not test -z (which rbenv)
  status --is-interactive; and source (rbenv init -|psub)
end
if not test -z (which direnv)
  eval (direnv hook fish)
end

