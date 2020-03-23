" required
set nocompatible
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'valloric/youcompleteme'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'
Plugin 'Yggdroot/indentLine'
Plugin 'Yggdroot/LeaderF'

Plugin 'morhetz/gruvbox'
" Plugin 'ervandew/supertab'
Plugin 'elzr/vim-json'
" Plugin 'pangloss/vim-javascript'
" Plugin 'tfnico/vim-gradle'
" Plugin 'leafgarland/typescript-vim'

" auto pair parenthensis
Plugin 'jiangmiao/auto-pairs'
" show git diff inline
" Plugin 'airblade/vim-gitgutter'
" Plugin 'mhinz/vim-signify'

" for Perl and ack
Plugin 'mileszs/ack.vim'
" snippet
Plugin 'SirVer/ultisnips'
" Plugin 'shougo/neosnippet-snippets'
" Plugin 'shougo/neosnippet.vim'
" Plugin 'shougo/deoplete.nvim'

" Plugin 'fatih/vim-go'
" Plugin 'nsf/gocode', {'rtp': 'vim/'}
" Plugin 'sebdah/vim-delve'
" Plugin 'zchee/deoplete-go'

Plugin 'w0rp/ale'
" ,be ,bt ,bs ,bv
Plugin 'jlanzarotta/bufexplorer'

call vundle#end()
filetype plugin indent on
filetype plugin on
syntax on

colorscheme gruvbox
" let g:gruvbox_italic=1
" let g:gruvbox_italicize_strings=1
" let g:gruvbox_improved_strings=1
let g:gruvbox_contrast_dark="hard"

set background=dark
set backspace=2
set mouse=a

" force using all spaces for tab
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab
" auto indent will copy the indent from previous line
set autoindent
" smartindent is filetype based, cindent automatically turned on for c files
set smartindent
" use 4 as indent width for python
autocmd FileType javascript,js,ts setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType c,cpp setlocal expandtab shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
" Search
set hlsearch
set incsearch
set ruler
set ignorecase
set smartcase
" auto read file when file changes
set autoread
" set textwidth=100
set colorcolumn=100
" set nowrap
" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set listchars=tab:>-,trail:~,extends:>,precedes:<
" set listchars+=space:␣
set list
set nobackup
set nowritebackup
set noswapfile
set showcmd

" Leader key shortcuts
let mapleader = ","
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>s :NERDTreeFind<CR>
" nnoremap <leader>h :nohlsearch<CR>
nnoremap <silent> <C-h> :nohlsearch<CR>

" mapping meta to navigate pane
tnoremap <Esc> <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <C-w>i <C-w>v

command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Act like D and C
nnoremap Y y$

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h

" line numbers
set number
set relativenumber
" Show current mode
set showmode
" Highlight current line
set cursorline
" show a better line wrap
set showbreak=↪
set laststatus=2
set autowrite
set splitright
set splitbelow
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10
set clipboard+=unnamedplus

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dealing with the trailing whitespaces
match ErrorMsg '\s\+$'
" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

" nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" if &term =~ '256color'
"     set t_ut=
"     set t_Co=256
" endif
set termguicolors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration for CtrlP
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
" let g:ctrlp_custom_ignore = {
"     \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
"     \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
"     \ }
" "\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
" let g:ctrlp_working_path_mode=0
" let g:ctrlp_match_window_bottom=1
" let g:ctrlp_max_height=15
" let g:ctrlp_match_window_reversed=0
" let g:ctrlp_mruf_max=500
" let g:ctrlp_follow_symlinks=1
" " use ag to replace grep
" if executable('ag')
"   " Use Ag over Grep
"   set grepprg=ag\ --nogroup\ --nocolor
"   " Use ag in CtrlP for listing files.
"   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"   " Ag is fast enough that CtrlP doesn't need to cache
"   let g:ctrlp_use_caching = 0
" endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration for tagbar
map <F3> :TagbarToggle<CR>
" map <F9> :!ctags -R

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config for vim airline
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration for nerdtree
"au vimenter * NERDTree
"au vimenter * wincmd p

"autocmd StdinReadPre * let s:std_in=1
"function! OpenNERDTree()
"        if argc() == 0 && !exists("s:std_in")
"                NERDTree        " focus on NERDTree if no file is specified
"        else
"                NERDTree        " focus on the file
"                wincmd p
"        endif
"endfunction
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | else | NERDTree | wincmd p | endif
"au vimenter * call OpenNERDTree()
map <F2> :NERDTreeToggle<CR>
" close nerdtree if no file is open
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinSize=35
let NERDTreeShowHidden=1
" auto open NERDTree for new tab
"au BufWinEnter * if !argc() | NERDTreeMirror | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration for nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/youcompleteme/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_comments = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
" Code navigation with Ctrl-] , use Ctrl-O to get back to previous location
 " this will create new entries in the jumplist
" using Ctrl+O to go back and Ctrl+I to go forward
nnoremap <silent> <C-]> :YcmCompleter GoTo<CR>
" nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration for vim-go
" map <C-n> :cnext<CR>
" map <C-m> :cprevious<CR>
" nnoremap <leader>a :cclose<CR>
"
" autocmd FileType go nmap <leader>b <Plug>(go-build)
" autocmd FileType go nmap <leader>r <Plug>(go-run) <C-w>l
" autocmd FileType go nmap <leader>t <Plug>(go-test)
" autocmd FileType go nmap <Leader>i <Plug>(go-info)
" " autocmd FileType go ALEDisable
" " use quickfix everywhere and disable location list
" let g:go_list_type = "quickfix"
" " use imports to auto config the missing imports
" let g:go_fmt_command = "goimports"
" let g:go_autodetect_gopath = 1
" let g:go_fmt_fail_silently = 1
"
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" " let g:go_highlight_operators = 1
" let g:go_highlight_generate_tags = 1
" let g:go_highlight_extra_types = 1
"
" " call lint
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
" " Navigation
" " C-] or gd == :GoDef
" " C-t == go back
" let g:go_auto_type_info = 1
" let g:go_auto_sameids = 1
" let g:go_snippet_engine = "neosnippet"
" " Open :GoDeclsDir with ctrl-g
" autocmd FileType go nmap <C-g> :GoDeclsDir<cr>
" autocmd FileType go imap <C-g> <esc>:<C-u>GoDeclsDir<cr>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if has('nvim')
"     " Enable deoplete on startup
"     let g:deoplete#enable_at_startup = 1
" endif
" " Disable deoplete when in multi cursor mode
" function! Multiple_cursors_before()
"     let b:deoplete_disable_auto_complete = 1
" endfunction
" function! Multiple_cursors_after()
"     let b:deoplete_disable_auto_complete = 0
" endfunction
"
" " neocomplete like
" set completeopt+=noinsert
" " deoplete.nvim recommend
" set completeopt+=noselect
"
" " Path to python interpreter for neovim
" let g:python3_host_prog  = '/usr/bin/python3'
" " Skip the check of neovim module
" let g:python3_host_skip_check = 1
"
" " Run deoplete.nvim automatically
" let g:deoplete#enable_at_startup = 1
" " deoplete-go settings<
" let g:deoplete#sources#go#gocode_binary = '/home/mc/go/bin/gocode'
" let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" " let g:go_metalinter_autosave_enabled = ['golint', 'vet']
"
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Error and warning signs.
autocmd FileType c,cpp,h,hpp ALEDisable
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
\    'go': ['gometalinter'],
\    'python': ['flake8']
\}
" let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 1, 'BufTag': 1 }

let g:Lf_ShortcutF = "<C-P>"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
" noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>ff :<C-U><C-R>=printf("Leaderf function %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf rg --current-buffer -e %s ", expand("<cword>"))<CR><CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf rg -e %s ", expand("<cword>"))<CR><CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

let g:Lf_PopupPalette = {
    \  'dark': {
    \      'Lf_hl_popup_window': {
    \                'guibg': '#282828',
    \                'ctermbg': '235'
    \              }
    \      }
    \  }

" " should use `Leaderf gtags --update` first
" let g:Lf_GtagsAutoGenerate = 0
" let g:Lf_Gtagslabel = 'native-pygments'
" noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
" noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
" noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
" noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
" noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:current_filename = expand('%:t')
" let g:current_filename = bufname(bufnr('%'))
" if match(current_filename, '\.go$') != -1
"     " if true for return value == 0
"     if match(current_filename, '_test\.go$') != -1
"         nnoremap <leader>d :DlvTest<CR>
"     else
"         nnoremap <leader>d :DlvDebug<CR>
"     endif
" elseif match(current_filename, '\.py$') != -1
"     " add a to enter edit mode explicitly
"     nnoremap <leader>d :VT ipdb %<CR>a
" endif

" au FileType go nnoremap <expr> <leader>d match(bufname(bufnr('%')), '_test\.go$') != -1 ? ':DlvTest<CR>' : ':DlvDebug<CR>'
au FileType python nnoremap <leader>d :VT ipdb %<CR>a

