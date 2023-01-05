call plug#begin('~/.vim/plugged')
Plug 'sainnhe/gruvbox-material'
Plug 'neoclide/mycomment.vim'
" Git enhancement
Plug 'tpope/vim-fugitive'
" formatting and prettier
Plug 'mechatroner/rainbow_csv'
Plug 'tommcdo/vim-lion'
Plug 'Yggdroot/indentLine'
" others
Plug 'Yggdroot/LeaderF'
Plug 'troydm/zoomwintab.vim'
Plug 'ojroques/vim-oscyank'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'easymotion/vim-easymotion'
" tab and status line
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
filetype plugin indent on
filetype plugin on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set termguicolors
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_italic = 1
colorscheme gruvbox-material
"hi CocHighlightText ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
hi CocHighlightText ctermfg=234 ctermbg=142 guifg=#1d2021 guibg=#a9b665
"set background=dark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=2

set mouse=a
set cmdheight=1
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab
set autoindent
set smartindent
autocmd FileType js,ts setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType c,cpp,h,hpp setlocal expandtab shiftwidth=2 softtabstop=2

set hlsearch
set incsearch
set ruler
set ignorecase
set smartcase
set autoread
"set foldmethod=syntax
set nowrap
set colorcolumn=100

set listchars=tab:>-,trail:~,extends:>,precedes:<
" set listchars+=space:␣
set list

set nobackup
set nowritebackup
set noswapfile
set showcmd

set history=1000  " remember more commands and search history
set undodir=~/.vim/undodir
set undofile  " save undos
set undolevels=10000  " maximum number of changes that can be undone
set undoreload=100000  " maximum number lines to save for undo on a buffer reload

set number
set relativenumber
set showmode
set cursorline
set showbreak=↪
set laststatus=2
set showtabline=2
set autowrite
set splitright
set splitbelow
set completeopt=menuone,noselect,noinsert
" set pumheight=10
set clipboard+=unnamedplus

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader key shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
nnoremap <leader>w :w<CR>
nnoremap <leader><leader>q :q<CR>
nnoremap <leader>h :nohlsearch<CR>

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap Y y$

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enter automatically into the files directory
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter * silent! lcd %:p:h

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable highlight for self in python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup python
    autocmd!
    autocmd FileType python
                \   syn keyword pythonSelf self
                \ | highlight def link pythonSelf Number
augroup end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mark out tailing white spaces
" Removes trailing spaces
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
match ErrorMsg '\s\+$'
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
" nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration for nerdcommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
" Configuration for vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd FileType go nmap <leader>gb <Plug>(go-build)
"autocmd FileType go nmap <leader>gr <Plug>(go-run)
"autocmd FileType go nmap <leader>gt <Plug>(go-test)
"autocmd FileType go nmap <Leader>gi <Plug>(go-info)
" use quickfix everywhere and disable location list
" let g:go_list_type = "quickfix"
" use imports to auto config the missing imports
"let g:go_fmt_command = "goimports"
"let g:go_autodetect_gopath = 1
"" let g:go_fmt_fail_silently = 1
"let g:go_highlight_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_function_calls = 1
"" let g:go_highlight_operators = 1
"let g:go_highlight_generate_tags = 1
"let g:go_highlight_extra_types = 1
"let g:go_auto_type_info = 1
"let g:go_auto_sameids = 1
"
"let g:go_metalinter_autosave = 1
"let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
"let g:go_def_mapping_enabled = 0
"
"let g:go_debug_preserve_layout = 1
"let g:go_debug_breakpoint_sign_text = '*'
"let g:go_debug_log_output = ''
"let g:go_debug_windows = {
"        \ 'vars':       'leftabove 80vnew',
"        \ 'stack':      'leftabove 20new',
"        \ 'goroutines': 'botright 10new',
"        \ 'out':        'botright 5new',
"\ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LeaderF configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
"let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
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
" xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
" noremap go :<C-U>Leaderf! rg --recall<CR>

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
" easy motion configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <Leader> <Plug>(easymotion-prefix)
"map  <leader><leader>s <Plug>(easymotion-sn)
"omap <leader><leader>s <Plug>(easymotion-tn)
" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
"map  f <Plug>(easymotion-next)
"map  F <Plug>(easymotion-prev)
"map  <Leader>f <Plug>(easymotion-bd-f)
"nmap <Leader>f <Plug>(easymotion-overwin-f)

"map  <leader><leader>w <Plug>(easymotion-bd-w)
"nmap <Leader><leader>w <Plug>(easymotion-overwin-w)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COC settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
      \'coc-explorer',
      \'coc-highlight',
      \'coc-lists',
      \'coc-pairs',
      \'coc-git',
      \'coc-yank',
      \'coc-pyright',
      \'coc-xml',
      \'coc-json',
      \'coc-cmake',
      \'coc-sh',
      \]
" Recommended config for COC
" Better display for messages
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

let g:indentLine_fileTypeExclude = ['coc-explorer']
nmap <silent><leader>e :CocCommand explorer<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-lion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lion_squeeze_spaces = 1
let g:lion_create_maps = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" add surrounding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>' ysiw'
nmap <leader>" ysiw"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"for s:path in split(glob('~/.vim/vimrc/*.vim'), "\n")
"  exe 'source ' . s:path
"endfor

autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" settings for neovide
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=UbuntuMono\ Nerd\ Font\ Mono:h16
let g:neovide_remember_window_size = v:true

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" settings tab and status lines
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << END
require('lualine').setup{
    options = { theme = 'auto' },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            'branch',
            'diff',
            {
                'diagnostics',
                sources = {'coc'}
            }
        },
        lualine_c = {
            {'filename', path = 1},
            {'b:coc_current_function'},
            {'g:coc_status'},
            },
        lualine_x = {
            'encoding',
            'fileformat',
            'filetype',
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    tabline = {
        lualine_a = {{'tabs', mode = 2}},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
            {
                'buffers',
                icons_enabled = false
            }
        }
    },
    extensions = {'fugitive'}
}
END
