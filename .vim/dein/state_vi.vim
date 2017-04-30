if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/keitaro/.vimrc'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/keitaro/dotfiles/.vim/dein'
let g:dein#_runtime_path = '/Users/keitaro/dotfiles/.vim/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/Users/keitaro/dotfiles/.vim/dein/.cache/.vimrc'
let &runtimepath = '/Users/keitaro/.vim,/Users/keitaro/dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim,/Users/keitaro/dotfiles/.vim/dein/.cache/.vimrc/.dein,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/Users/keitaro/dotfiles/.vim/dein/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/Users/keitaro/.vim/after'
filetype off
