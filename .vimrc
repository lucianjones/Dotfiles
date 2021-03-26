
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Dec 17
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

set nocompatible
set nu
set tabstop=4
set shiftwidth=0
set expandtab
set clipboard=unnamedplus
set number relativenumber
set termguicolors
set ttymouse=sgr

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=100
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arzg/vim-rust-syntax-ext'
Plug 'tpope/vim-fugitive'
Plug 'svermeulen/vim-easyclip'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
"Plug 'jiangmiao/auto-pairs'
Plug 'francoiscabrol/ranger.vim'
"Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

" Ale stuff
hi ALEError ctermbg=none cterm=italic,bold ctermfg=160 guifg=NONE guibg=NONE
hi ALEWarning ctermbg=none cterm=italic,bold ctermfg=Yellow guifg=NONE guibg=NONE
hi ALEErrorSign ctermbg=none ctermfg=Yellow guifg=NONE guibg=NONE
hi ALEWarningSign ctermbg=none ctermfg=160 guifg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guifg=NONE guibg=NONE
hi ErrorMsg ctermbg=NONE cterm=italic,bold ctermfg=160 guifg=NONE guibg=NONE
hi Error ctermbg=NONE cterm=italic,bold ctermfg=160 guifg=NONE guibg=NONE
hi LineNr term=underline guifg=#009ae1
hi type guifg=#ff6131
hi Constant ctermfg=13 guifg=#A9A9A9
hi Identifier guifg=#5cc6aa
hi SpecialKey guifg=#009ae1
hi Directory guifg=#009ae1
hi Statement ctermfg=NONE guifg=#ff6131
"hi PreProc guifg=#d9a047
hi Comment guifg=#3a4949
hi PreProc guifg=#C95D6B
hi Special guifg=#398c8b
hi Normal guifg=#009ae0
hi jsObjectProp guifg=#398c8b
hi jsObjectKey guifg=#398c8b
hi jsObjectValue guifg=#c95d6b
hi StatusLineNC gui=NONE cterm=NONE
hi StatusLine gui=NONE cterm=NONE

hi airline_x_inactive guibg=NONE
hi airline_x_inactive_bold  guibg=NONE
hi airline_x_inactive_red guibg=NONE
hi airline_y_inactive  guibg=NONE
hi airline_y_inactive_bold guibg=NONE
hi airline_y_inactive_red  guibg=NONE
hi airline_z_inactive  guibg=NONE
hi airline_z_inactive_bold guibg=NONE
hi airline_z_inactive_red  guibg=NONE
hi airline_a_inactive guibg=NONE
hi airline_a_inactive_bold guibg=NONE
hi airline_a_inactive_red guibg=NONE
hi airline_b_inactive guibg=NONE
hi airline_b_inactive_bold guibg=NONE
hi airline_b_inactive_red guibg=NONE
hi airline_c_inactive guibg=NONE
hi airline_c_inactive_bold guibg=NONE
hi airline_c_inactive_red guibg=NONE
hi airline_x guibg=NONE
hi airline_x_bold guibg=NONE
hi airline_x_red guibg=NONE
hi airline_y guibg=NONE
hi airline_y_bold guibg=NONE
hi airline_y_red guibg=NONE
hi airline_z guibg=NONE
hi airline_z_bold guibg=NONE
hi airline_z_red guibg=NONE
hi airline_term guibg=NONE
hi airline_term_bold guibg=NONE
hi airline_term_red guibg=NONE
hi airline_error guibg=NONE
hi airline_error_bold guibg=NONE
hi airline_error_red guibg=NONE
hi airline_a guibg=NONE
hi airline_a_bold guibg=NONE
hi airline_a_red guibg=NONE
hi airline_b guibg=NONE
hi airline_b_bold guibg=NONE
hi airline_b_red guibg=NONE
hi airline_c guibg=NONE
hi airline_c_bold guibg=NONE
hi airline_c_red guibg=NONE
hi airline_warning guibg=NONE
hi airline_warning_bold guibg=NONE
hi airline_warning_red guibg=NONE
hi airline_c_to_airline_x guibg=NONE
hi airline_c1_inactive guibg=NONE
hi VertSplit gui=NONE cterm=NONE term=NONE

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '~'

let g:ale_linters = {
\		'rust': ['analyzer', 'cargo', 'rls', 'rustc'],
\		'javascript': ['eslint'],
\		'jsx': ['eslint'],
\}

let g:ale_fixers = {
\  'javascript': ['eslint'],
\  'jsx': ['eslint'],
\}

let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1

hi Search ctermbg=NONE ctermfg=NONE cterm=italic,underline,bold guifg=NONE guibg=NONE
syntax enable
filetype plugin indent on
let g:airline_theme='monochrome'

map ; :Files<CR>
let g:ranger_map_keys = 0
map - :Ranger<CR>


