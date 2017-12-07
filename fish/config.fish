#f## function
function cd
  if test (count $argv) -gt 1
      printf "%s\n" (_ "Too many args for cd command")
      return 1
  end
  set -l previoud $PWD
  if test "$argv" = "-"
      if test "$__fish_cd_direction" == "next"
          nextd
      else
          prevd
      end
      return $status
  end
  builtin cd $argv
  set -l cd_status $status
  if test $cd_status -eq 0 -a "$PWD" != "$previous"
      set -q dirprev[$MAX_DIR_HIST]
      and set -e dirprev[1]
      set -g dirprev $dirprev $previous
      set -e dirnext
      set -g __fish_cd_direction prev
  end
  if test $cd_status -ne 0
      return 0
  end
  ls
  return $status
end

function gi
  curl -L -s https://www.gitignore.io/api/$argv
end

#set JAVA_HOME (/usr/libexec/java_home)
#set HOMEBREW_CASK_OPTS --appdir=/Applications
#set ANDROID_HOME ~/Library/Android/sdk
#set PATH $ANDROID_HOME/platform-tools $PATH
#set PATH ~/.rbenv/shims $PATH
set PATH ~/.pyenv/shims $PATH
set PATH ~/.pyenv/bin $PATH

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
set fish_color_cwd "green"

sh checkProxy

# プロンプトを変更したいときは fish_prompt を修正
function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s:%s' (whoami) ( pwd | awk -F "/" '{ print $NF }')
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

### alias
alias :q="exit"
alias f="open ."
alias gs="git status"
alias sl="ls"
alias so="source ~/.config/fish/config.fish"
alias f="open ."
alias ho="heroku open"
alias vi="vim"
alias cdv="cd /Users/ktr17/Documents/大学院/後期"
alias ptex="ptex2pdf -l -ot -kanji=utf8"
alias cdp="cd /Users/ktr17/Documents/大学院/PD3"
alias tr="open /Users/ktr17/Documents/treatise/論文集"
alias net="/Users/ktr17/ns-allinone-3.27/netanim-3.108/NetAnim"
alias pd="cd /Users/ktr17/Documents/大学院/PD3"
alias ip="ipython"
