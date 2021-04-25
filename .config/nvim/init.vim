set nu
set rnu
set tabstop=4
set shiftwidth=4

set splitbelow
set splitright

set colorcolumn=80
highlight ColorColumn ctermbg=black guibg=black

nnoremap ñn :set rnu!<CR>
nnoremap ñm :w<CR>:!make<CR>
nnoremap ñc :w<CR>:!~/Scripts/vim/cmake.sh<CR>
nnoremap ñb :w<CR>:!%:p<CR>
nnoremap ñl :w<CR>:!pdflatex -shell-escape Main.tex<CR>
map <C-W>V :sp<CR>

tnoremap <Esc> <C-\><C-n>
