if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
" Better nerdtree in all tabs
Plug 'jistr/vim-nerdtree-tabs'
" Deoplete - Code completion framework
" Need python3. If error, try `pip3 install --user pynvim`
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
"" Install javasript deoplete source.
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

call plug#end()

" NERDTree
nmap <C-\> :NERDTreeTabsToggle<CR>
" Deoplete
" Binds C-j and C-k to control up-down to select autocomplete
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
