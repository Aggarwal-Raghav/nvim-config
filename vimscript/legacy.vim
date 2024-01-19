" legacy stuff that couldn't move to lua

" tabs and spaces for specific files
autocmd Filetype javascript,typescript,typescriptreact,javascriptreact,svelte,xml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype terraform setlocal tabstop=2 shiftwidth=2 softtabstop=2 noexpandtab

" spell check for specific files
autocmd FileType latex,tex,md,markdown setlocal spell

" comment strings for specific files
autocmd FileType julia setlocal commentstring=#\ %s
autocmd FileType c,cpp,java setlocal commentstring=//\ %s
autocmd FileType terraform setlocal commentstring=#\ %s

" nicer keybinds in terminal
tnoremap <Esc> <C-\><C-n>
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

set mouse=r

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

set viminfo+=n~/.local/share/nvim/viminfo
