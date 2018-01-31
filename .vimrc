" Vim configuration
" 1/30/2018

syntax on

set autoindent " copy indent from current line when starting new line
set autoread " Read changes made outside of Vim if file unmodified in Vim
set autowrite
set backspace=indent,eol,start
set colorcolumn=81 " Mark the 81st column
" Color the 81st column, set to black but looks nice in Solarized
highlight ColorColumn ctermbg=0 guibg=0
set history=200 " increase size of command history
set infercase " Smart casing with completion
set ignorecase " Ignore case when searching all lowercase
set laststatus=2 " Always show the status line
set expandtab " Use spaces in place of a <Tab>
set shiftwidth=4 " Number of spaces to use for each indent

" Giving the fold thing a shot
set foldlevelstart=20
set foldmethod=indent " Simple and fast
set foldtext=""

set gdefault " Always do global substitutes
set nocompatible " No Vi compatibility
set incsearch " Always go right to the result
set nohlsearch " Don't highlight search results by default (eh)

set number " Show line numbers
set nowrapscan " Don't wrap searches around
set ruler " show line and column number in status bar
set smartcase " Don't ignorecase if using capitalization
set textwidth=79 " max text width for one line
set t_Co=256 " 256 color support

" Extra whitespace highlighting
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Customizations per filetype
" Adapted from https://github.com/bluz71/dotfiles/blob/master/vimrc
augroup languageCustomizationsByType
    " Note, 'autocmd!' is used to clear out any existing definitions in
    " this auto-group. This prevents duplicate entries upon a live vimrc
    " reload.
    autocmd!
    autocmd FileType c,cpp setlocal shiftwidth=8 foldmethod=syntax noexpandtab
augroup END
