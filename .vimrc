"View ------------------------------------------------
set number                       "行番号
set showmatch                    "括弧の対応をハイライト
set showcmd                      "入力中のコマンドを表示
set list lcs=tab:\|\ ,eol:↲      " 不可視文字表示
set laststatus=2
set cursorline                   "カーソル行をハイライト
syntax on
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


set noswapfile


"SortCat
noremap <C-j> <esc>
noremap! <C-j> <esc>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap uf :<C-u>Unite file<CR>


"Pacage Control --------------------------------------
set nocompatible
filetype off            " for NeoBundle

if has('vim_starting')
        set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

" ここから NeoBundle でプラグインを設定します

" NeoBundle で管理するプラグインを追加します。
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'             
"Unite.vimで最近使ったファイルを表示>できるようにする
NeoBundle 'Shougo/neocomplcache'          "補完
NeoBundle 'itchyny/lightline.vim'         "ステータスライン
NeoBundle 'Yggdroot/indentLine'           "インデント
NeoBundle 'jiangmiao/auto-pairs'          "括弧対応入力
NeoBundle 'tomasr/molokai'                "カラースキーマ

"自分の設定
NeoBundle 'Shougo/neosnippet'
NeoBundle 'toyamarinyon/vim-swift'        
NeoBundle 'mitsuse/autocomplete-swift'
NeoBundle 'Shougo/neocomplete.vim'


" Plugin key-mappings.
 imap <C-k>     <Plug>(neosnippet_expand_or_jump)
 smap <C-k>     <Plug>(neosnippet_expand_or_jump)
 xmap <C-k>     <Plug>(neosnippet_expand_target)

 " SuperTab like snippets behavior.
 imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: pumvisible() ? "\<C-n>" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)"
  \: "\<TAB>"

  " For snippet_complete marker.
   if has('conceal')
      set conceallevel=2 concealcursor=i
   endif

NeoBundle 'Shougo/neosnippet-snippets'

call neobundle#end()
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
