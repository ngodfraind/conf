set nocompatible
set number
set tabstop=4                  "Identation every 4 columns
set softtabstop=4              "Let backspace delete indent
set expandtab
set autoindent
set ignorecase                 "Insensitive search"
set showmode                   "Display the current mode
set ruler
set showcmd                    "Show partial commands in status line
set history=1000               "Lot of history
set backspace=indent,eol,start "Backspace for dummies
set hlsearch                   "Highlight search results
set wildmenu                   "Show list instead if just completing
set wildmode=list:longest,full "Command <Tab> completion, list matches, then longest common part, then all.

syntax enable

"autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
