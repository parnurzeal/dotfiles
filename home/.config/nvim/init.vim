"" === Guides === 
" Many Cool Plugins: https://dev.to/evilcel3ri/i-spent-3-years-configuring-n-vim-and-this-what-i-learnt-22on
" Web Dev: https://www.freecodecamp.org/news/a-guide-to-modern-web-development-with-neo-vim-333f7efbf8e2/ 
" Cool vim setup: https://github.com/ctaylo21/jarvis
" Cool config example (from the same person): https://github.com/ctaylo21/jarvis/blob/master/config/nvim/init.vim#L58
" More settings w/ tmux & zsh: https://www.freecodecamp.org/news/coding-like-a-hacker-in-the-terminal-79e22954968e/

" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "
" Setting up vim-plug (github.com/junegunn/vim-plug)
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

"" NERDTree
Plug 'scrooloose/nerdtree'
"" Better nerdtree in all tabs
Plug 'jistr/vim-nerdtree-tabs'
"" this is for auto complete, prettier and tslinting
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'} 
"" auto-pairs to auto close ( [ {
Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {
"" Lightline - Powerful tabline (similar to powerline but lighter)
Plug 'itchyny/lightline.vim'
"" Vim-devicons - adding icons
Plug 'ryanoasis/vim-devicons'
"" vim-startify - fancy start page
" TODO: Make it even fancier.
Plug 'mhinz/vim-startify'
"" Dracula color scheme (Dark theme).
Plug 'dracula/vim', { 'as': 'dracula' }
"" Fuzzy search
" TODO: learn more about fzf#run and other commands.
" https://github.com/junegunn/fzf/blob/master/README-VIM.md
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"" Temporary Solidity syntax.
" TODO: REmove after Coc can support solidity.
Plug 'tomlion/vim-solidity'

call plug#end()

" === NERDTree settings === "
nmap <C-\> :NERDTreeTabsToggle<CR>
" Shortcut keys moving between tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
inoremap <C-Left> <Esc>:tabprevious<CR>
inoremap <C-Right> <Esc>:tabnext<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
inoremap <C-h> <Esc>:tabprevious<CR>
inoremap <C-l> <Esc>:tabnext<CR>
nnoremap <silent> <Esc><Esc>[D :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <Esc><Esc>[C :execute 'silent! tabmove ' . tabpagenr()<CR>

" === coc.nvim === "
" TODO: learn more usage of coc.
" list of CoC extensions needed.
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-flutter']  
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
"   gd    - Jump to definition of current symbol
"   gy    - Jump to type definition
"   gr    - Jump to references of current symbol
"   gi    - Jump to implementation of current symbol
"   gs    - Fuzzy search current project symbols
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ============================================================================ "
" ===                           EDITING OPTIONS                            === "
" ============================================================================ "
set clipboard=unnamed       " Yank and paste with the system clipboard
set hlsearch                " highlight search 
set ignorecase              " case insensitive
set showmatch               " show matching 
set nowrap                  " do not wrap long lines by default
set number                  " add line numbers
set cc=80                   " set an 80 column border for good coding 
set mouse=a                 " enable mouse click
" === TAB/Space settings === "
set expandtab               " Insert spaces when TAB is pressed.
set softtabstop=2           " Change number of spaces that a <Tab> counts for during editing ops. It sees multiple spaces as tabstops so <BS> does the right thing
set tabstop=2               " number of columns occupied by a tab 
set shiftwidth=2            " Indentation amount for < and > commands.
set autoindent              " indent a new line the same amount as the line just typed

" === Navigation === "
" switch between window buffer
noremap <leader>w <C-^>

" === Command mode shortcuts === "
" alt-b to move one word left
" alt-f to move one word right
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "
syntax enable
let g:dracula_colorterm = 0
colorscheme dracula
"" Lightline settings.
" It is meant to be lightweight and no dependency on other plugin.
" It provides a great way to configure and integrate with other plugin.
" See: https://github.com/itchyny/lightline.vim
" Or :h g:lightline
let g:lightline = {'colorscheme': 'dracula'}
