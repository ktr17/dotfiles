"View ------------------------------------------------
set number                       "行番号
set showmatch                    "括弧の対応をハイライト
set showcmd                      "入力中のコマンドを表示
"set list lcs=tab:\|\ ,eol:↲      " 不可視文字表示
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set laststatus=2
set cursorline                   "カーソル行をハイライト
set backspace=indent,eol,start "Pythonなどでインデントをbackspaceで消す
set belloff=all

syntax on

" solarized用の設定
"set background=light
"colorscheme solarized

" molokai用の設定
colorscheme molokai

" 全角スペースをハイライト表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
  call ZenkakuSpace()
endif

" swapファイルを作成しない
set noswapfile
" ビジュアルモードで選択したテキストが、クリップボードに入るようにする
"set clipboard=autoselect
set clipboard=unnamed,autoselect


"Indent ----------------------------------------------
"" タブ設定
set expandtab                    "タブをスペースに変換
set tabstop=4
set shiftwidth=4
set softtabstop=4

set autoindent
set smartindent

"Search
set wrapscan                     "最後まで検索したら最初に戻る
set ignorecase                   "大文字小文字無視
set smartcase                    "大文字ではじめたら大文字小文字無視しない
set hlsearch                     " 検索結果のハイライト

" swapファイルを作らない設定
set noswapfile

" キーバインド変更
noremap <S-h> ^
noremap <S-l> $
noremap <S-j> <nop>
nnoremap sk <C-w>k "上下分割した画面の上に移動
nnoremap sl <C-w>l "左右分割した画面の右に移動
nnoremap sj <C-w>j "上下分割した画面の下に移動
nnoremap sh <C-w>h "左右分割した画面の左に移動
nnoremap sr <C-w>r
nnoremap sq :q<CR> "画面を閉じる
nnoremap sw :wq<CR> "保存して閉じる
nnoremap si :w<CR> "保存
nnoremap no :noh<CR> "検索削除
nnoremap ;q1 :q!<CR> "保存せずに終了
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap ss :<C-u>sp<CR> "画面を下に分割
nnoremap sv :<C-u>vs<CR> "画面を上に分割
nnoremap uf :<C-u>Unite file<CR> "同じウィンドウで別のファイルを開く
nnoremap <CR> A<CR><ESC>
nnoremap <C-d> x

inoremap <C-d> <Del> "カーソルの後ろの文字を削除

" j/kによる移動を早くする
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" vimshellの設定
"nnoremap <silent> vl :VimShell<CR>
"nnoremap <silent> vp :VimShellPop<CR>

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif


" Required:
set runtimepath+=~/.vim/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim')
  call dein#begin('~/.vim')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
"  call dein#add('tpope/vim-surround')
  call dein#add('Shougo/unite.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('rhysd/accelerated-jk')
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('jiangmiao/auto-pairs')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif
" ------------------------------------------------------------
" ### neocomplete
  let g:acp_enableAtStartup=1
  let g:neocomplete#enable_at_startup=1
  let g:neocomplete#enable_smart_case=1
  let g:neocomplete#sources#syntax#min_keyword_lenth=2
  let gLneocomplete#lock_buffer_name_pattern='\*ku\*'
  if !exists('g:neocomplete#keyword_patterns')
     let g:neocomplete#keyword_patterns={}
  endif
  let g:neocomplete#keyword_patterns['default']='\h\w*'
  inoremap <expr><C-g> neocomplete#undo_completion()
  inoremap <expr><C-l> neocomplete#complete_common_string()
  inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  ino <expr> <CR> pumvisible() ? "<CR><c-o>:pclose<CR>" : "<CR>"

" ### vim-indent-guides
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_auto_colors = 1
  let g:indent_guides_start_level = 2
  let g:indent_guides_guide_size = 1

" Required:
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
filetype plugin indent on       " restore filetypea

"ノーマルモードの時に自動で英数に切り替える
if executable('osascript')
  let s:keycode_jis_eisuu = 102
  let g:force_alphanumeric_input_command = "osascript -e 'tell application \"System Events\" to key code " . s:keycode_jis_eisuu . "' &"

  inoremap <silent> <Esc> <Esc>:call system(g:force_alphanumeric_input_command)<CR>

  autocmd! FocusGained *
    \ call system(g:force_alphanumeric_input_command)
endif

" vimでコピペする場合の設定
if &term =~ "xterm"
  let &t_ti .= "\e[?2004h"
  let &t_te .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
  cnoremap <special> <Esc>[200~ <nop>
  cnoremap <special> <Esc>[201~ <nop>
endif
autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict

" fishでvimを使う設定
if $SHELL =~ '/fish$'
  set shell=zsh
endif

" タブの設定
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction
" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
map <silent> [Tag]t :tablast <bar> tabnew<CR>
" tt 新しいタブを一番右に作る:wq ファイル名で保存できる
map <silent> [Tag]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tag]p :tabprevious<CR>
" tp 前のタブ
