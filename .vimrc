"General configs {
    let mapleader = ","
    let maplocalleader = ','
    set nobackup
    set backspace=indent,eol,start
    set showcmd	" display incomplete commands
    set number
    syn on          " syntax highlighting
    set ruler       "We have the vertical position 
    set mouse=a
    set hlsearch
    set encoding=utf-8 fileencodings=.
    filetype plugin on "read filtype dir
"}

 
" Menu to switch between options {
    set wildmode=longest,full 
    set wildmenu
    set wildignore=*.swp,!,7,Makefile.*,<,Session.vim, " Seront ignores par le wildmenu les fichiers correspondants aux criteres du wildignore
    set suffixes=.aux,.bak,.bbl,.blg,.gif,.gz,.idx,.ilg,.info,.jpg,.lof,.log,;lot,.o,.obj,.pdf,.png,.swp,.tar,.toc,~,mount,in,pyc,pyo "unsed suffixes
    let g:netrw_list_hide='\.aux$,\.bak$,\.bbl$,\.blg$,\.gif$,\.gz$,\.idx$,\.ilg$,\.info$,\.jpg$,\.lof$,\.log$,\.o$,\.obj$,\.pdf$,\.png$,\.swp$,\.tar$,\.toc$,\.mount$,\.pyc$,\.pyo$,\.lo$\,\.git/$,' "unsed suffixes on file list
"}

"Indentation options {
    set cindent
    set cinoptions={.5s,+.5s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s,(0= 
    set shiftwidth=4
    set tabstop=4
    set expandtab    " use spaces instead of tabs
    set ro nowrap   " Never go back to line
"}

"Theme options{
    colorscheme default
"}

"maping { 

    "Errors handling {
    map <C-n> :cn<CR>
    map <C-p> :cN<CR>
    "}

    "Fold handling"
    set foldmethod=syntax
    nmap <F2> 0v/{<CR>%zf

    "tabs handling {
        map <C-left> :tabp<CR>
        map<C-right> :tabn<CR>
        map <C-t> :tabnew <CR>
    "}

    "Switch between splited view {
        map <c-down> <c-w>j
        map <c-l> <c-w>l
        map <c-h> <c-w>h
        map <c-up> <c-w>k
    "}
"}
 
"languages specific {

    "Make specific {
        command -nargs=* Make make <args> | cwindow 3
        map <Leader>m :Make<CR> 
    "}

    "GLib gtk configs {
        autocmd BufRead *.c set keywordprg=keywordprg
        set tags+=/home/thibault/.vim/tags/gtk+.vim "Add gtk autocompletion
        set tags+=/home/thibault/.vim/tags/glib.vim "Add glib autocompletion
        set tags+=/home/thibault/.vim/tags/libgdata.vim "Add glib autocompletion
    "}

    "Javascript Html {
        autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

    "}

    "java {
        autocmd BufRead *.java set makeprg=ant
        autocmd BufRead *.java set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
    "}

    "vala {
        autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
        autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
        au BufRead,BufNewFile *.vala            setfiletype vala
        au BufRead,BufNewFile *.vapi            setfiletype vala
    "}

    "python {
        autocmd FileType python set omnifunc=pythoncomplete#Complete
        au BufRead,BufNewFile *.py            setfiletype python
        let python_highlight_all = 1 
    "}

    "Latex specific {
        set grepprg=grep\ -nH\ $*
        let g:tex_flavor='latex'
    " }

"}

"My plugins configs {
    "My taglist config {
        let Tlist_Close_On_Select = 1
        let Tlist_Show_One_File = 0
        let Tlist_WinWidth = 55
        let Tlist_GainFocus_On_ToggleOpen = 1
        map <C-a> :TlistToggle <CR>
    "}


    "Project {
        let g:proj_flags='imstbc'
    "}
     
    "tSkeleton {
        autocmd BufNewFile *.notes       TSkeletonSetup notes.notes "Notes skeleton
        autocmd BufNewFile *.py       TSkeletonSetup py.py "Notes skeleton
        let g:tskelUserName   = 'Thibault Saunier'
        let g:tskelUserEmail  = 'tsaunier@gnome.org'
        let g:tskelUserWWW    = 'http://www.thiblahute.blogspot.com'
        let g:tskelLicense    = 'GPL'
        let g:tskelDateFormat = '%Y'
    "}

    "MRU (most recently used) {
        let MRU_File = '/home/thibault/.local/share/vim/rmu_files'
        :map <C-o> :MRU <CR>
    "}

    "NERDTreeIgnore {
        let NERDTreeIgnore=['\.aux$', '\.bak$', '\.bbl$','\.blg$','\.gif$','\.gz$','\.idx$','\.ilg$','\.info$','\.jpg$','\.lof$','\.log$','\.o$','\.obj$','\.pdf$','\.png$','\.swp$','\.tar$','\.toc$','\.mount$','\.pyc$','\.pyo$','\.lo$','\.tgz$'] "unsed suffixes on file list
        map <C-e> :NERDTree <CR>
    " }

    "Dpaste {
        map <c-p> :Dpaste<CR>
    "}

    "Todo list toggle {
        map <C-g> :TDlist <CR>
    "}

    "Gnome style align arguments {
        nmap <Leader>a :GNOMEAlignArguments<CR>
    "}

    "Blogspot{
        nnoremap <Leader>blog :! bg.py --f %:p --u my@email.com  --p inline<cr> 
    "}
"}


"Pdf handlng{
    autocmd BufReadPost *.pdf silent %!pdftotext "%" -
    autocmd BufWritePost *.pdf silent !rm -rf ~/PDF/%
    autocmd BufWritePost *.pdf silent !lp -s -d pdffg "%"
    autocmd BufWritePost *.pdf silent !until [ -e ~/PDF/% ]; do sleep 1; done
    autocmd BufWritePost *.pdf silent !mv ~/PDF/% %:p:h
"}
