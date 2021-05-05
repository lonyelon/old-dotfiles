syntax enable

set hidden
"set nowrap
set encoding=utf-8
set fileencoding=utf-8
set ruler
set iskeyword+=-
"set mouse=a

set splitbelow
set splitright

set conceallevel=0

set nu
set rnu
set tabstop=4
set shiftwidth=4
set colorcolumn=80

highlight ColorColumn ctermbg=black guibg=black

nnoremap ñn :set rnu!<CR>
nnoremap ñm :w<CR>:!make<CR>
nnoremap ñc :w<CR>:!~/Scripts/vim/cmake.sh<CR>
nnoremap ñb :w<CR>:!%:p<CR>
nnoremap ñl :w<CR>:!pdflatex -shell-escape Main.tex<CR>
map <C-W>V :sp<CR>

tnoremap <Esc> <C-\><C-n>
