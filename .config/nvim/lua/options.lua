-- lang
-- vim.cmd('language en_US.UTF-8') -- 表示言語を英語にする
vim.cmd("language ja_JP.UTF-8") -- 表示言語を日本語にする

-- ファイル
vim.opt.fileencoding = "utf-8" -- エンコーディングをUTF-8に設定
vim.opt.swapfile = false -- スワップファイルを作成しない
-- vim.opt.helplang = "ja" -- ヘルプファイルの言語は日本語
vim.opt.hidden = true -- バッファを切り替えるときに
                      --ファイルを保存しなくてもOKに

-- カーソルと表示
-- vim.opt.cursorline = true -- カーソルがある行を強調
-- vim.opt.cursorcolumn = true -- カーソルがある列を強調

-- クリップボード共有
vim.opt.clipboard:append({ "unnamedplus" }) -- レジスタとクリップボードを共有

-- メニューとコマンド
vim.opt.wildmenu = true -- コマンドラインで補完
vim.opt.cmdheight = 1 -- コマンドラインの表示行数
vim.opt.laststatus = 3  -- グローバルステータスラインを使用
vim.opt.showcmd = true -- コマンドラインに入力されたコマンドを表示

-- 検索・置換え
vim.opt.hlsearch = true -- ハイライト検索を有効
vim.opt.incsearch = true -- インクリメンタルサーチを有効
vim.opt.matchtime = 1 -- 入力された文字列がマッチするまでにかかる時間

-- カラースキーム
vim.opt.termguicolors = true -- 24 ビットカラーを使用
vim.opt.background = "dark" -- ダークカラーを使用する

-- インデント
vim.opt.shiftwidth = 4 -- シフト幅を4に設定する
vim.opt.tabstop = 4 -- タブ幅を4に設定する
vim.opt.expandtab = true -- タブ文字をスペースに置き換える
vim.opt.autoindent = true -- 自動インデントを有効にする
vim.opt.smartindent = true -- インデントをスマートに調整する

-- 表示
vim.opt.number = true -- 行番号を表示
vim.opt.relativenumber = true -- 相対行番号を表示
vim.opt.wrap = true -- テキストの自動折り返しを無効に
vim.opt.showtabline = 2 -- タブラインを表示
                        -- （1:常に表示、2:タブが開かれたときに表示）
vim.opt.visualbell = true -- ビープ音を表示する代わりに画面をフラッシュ
vim.opt.showmatch = true -- 対応する括弧をハイライト表示

-- インタフェース
vim.opt.winblend = 0 -- ウィンドウの不透明度
vim.opt.pumblend = 0 -- ポップアップメニューの不透明度
vim.opt.showtabline = 2 -- タブラインを表示する設定
vim.opt.signcolumn = "yes" -- サインカラムを表示

---- 行番号の色を変更（色は適宜変更してください）
vim.cmd("highlight LineNr guifg=#8a70ac")

-- カーソルの形状
vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

-- ビジュアルモードで行末の右側も選択可能にする
vim.opt.virtualedit:append("block")

-- 行の強調
vim.opt.cursorline = true -- カーソルがある行を強調

-- signcolumnの優先順位（エラー/警告/ヒントの表示順）
vim.diagnostic.config({ severity_sort = true })

-- macOSで日本語入力を自動的に英数モードに切り替える設定
if vim.fn.executable('osascript') == 1 then
  local keycode_jis_eisuu = 102
  local force_alphanumeric_input_command = string.format(
    "osascript -e 'tell application \"System Events\" to key code %d' &",
    keycode_jis_eisuu
  )
  
  -- 挿入モードから抜けるときに英数モードに切り替え
  vim.keymap.set('i', '<Esc>', function()
    vim.cmd('stopinsert')
    vim.fn.system(force_alphanumeric_input_command)
  end, { silent = true })
  
  -- Vimウィンドウにフォーカスが戻ったときに英数モードに切り替え
  vim.api.nvim_create_autocmd('FocusGained', {
    pattern = '*',
    callback = function()
      vim.fn.system(force_alphanumeric_input_command)
    end,
  })
end
