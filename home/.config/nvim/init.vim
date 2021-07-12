" Setting up vim-plug (github.com/junegunn/vim-plug)
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

"" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"" Better nerdtree in all tabs
Plug 'jistr/vim-nerdtree-tabs'
"" this is for auto complete, prettier and tslinting
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} 
"" Lightline - Powerful tabline (similar to powerline but lighter)
Plug 'itchyny/lightline.vim'

call plug#end()

"" NERDTree settings.
nmap <C-\> :NERDTreeTabsToggle<CR>

"" Lightline settings.
" It is meant to be lightweight and no dependency on other plugin.
" It provides a great way to configure and integrate with other plugin.
" See: https://github.com/itchyny/lightline.vim
" Or :h g:lightline
let g:lightline = {'colorscheme': 'one'}

"" Coc settings.
" list of CoC extensions needed.
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  
