scriptencoding utf-8
"----------------------------------------------------
" 基本的な設定
" 文字コードの設定
" fileencodingsの設定ではencodingの値を一番最後に記述する
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,euc-jp,sjis,cp932,utf-8
set nocompatible                " viとの互換性をとらない(vimの独自拡張機能を使う為)
set backspace=indent,eol,start  " バックスペースキーで削除できるものを指定

"OSごとの設定
if has('macvim')
set list
set listchars=tab:▶\ ,eol:⇩
set listchars+=space:s
set clipboard=unnamed
endif

if has('unix')
" 右クリックメニューを有効にする(Linux)
set mousemodel=popup_setpos
set clipboard=unnamedplus
endif

if has('win32')
set list
set listchars=tab:▶\ ,eol:↲,space:･
set viminfo+=n~/Work/gvim/viminfo
set mousemodel=popup_setpos
set shellslash
set shell=$HOME/Work/cygwin/bin/zsh.exe
set makeprg=$HOME/Work/cygwin/bin/make.exe
let $path=$path.';'.$HOME."\\Work\\cmd;"
let $path=$path.$HOME."\\Work\\cygwin\\bin;"
let $path=$path.$HOME."\\Work\\gvim;"
set clipboard=unnamed
set fileformat=unix
endif

colorscheme elisex2

set nobackup                    " バックアップをとらない
set writebackup                 " ファイルの上書きの前にバックアップを作る
set noundofile                  " undoファイルを作成しない

set history=300                 " コマンド、検索パターンを100個まで履歴に残す
set ignorecase                  " 検索の時に大文字小文字を区別しない
set smartcase                   " 検索の時に大文字が含まれている場合は区別して検索する
set wrapscan                    " 最後まで検索したら先頭に戻る
set noincsearch                 " インクリメンタルサーチを使わない

set title                       " タイトルをウインドウ枠に表示する
set number                      " 行番号を表示する
set showcmd                     " 入力中のコマンドをステータスに表示する
set laststatus=2                " ステータスラインを常に表示
set showmatch                   " 括弧入力時の対応する括弧を表示
syntax on                       " シンタックスハイライトを有効にする
set hlsearch                    " 検索結果文字列のハイライトを有効にする

" コメント文の色を変更
highlight Comment ctermfg=DarkCyan
set wildmenu                    " コマンドライン補完を拡張モードにする
set textwidth=0                 " 折り返し幅を0にする
set wrap                        " ウィンドウの幅より長い行は折り返して、次の行に続けて表示する

" ステータスラインの色
highlight StatusLine   term=NONE cterm=NONE ctermfg=DarkCyan ctermbg=white

set nosmartindent
set tabstop=4       " タブが対応する空白の数
"set autoindent
set expandtab       " タブをスペース4つに変更
set shiftwidth=4    " インデントの各段階に使われる空白の数



" その他
set hidden                  " バッファを切替えてもundoの効力を失わない
set formatoptions=q         " 自動改行を無効にする奴
"set clipboard=unnamedplus
set textwidth=0             " 折り返し幅を0(無効)にする
set grepprg=grep\ -n
set whichwrap=b,s,h,l,<,>,[,],~

" フォールディングレベル
let g:xml_syntax_folding=1      " xml
au FileType html,xml,xhtml setlocal foldmethod=syntax
set foldlevel=100 "Don't autofold anything

let g:clang_syntax_folding=1    " c言語
au FileType c,cpp,m,h setlocal foldmethod=syntax
set foldlevel=100 "Don't autofold anything

" ステータスラインの表示
set laststatus=2
set statusline=%F%m%r%h%w\ \|%{&ff}\|%{(&fenc!=''?&fenc:&enc)}\|%Y\|
set statusline+=%=[%4l],[%4c],[0x%04B]
let $LANG = "en"

" デフォルトのメニューを非表示にする
"let did_install_default_menus = 1
" ツールバー消す
"set guioptions-=T
"set guioptions+=a
set guioptions+=T
" メニューバー消す
"set guioptions-=m

" vsplit時にウィンドウ位置がずれる現象を止める
set go-=L go-=R go-=e

au BufEnter *           execute ":lcd " . expand("%:p:h")
au FileType *           set comments=
au FileType *           set indentexpr=
au BufRead *.vimpj      call PrjOpen()
au BufEnter *           call FileFormatFunc()

" オートコマンド
if has("autocmd")
   " ファイルタイプ別インデント、プラグインを有効にする
   "filetype plugin indent on
   " カーソル位置を記憶する
   autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal g`\"" |
       \ endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"未使用

"set vb t_vb=                   " ビープ音を鳴らさない
"set nuw=8
"set ruler                      " ルーラーを表示
"set matchtime=2                " 対応する括弧の表示時間を2にする
" ステータスラインに表示する情報の指定
"set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>
"set noautoindent   " オートインデントを無効にする
"set softtabstop=4  " タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
"set noexpandtab    " タブを挿入するとき、代わりに空白を使わない
"set shortmess+=I           " 起動時のメッセージを表示しない
"set shell=powershell.exe   " shellをPowershellにする
"set shell=nyaos.exe
"set shell=C:\Users\tokixy56\Work\Cygwin\bin\mintty.exe
"set shell=mintty.exe
"set showtabline=2          " 常にタブを見せる
"set clipboard=autoselect
"set statusline=%F%m%r%h%w\ \|%{&ff}\|%{(&fenc!=''?&fenc:&enc)}\|%Y\|\%=[\%1b\ 0x\%1B]\ line-%04l\ low-%04v\ [%p%%]\ [LEN=%L]
"au BufEnter *.c            colorscheme peggy
"au BufEnter *.s            colorscheme peggy
"au BufEnter *.S            colorscheme peggy
"au BufEnter *.cpp      colorscheme peggy
"au BufEnter *.m            colorscheme peggy
"au BufEnter *.h            colorscheme peggy
"au BufEnter *.mak      colorscheme peggy
"au BufEnter makefile   colorscheme peggy
"au BufEnter *.sh       colorscheme elisex2
"au BufEnter *.vim      colorscheme elisex2
"au BufEnter *.txt      colorscheme elisex2
"au BufEnter *.bat      colorscheme elisex2
"au BufEnter *.ld       colorscheme elisex2
"au BufEnter *.scr      colorscheme elisex2
"au BufEnter gvimrc     colorscheme elisex2
"au BufEnter .gvimrc        colorscheme elisex2
"au BufEnter _gvimrc        colorscheme elisex2
"au BufEnter vimrc      colorscheme elisex2
"au BufEnter .vimrc     colorscheme elisex2
"au BufEnter _vimrc     colorscheme elisex2
au BufNewFile,BufRead *.css         setf scss
au BufEnter *.css           setf scss

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 関数関係
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ファイルオープン関数 ファイルタイプ指定
function OpenFileWithType(path, type)
    execute ":edit " . a:path
    execute ":set filetype=" . a:type
endfunction

" ファイルオープン関数
function OpenFile(path)
    exe ":e " . a:path
endfunction

" 設定ファイルオープン関数
function OpenRcFile(path)
    exe ":e " . g:vimrcspath . a:path
endfunction

" 指定範囲の文字列を返す
function Region() range
    let tmp = @@
    silent normal gvy
    let selected = @@
    let @@ = tmp
endfunction

" 引数を取る関数とコマンドの例
function Example(...)
    :echo "parameter 1: " . a:1
    :echo "parameter 2: " . a:2
    :echo "parameter 3: " . a:3
    :echo "parameter count : " . len(a:000)
endfunction

command! -nargs=+ ExampleCommand call Example(<f-args>)

" :copen :ccloseのトグル
let s:quickfixwindow = "close"
""" 関数の!は、すでに関数が定義されていたら、強制的に上書きする
function!   ToggleQuickfix()
    if "open" ==? s:quickfixwindow
        let s:quickfixwindow = "close"
        cclose
    else
        let s:quickfixwindow = "open"
        copen
    endif
endfunction

" NERDTreeのトグル
let s:NerdtProject = "close"
let g:NerdtPrjPath = "."

""" 関数の!は、すでに関数が定義されていたら、強制的に上書きする
function!   ToggleNerdtPrj()
if has('win32')
    if "open" ==? s:NerdtProject
        let s:NerdtProject = "close"
        exe ":wincmd h"
        exe ":bd"
    else
        let s:NerdtProject = "open"
        if(g:NerdtPrjPath[0] != '/')
            exe ":cd " . strpart(g:NerdtPrjPath, 0, 3)
        endif
        exe ":NERDTree " . expand(g:NerdtPrjPath)
    endif
else
    if "open" ==? s:NerdtProject
        let s:NerdtProject = "close"
        exe ":bd"
    else
        let s:NerdtProject = "open"
        exe ":NERDTree " . expand(g:NerdtPrjPath)
    endif
endif
endfunction

" Nerdtreeを使用したプロジェクトのパスを変更
function! ProjectPathSet(path)
    if(a:path[0] == '\')
        let a:tmp = '/'. a:path
    else
        let a:tmp = a:path
    endif

    let g:NerdtPrjPath = substitute(a:tmp, "\\", "/", "g")
    exec ":set tags=./tags,tags," . g:NerdtPrjPath . "/tags"
endfunction

function! PrjMakeFunc(...)
    execute ":cd " . g:NerdtPrjPath

    let makecmd=":make"
    if (a:0 >= 1)
        for item in a:000
            echo item
            let makecmd = makecmd . " " . item
        endfor
    endif
    exec makecmd
endfunction

function! ShowPrjPathFunc()
        echo g:NerdtPrjPath
endfunction

" grep
let s:grep_cmd_str = ":grep -rnH "
function! GrepFunc(selected, ...) range
    if a:selected   " 範囲が与えられた
        let tmp = @@
        silent normal gvy
        let selectstr = @@
        let @@ = tmp
        if a:0 >= 1 " 引数が与えられている(ファイル名が与えられている)
            exe s:grep_cmd_str . selectstr . " " . a:1
        else
            exe s:grep_cmd_str . selectstr . " ".expand("%:p")
        endif
    else
        if a:0 >= 1 " 引数が与えられている
            if a:0 == 1 " 検索文字列のみ
                "カレントディレクトリで検索
                exe s:grep_cmd_str.a:1." ."
            elseif a:0 >= 2 "検索文字列と検索ファイル
                exe s:grep_cmd_str.a:1." ".a:2
            endif
        else
            echo "input string."
        endif
    endif
endfunction

function! PrjGrepFunc(selected, ...) range
    if a:selected   " 範囲が与えられた
        let tmp = @@
        silent normal gvy
        let selectstr = @@
        let @@ = tmp
        if a:0 >= 1 " 引数が与えられている(ファイル名が与えられている)
            exe s:grep_cmd_str . selectstr . " " . a:1
        else
            exe s:grep_cmd_str . selectstr . " ".g:NerdtPrjPath
        endif
    else
        if a:0 >= 1 " 引数が与えられている
            if a:0 == 1 " 検索文字列のみ
                "カレントディレクトリで検索
                exe s:grep_cmd_str.a:1." ".g:NerdtPrjPath
            elseif a:0 >= 2 "検索文字列と検索ファイル
                exe s:grep_cmd_str.a:1." ".a:2
            endif
        else
            echo "input string."
        endif
    endif
endfunction

function! PrjCtagsFunc()
    exe ":!ctags -R ".g:NerdtPrjPath." -f ".g:NerdtPrjPath."/tags"
endfunction


function! GrepDirFunc(selected, ...) range
    if a:selected   " 範囲が与えられた
        let tmp = @@
        silent normal gvy
        let selectstr = @@
        let @@ = tmp
        if a:0 >= 1 " 引数が与えられている(ディレクトリが与えられている)
            exe s:grep_cmd_str . selectstr . " " . a:1
        else
            exe s:grep_cmd_str . selectstr . " ."
        endif
    else
        if a:0 >= 1 " 引数が与えられている
            if a:0 == 1 " 検索文字列のみ
                "カレントディレクトリで検索
                exe s:grep_cmd_str.a:1." ."
            elseif a:0 >= 2 "検索文字列と検索ディレクトリ
                exe s:grep_cmd_str.a:1." ".a:2
            endif
        else
            echo "input string."
        endif
    endif
endfunction

function! ReplaceFunc(selected, ...) range
    let replacecmd=":%s/"
    if a:selected   " 範囲が与えられた
        let tmp = @@
        silent normal gvy
        let selectstr = @@
        let @@ = tmp
        if a:0 >= 1 " 引数が与えられている(ディレクトリが与えられている)
            exe replacecmd.selectstr."/".a:1."/"
        else
            let replacestr=input("input replace string: ")
            if(replacestr != "")
                exe replacecmd.selectstr."/".replacestr."/"
            else
                echo "input string."
            endif
        endif
    else
        if a:0 == 0 " 引数が与えられていない
            let sourcestr=input("input source string: ")
            let replacestr=input("input replace string: ")
            if ((sourcestr != "") && (replacestr != ""))
                exe replacecmd.sourcestr."/".replacestr."/"
            else
                echo "input string."
            endif
            
        elseif a:0 == 2 "引数が2つ与えられている
            exe replacecmd.a:1."/".a:2."/"
        else
            echo "input 2 parameters as source and destination."
        endif
    endif
endfunction

function! DeleteFunc(selected, ...) range
    let replacecmd=":%s/"
    if a:selected   " 範囲が与えられた
        let tmp = @@
        silent normal gvy
        let selectstr = @@
        let @@ = tmp
        exe replacecmd.selectstr."//"
    else
        if a:1 == 0 " 引数が与えられていない
            let delstr=input("input delete string: ")
            if (delstr != "")
                exe replacecmd.delstr."//"
            else
                echo "input string."
            endif
        elseif a:1 == 1 " 引数が一つ
            exe replacecmd.a:1."//"
        else
            echo "input delete string."
        endif
    endif
endfunction

function! ReplaceInteractFunc(selected, ...) range
    let replacecmd=":s%/"
    if a:selected   " 範囲が与えられた
        let tmp = @@
        silent normal gvy
        let selectstr = @@
        let @@ = tmp
        if a:0 >= 1 " 引数が与えられている(ディレクトリが与えられている)
            exe replacecmd.selectstr."/".a:1."/c"
        else
            let replacestr=input("input replace string: ")
            if(replacestr != "")
                exe replacecmd.selectstr."/".replacestr."/c"
            else
                echo "input string."
            endif
        endif
    else
        if a:0 == 0 " 引数が与えられていない
            let sourcestr=input("input source string: ")
            let replacestr=input("input replace string: ")
            if ((sourcestr != "") && (replacestr != ""))
                exe replacecmd.sourcestr."/".replacestr."/c"
            else
                echo "input string."
            endif
            
        elseif a:0 == 2 "引数が2つ与えられている
            exe replacecmd.a:1."/".a:2."/c"
        else
            echo "input 2 parameters as source and destination."
        endif
    endif
endfunction

function! SelectedRangeGrep(selected, str1, str2) range
    if a:selected
        let tmp = @@
        silent normal gvy
        let selectstr = @@
        let @@ = tmp
        " 範囲が与えられた
        echo "given range.  [" . selectstr . "]"
    else
        echo "please give range."
    endif

endfunction

"""""" windows用
"function! MyMake(macros)
"   exe ":make -f " . expand($VIM) . "\\general_vim.mak" . "MYMACRO=" . a:macros
"endfunction
"
"function! ExeBat(batchfile)
"   call MyMake(a:batchfile)
"endfunction
"""""" windows用

let s:HexEditToggle = "0"
function! HexDumpToggle()
    if "0" ==? s:HexEditToggle
        exe ":%!xxd"
        let s:HexEditToggle = "1"
    else
        exe ":%!xxd -r"
        let s:HexEditToggle = "0"
    endif
endfunction

" NERDTreeのファイルを選択して、実行
function! ExecFile()
    let treenode = g:NERDTreeFileNode.GetSelected()
"   echo treenode
"    echo "==========================================================\n"
"    echo "Complete the command to execute (add arguments etc):\n"
"    let cmd = treenode.path.str({'escape': 1})
    let cmd = treenode.path.str({'escape': 1})
    echo cmd
"    let cmd = input(':!', cmd . ' ')
"
"    if cmd != ''
"        exec ':!' . cmd
"    else
"        echo "Aborted"
"    endif
endfunction

function! PrjOpen()
    call ProjectPathSet(getline(1))
    call ToggleNerdtPrj()
endfunction

function! FileFormatFunc()
    if &fileformat == "unix"
        "set listchars=tab:▶\ ,eol:⇩
    elseif &fileformat == "dos"
        "set listchars=tab:▶\ ,eol:⤵
    else
        "set listchars=tab:▶\ ,eol:⇦
    endif
endfunction

if has('win32')
" git push
function! GitPushFunc()
    exec "cd " . g:vimrcspath
    exec "!git add ."
    exec "!git commit -m \"update\""
    exec "!git push"
endfunction

" git pull
function! GitPullFunc()
    exec "cd " . g:vimrcspath
    exec "!git pull"
endfunction

endif

if has('unix')
" git push
function! GitPushFunc()
    exec "cd " . g:vimrcspath
endfunction

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" キーマップ関係
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"保存終了系
inoremap    <C-s> <Esc>:w<CR>
noremap     <C-s> <Esc>:w<CR>
nnoremap    <PageDown> <C-d>zz
nnoremap    <PageUp> <C-u>zz
nnoremap    j gj
nnoremap    k gk
nnoremap    <Down> gj
nnoremap    <Up>   gk
nnoremap    <silent>    bl :bnext<CR>
nnoremap    <silent>    bh :bNext<CR>
nnoremap    <silent>    bb :BufList<CR>

nnoremap    <C-t>   <C-]>
nnoremap    <C-t><C-t>  <C-]>
nnoremap    <C-t><C-r>  <C-t>

"ヴィジュアルモードでペーストした時、クリップボードに選択範囲を格納しない。
"クリップボードを利用できないので注意
vnoremap    <silent>    <C-p>   <esc>:set paste<cr>gv""c<C-r>+<ESC>:set nopaste<cr>
vnoremap    <silent>    p       <esc>:set paste<cr>gv""c<C-r>+<ESC>:set nopaste<cr>
vnoremap    <silent>    P       <esc>:set paste<cr>gv""c<C-r>+<ESC>:set nopaste<cr>
vnoremap    <silent>    <C-v>   <esc>:set paste<cr>gv""c<C-r>+<ESC>:set nopaste<cr>

" コマンドモード中のペースト
cnoremap    <C-p>   <C-R>+
cnoremap    <C-n>   <C-R>/
    
vnoremap    <silent>    <C-c>   y
vnoremap    <silent>    c   ""c
inoremap    <silent>    <C-v>   <C-r>+
inoremap    <silent>    <C-p>   <C-r>+

inoremap    <A-n>   <C-n>
inoremap    <A-m>   <C-p>
" 単語移動(スペース含まない)
nnoremap    yw yiw
nnoremap    yW yaw
nnoremap    dw diw
nnoremap    dW daw
vnoremap    w iw
vnoremap    W aw
nnoremap    yb yib
nnoremap    yB yab
nnoremap    db dib
nnoremap    dB dab
vnoremap    b ib
vnoremap    B ab
"リドゥー
nnoremap    . :redo<CR>
nmap        <C-z>   :undo<CR>
imap        <C-z>   <ESC>:undo<CR>

" quickfixのトグル
nmap    <silent>    <C-c>   :call ToggleQuickfix()<CR>
nmap    <silent>    <C-c>   :call ToggleQuickfix()<CR>
imap    <silent>    <C-c>   :call ToggleQuickfix()<CR>

" NERDTreeのトグル
nmap    <silent>    <C-r>   :call ToggleNerdtPrj()<CR>
imap    <silent>    <C-r>   :call ToggleNerdtPrj()<CR>

" 折りたたみ、展開のトグル
noremap za  zA
noremap tt  zA
noremap dd  dd

"一括コメント
"C-v I [comment string] ESC
"C-v c 
" 
" コマンド1 意味
" ~ 大/小文字の切替
" d 削除
" c 変更
" y ヤンク
" > 右シフト
" < 左シフト
" ! 外部コマンドによるフィルタ
" = 'equalprg'オプションで指定されたフィルタ
" gq    'textwidth'の長さによる行の整形
" 
" コマンド2 意味
" aw    1単語(空白文字を含む)
" iw    1単語(空白文字を含まない)
" aW    空白で区切られた1単語(空白文字を含む)
" iW    空白で区切られた1単語(空白文字を含まない)
" as    1文(空白文字を含む)
" is    1文(空白文字を含まない)
" ap    1段落(空白文字を含む)
" ip    1段落(空白文字を含まない)
" ab    (丸括弧文字を含む) ()の中身
" ib    ()の中身
" aB    (波括弧文字を含む) {}のブロック
" iB    {}のブロックの中身
"<Up>             上カーソル
"<Down>           下カーソル
"<Left>           左カーソル
"<Right>          右カーソル
"<S-Up>           シフト + 上カーソル
"<S-Down>         シフト + 下カーソル
"<S-Left>         シフト + 左カーソル
"<S-Right>        シフト + 右カーソル
"<C-Left>         コントロール + 上カーソル
"<C-Right>        コントロール + 上カーソル
"<F1> - <F12>     ファンクションキー1から12
"<S-F1> - <S-F12> シフト + ファンクションキー1から12
"<Help>           ヘルプキー
"<Undo>           アンドゥキー
"<Insert>         挿入キー
"<Home>           ホーム
"<End>            エンド
"<PageUp>         ページアップ
"<PageDown>       ページダウン
"<kHome>          テンキーのホーム(左上)
"<kEnd>           テンキーのエンド(左下)
"<kPageUp>        テンキーのページアップ(右上)
"<kPageDown>      テンキーのページダウン(右下)
"<kPlus>          テンキーの+
"<kMinus>         テンキーの-
"<kMultiply>      テンキーの *
"<kDivide>        テンキーの /
"<kEnter>         テンキーのEnter
"<kPoint>         テンキーのピリオド
"<k0> - <k9>      テンキーの0から9
"<S-...>          シフトキー
"<C-...>          コントロールキー
"<M-...>          altまたはmetaキー
"<A-...>          <M-...>と同じ
"<D-...>          コマンドキー (Macintosh のみ)
"<t_xx>           termcapで"xx"エントリを持つキー


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin関係
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"------------------------------------------------------------------------------
" RunTimePath
set runtimepath+=$VIM/plugins

"------------------------------------------------------------------------------
" Netrw.vim
let g:netrw_mousemaps= 1    " マウスキーマップ無効
let g:netrw_liststyle = 3   " フォルダを開いた時ツリー表示

"------------------------------------------------------------------------------
"taglist
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1

"-----------------------------------------------------------------------------
" QFixHowm
let QFixHowm_FileType='markdown.qfixmemo.qfix_memo'
let howm_filename='%Y-%m.txt'
let howm_fileencoding='utf-8'
let howm_fileformat='unix'
let QFixHowm_Title='#'

"-----------------------------------------------------------------------------
" NERDTree
"
let g:NERDTreeWinSize=20


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" コマンド関係
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"コマンドの引数の取り方
":command -nargs=0 DeleteFirst 1delete
"コマンドの引数を関数に渡す。
":command -nargs=* DoIt :call AFunction(<f-args>)
"command! OpenFile -nargs=1 DoIt :call OpenFile(<f-args>)

" 設定ファイル
if has('win32')
command! Vset       :call OpenFile(g:vimrcspath . expand('/vimrc'))
command! Gset       :call OpenFile(g:vimrcspath . expand('/gvimrc'))
else
command! Vset       :call OpenFile(expand('$HOME/.vimrc'))
command! Gset       :call OpenFile(expand('$HOME/.gvimrc'))
endif

command! SetSet         :call OpenRcFile("/plugin/set.vim")
command! Dh             :nohlsearch                 " ハイライトを消す
command! FileTypeXml    :set filetype=xml           " ファイルタイプを.xmlに変更
command! FileTypeVim    :set filetype=vim           " ファイルタイプをvimに変更
command! Date           :call Todate()
command! Now            :call NowTime()

" フォント
" command! Mincho       :set guifont=IPAMincho\ Bold\ 12
command! FontMincho     :set guifont=TakaoMincho:h11
command! FontGothic     :set guifont=TakaoGothic:h11
command! FontKomatuna   :set guifont=Komatuna:h11

" 列幅 左端の行数表示分(4)をたす
command! Column80   :set columns=84
command! Column100  :set columns=104
command! Column120  :set columns=124

command! Row20  :set lines=20
command! Row30  :set lines=30
command! Row40  :set lines=40

" 画面再描画
command! RD     :redraw!

command! Utf8       :set fileencoding=utf-8
command! Utf8Re     :e ++enc=utf-8
command! Sjis       :set fileencoding=sjis
command! Euc        :set fileencoding=euc-jp
command! Iso        :set fileencoding=iso-2022-jp
command! Lf         :set fileformat=unix
command! Cr         :set fileformat=mac
command! CrLf       :set fileformat=dos
command! Hex        :call HexDumpToggle()

command! BufList    :call BufferList()
command! -range=0 -nargs=* Replace call ReplaceFunc(<count>,<f-args>)
command! -range=0 -nargs=* Delete call DeleteFunc(<count>,<f-args>)

command! -nargs=+ PrjPathSet call ProjectPathSet(<f-args>)
command! -range=0 -nargs=* PrjGrep          call PrjGrepFunc(<count>,<f-args>)
command! -range=0 -nargs=* GrepDir          call GrepDirFunc(<count>,<f-args>)
command! -range=0 -nargs=* GrepBuf          call GrepFunc(<count>,<f-args>)

command! TagJump    silent normal <C-]>
command! TagReturn  silent normal <C-t><C-r>

command! -nargs=* PrjMake   call PrjMakeFunc(<f-args>)
command! PrjPathShow    call ShowPrjPathFunc()
command! PrjCtags   call PrjCtagsFunc()

" 以下のコマンドは重要
" 範囲指定されたか、されてないかの判断がこれでできる。
"function! SelectedRangeGrep(selected, str1, str2) range
"   if a:selected
"       " 範囲が与えられた
"       echo "given range."
"   else
"       echo "please give range."
"   endif
"
"endfunction
command! -range=0 SelectedGrep :call SelectedRangeGrep(<count>,<line1>,<line2>)

command! GitPush    call GitPushFunc()
command! GitPull    call GitPullFunc()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" メニュー関係
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" メニュー追加
let g:qfixmemo_menubar = 0
let g:did_install_syntax_menu = 0
let g:window_menu_flag = 0
let g:MyGrep_MenuBar = 0

menu [マイメニュー].バッファ一覧        :BufList<CR>
menu [マイメニュー].NERDTree            :NERDTreeToggle<CR>
menu [マイメニュー].ハイライト消去      :Delhi<CR>
menu [マイメニュー].バイナリ編集        :Hex<CR>
menu [マイメニュー].ウィンドウを左右に広げる    :set columns+=10<CR>
menu [マイメニュー].ウィンドウを左右最大にする  :set columns+=1000<CR>
menu [マイメニュー].ウィンドウの左右を狭める    :set columns-=10<CR>
menu [マイメニュー].ウィンドウを上下に広げる    :set lines+=10<CR>
menu [マイメニュー].ウィンドウを上下最大にする  :set lines+=1000<CR>
menu [マイメニュー].ウィンドウの上下を狭める    :set lines-=10<CR>

" menu 検索.

menu [ファイル操作].ファイルタイプ.XML          :XmlType<CR>
menu [ファイル操作].ファイルタイプ.VIM          :VimType<CR>
menu [ファイル操作].改行コード.LF               :Lf<CR>
menu [ファイル操作].改行コード.CR               :Cr<CR>
menu [ファイル操作].改行コード.CRLF         :CrLf<CR>
menu [ファイル操作].エンコーディング.UTF8       :Utf8<CR>

menu [プロジェクト].プロジェクトペイン表示      :call ToggleNerdtPrj()<CR>
menu [プロジェクト].プロジェクトmake        :PrjMake<CR>
menu [プロジェクト].プロジェクトパス表示    :call ShowPrjPathFunc()<CR>
menu [プロジェクト].プロジェクトパス設定    :PrjPathSet 
menu [プロジェクト].プロジェクト内検索      :GrepProject<CR>

menu [設定].vimrc編集           :Vset<CR>
menu [設定].gvimrc編集          :Gset<CR>
menu [設定].set\.vim編集        :SetSet<CR>

" ツールバー追加
menu ToolBar.Nerdt :call ToggleNerdtPrj()<CR>

" コンテキストメニュー追加
anoremenu 1.10 PopUp.バッファ一覧   <ESC>:BufList<CR>
anoremenu 1.10 PopUp.バッファ一覧   <ESC>:BufList<CR>

nnoremenu 1.10 PopUp.実行(exe,bat)  :call ExecFile()<CR>

vnoremenu 1.10 PopUp.インデント\>\> >
vnoremenu 1.10 PopUp.インデント\<\< <
vnoremenu 1.10 PopUp.検索.ファイル内 :GrepBuf<CR>
vnoremenu 1.10 PopUp.検索.カレントフォルダ内 :GrepDir<CR>
vnoremenu 1.10 PopUp.検索.プロジェクトフォルダ内 :PrjGrep<CR>
vnoremenu 1.10 PopUp.置換   :Replace<CR>



