
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 用户自定义配置（该文件放一般性配置，可覆盖~/.vimrc里的配置，若要增加、卸载插件，请放入~/.vimrc.custom.plugins）
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 开启相对行号
set relativenumber  

" 开启鼠标
set mouse=a

" 设置光标所在列高亮
set cursorcolumn

" indentLine 开启代码对齐线
let g:indentLine_enabled = 1

" markdown
" let system = system('uname -s')
" if system == "Darwin\n"
"     let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
" else
"     let g:mkdp_path_to_chrome = '/usr/bin/google-chrome-stable %U'
" endif
" nmap <silent> <F7> <Plug>MarkdownPreview
" imap <silent> <F7> <Plug>MarkdownPreview
" nmap <silent> <F8> <Plug>StopMarkdownPreview
" imap <silent> <F8> <Plug>StopMarkdownPreview

" Doxygen
" let g:DoxygenToolkit_authorName="chxuan, 787280310@qq.com"
" let s:licenseTag = "Copyright(C)\<enter>"
" let s:licenseTag = s:licenseTag . "For free\<enter>"
" let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
" let g:DoxygenToolkit_licenseTag = s:licenseTag
" let g:DoxygenToolkit_briefTag_funcName="yes"
" let g:doxygen_enhanced_color=1
" let g:DoxygenToolkit_commentType="Qt"
set scrolloff=5
set foldmethod=indent
nmap <leader>vc :vsplit<CR>:e ~/.vim_runtime/my_configs.vim<CR>
" nmap <leader>vp :vsplit<CR>:e ~/.vimrc.custom.plugins<CR>
nmap <leader>q :wq<CR>
nmap <leader><leader>q :wa \| qall<CR>

" Map Shift+W to :tabprevious
nnoremap <S-W> :tabprevious<CR>

" Map Shift+B to :tabnext
nnoremap <S-B> :tabnext<CR>

" Map Shift+1 to go to the 1st tab
nnoremap ! :tabnext 1<CR>

" Map Shift+2 to go to the 2nd tab
nnoremap @ :tabnext 2<CR>

" Map Shift+3 to go to the 3rd tab
nnoremap # :tabnext 3<CR>

nmap <leader>= ggvG=<c-O><c-O>
" autocmd VimEnter * NERDTree
map <F2> :NERDTreeToggle<CR>
autocmd VimEnter * Tagbar
map <F1> :TagbarToggle<CR>
"autocmd FileType * inoremap <buffer> <leader>/ <C-r>=CommentToggle()<CR>
"autocmd FileType * nnoremap <buffer> <leader>/ :call CommentToggle()<CR>
" Important!!
if has('termguicolors')
  set termguicolors
endif

" For dark version.
set background=dark

" For light version.
"set background=light

" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'soft'

" For better performance
let g:everforest_better_performance = 1

colorscheme everforest
" Redimensionner la fenêtre vers le haut
nnoremap <C-K> :resize -2<CR>
nnoremap <leader>k <C-w>k

" Redimensionner la fenêtre vers le bas
nnoremap <C-J> :resize +2<CR>
nnoremap <leader>j <C-w>j

" Redimensionner la fenêtre vers la gauche
nnoremap <C-H> :vertical resize -2<CR>
nnoremap <leader>h <C-w>h

" Redimensionner la fenêtre vers la droite
nnoremap <leader>l <C-w>l
nnoremap <C-L> :vertical resize +2<CR>
" Définition de la fonction CommentToggle
"function! CommentToggle()
"" 获取当前文件类型
"let l:filetype = &filetype
"let l:old_pos = getpos(".")
"let l:line = getline('.')
"let l:first_char = strpart(l:line, 0, 1)
"" 根据文件类型添加不同的注释
"if l:first_char == '"' || l:first_char == "/"
"execute 'normal! 0xx'
"call setpos(".", old_pos)
"elseif l:filetype == 'vim'
"execute 'normal! 0i" '
"call setpos('.', old_pos)
"elseif l:filetype == 'c' || l:filetype == 'cpp'
"execute 'normal! 0i//'
"call setpos('.', old_pos)
"endif

"endfunction
nnoremap <C-E> :!gedit %<CR>
nnoremap <leader>cr :!clear<CR>
nnoremap <leader>mk :wa<CR>:!make<CR>
nnoremap <leader>.r :!./
vnoremap ( s(<esc>pi)<esc>
" un file fréquent récemment
nmap <leader>t :tabe 
vmap <leader>s :s/\%V.*\%V//gc

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim_runtime'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" List your plugins here
Plug 'sainnhe/everforest.git'
Plug 'junegunn/vim-plug.git'
Plug 'sheerun/vim-polyglot.git'
"Plug 'h-youhei/vim-ibus'
"Plug 'ybian/smartim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'zhmars/vim-ibus', {'as': 'ibus'}
"Plug 'yuweijun/vim-wb'

Plug 'ZSaberLv0/ZFVimIM'
Plug 'ZSaberLv0/ZFVimJob' " 可选, 用于提升词库加载性能
Plug 'LucHermitte/lh-vim-lib'

"安装插件
Plug 'mzlogin/vim-markdown-toc'
Plug 'liuchengxu/vista.vim'

call plug#end()

let g:vmt_auto_update_on_save = 0
" coc-ci for chinese tokenizer
nmap <silent> w <Plug>(coc-ci-w)
nmap <silent> b <Plug>(coc-ci-b)

" COC Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:coc_user_config = {
      \ 'suggest.noselect': v:true
      \ }
" Configuration for vim-ibus
"let g:ibus#layout = 'xkb:us::eng'

"let g:ibus#engine = 'rime'
"set imsearch=0
"imap <C-Space> <C-_>
"nmap <C-Space> <C-_>

function! s:myLocalDb()
    let db = ZFVimIM_dbInit({
                \   'name' : 'wubi',
                \ })
    call ZFVimIM_cloudRegister({
                \   'mode' : 'local',
                \   'dbId' : db['dbId'],
                \   'repoPath' : '~/Documents/configs/', 
                \   'dbFile' : 'vimim.wubijd.txt' 
                \ })
endfunction
if exists('*ZFVimIME_initFlag') && ZFVimIME_initFlag()
    call s:myLocalDb()
else
    autocmd User ZFVimIM_event_OnDbInit call s:myLocalDb()
endif


inoremap <ESC>oA <up>
inoremap <ESC>oB <down>
inoremap <ESC>oC <right>
inoremap <ESC>oD <left>
inoremap <ESC>OA <up>
inoremap <ESC>OB <down>
inoremap <ESC>OC <right>
inoremap <ESC>OD <left>

let g:ZFVimIM_showKeyHint = 0 
let g:ZFVimIM_symbolMap = {
            \   ' ' : [''],
            "\   '`' : ['·'],
            \   '!' : ['！'],
            "\   '$' : ['￥'],
            \   '^' : ['……'],
            \   '-' : [''],
            \   '_' : ['——'],
            "\   '(' : ['（'],
            "\   ')' : ['）'],
            "\   '[' : ['【'],
            "\   ']' : ['】'],
            \   '<' : ['《'],
            \   '>' : ['》'],
            \   '\' : ['、'],
            "\   '/' : ['、'],
            \   ';' : ['；'],
            \   ':' : ['：'],
            \   ',' : ['，'],
            \   '.' : ['。'],
            \   '?' : ['？'],
            \   "'" : ['‘', '’'],
            \   '"' : ['“', '”'],
            "\   '0' : [''],
            "\   '1' : [''],
            "\   '2' : [''],
            "\   '3' : [''],
            "\   '4' : [''],
            "\   '5' : [''],
            "\   '6' : [''],
            "\   '7' : [''],
            "\   '8' : [''],
            "\   '9' : [''],
            \   'A' : ['a'],
            \   'B' : ['b'],
            \   'C' : ['c'],
            \   'D' : ['d'],
            \   'E' : ['e'],
            \   'F' : ['f'],
            \   'G' : ['g'],
            \   'H' : ['h'],
            \   'I' : ['i'],
            \   'J' : ['j'],
            \   'K' : ['k'],
            \   'L' : ['l'],
            \   'M' : ['m'],
            \   'N' : ['n'],
            \   'O' : ['o'],
            \   'P' : ['p'],
            \   'Q' : ['q'],
            \   'R' : ['r'],
            \   'S' : ['s'],
            \   'T' : ['t'],
            \   'U' : ['u'],
            \   'V' : ['v'],
            \   'W' : ['w'],
            \   'X' : ['x'],
            \   'Y' : ['y'],
            \   'Z' : ['z'],
            \ }

imap <leader>. ，
"inoremap <leader>a A
"inoremap <leader>b B
"inoremap <leader>c C
"inoremap <leader>d D
"inoremap <leader>e E
"inoremap <leader>f F
"inoremap <leader>g G
"inoremap <leader>h H
"inoremap <leader>i I
"inoremap <leader>j J
"inoremap <leader>k K
"inoremap <leader>l L
"inoremap <leader>m M
"inoremap <leader>n N
"inoremap <leader>o O
""inoremap <leader>p P
"inoremap <leader>q Q
"inoremap <leader>r R
"inoremap <leader>s S
"inoremap <leader>t T
"inoremap <leader>u U
"inoremap <leader>v V
"inoremap <leader>w W
"inoremap <leader>x X
"inoremap <leader>y Y
"inoremap <leader>z Z

" 4 码自动上屏
function! s:check()
    let state = ZFVimIME_state()
    if len(state['key']) == 4
        if !empty(state['list'])
            call feedkeys("\<space>", 't')
        else
            call feedkeys(repeat("\<bs>", len(state['key'])), "nt")
        endif
    endif
endfunction
autocmd User ZFVimIM_event_OnUpdateOmni call s:check()
"let g:ZFVimIM_sentence = 0
"let g:ZFVimIM_predictLimit = 0
"let g:ZFVimIM_matchLimit = -1