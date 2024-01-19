" legacy stuff that couldn't move to lua

" Jump to last position
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'gitcommit'
  \ |   exe "normal! g`\""
  \ | endif

" tabs and spaces for specific files
autocmd Filetype javascript,typescript,typescriptreact,javascriptreact,svelte,xml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
" autocmd Filetype cpp,c setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
" autocmd Filetype go setlocal tabstop=2 shiftwidth=2 softtabstop=2 noexpandtab
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

"For styling cpp program
autocmd FileType python noremap <leader>w :!yapf -i --style=google %<CR>
autocmd FileType python noremap <leader>s :!black %<CR>
autocmd FileType python xnoremap <leader>s :!black -q -<CR>
autocmd FileType python noremap <leader>p :!doq --file % --style=string --formatter=google -w<CR>
autocmd FileType c,cpp,java,scala noremap <leader>w :!astyle -p -U -O -f -y -Y -xj -xV -xp -xb -xp -Z -xg -xe -W1 -S -K -N -k1 -C --style=google % && rm %.orig<CR>
autocmd FileType c,cpp,java,scala noremap <leader>s :!astyle -p -U -O -f -y -Y -xj -xV -xp -xb -xp -Z -xg -xe -W1 -S -K -N -k1 -C --style=allman % && rm %.orig<CR>
autocmd FileType c,cpp,java,scala vnoremap <leader>w :!astyle -p -U -O -f -y -Y -xj -xV -xp -xb -xp -Z -xg -xe -W1 -S -K -N -k1 -C --style=google <CR>
autocmd FileType c,cpp,java,scala vnoremap <leader>s :!astyle -p -U -O -f -y -Y -xj -xV -xp -xb -xp -Z -xg -xe -W1 -S -K -N -k1 -C --style=allman <CR>

set viminfo+=n~/.local/share/nvim/viminfo
