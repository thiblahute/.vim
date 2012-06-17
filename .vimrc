"General configs {
    let mapleader = ","
    let maplocalleader = ','
    set nobackup
    set backspace=indent,eol,start
    set showcmd " display incomplete commands
    set number
    syn on          " syntax highlighting
    set ruler       "We have the vertical position
    set mouse=r
    set hlsearch
    set encoding=utf-8 fileencodings=.
    filetype plugin on "read filtype dir
    set hidden "Let you have unsaved buffers
    " Disable this fuckink ex mode
    :map Q <Nop>

"}


" Menu to switch between options {
    set wildmode=longest,full
    set wildmenu
    set wildignore=*.swp,!,7,Makefile,<,Session.vim, " Seront ignores par le wildmenu les fichiers correspondants aux criteres du wildignore
    set suffixes=.aux,.bak,.bbl,.blg,.gif,.gz,.idx,.ilg,.info,.jpg,.lof,.log,;lot,.o,.obj,.pdf,.png,.swp,.tar,.toc,~,mount,in,pyc,pyo "unsed suffixes
    let g:netrw_list_hide='\.aux$,\.bak$,\.bbl$,\.blg$,\.gif$,\.gz$,\.idx$,\.ilg$,\.info$,\.jpg$,\.lof$,\.log$,\.o$,\.obj$,\.pdf$,\.png$,\.swp$,\.tar$,\.toc$,\.mount$,\.pyc$,\.pyo$,\.lo$\,\.git/$,' "unsed suffixes on file list
"}

"Indentation options {
    set cindent
    "set cinoptions={.5s,+.5s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s,(0=
    set shiftwidth=2
    set tabstop=2
    set expandtab    " use spaces instead of tabs
    set ro nowrap   " Never go back to line
"}

"Theme options{
    colorscheme default
    hi SpellBad term=reverse ctermbg=Green
"}

"maping {

    "Save
    map <Leader>w :w <CR>

    "Errors handling {
    map <C-n> :cn<CR>
    map <C-p> :cN<CR>
    "}

    "Fold handling"
    "set foldmethod=syntax
    nmap <F2> 0v/{<CR>%zF
    nmap <F2> 0v/{<CR>%zD

    "tabs handling {
        "map <C-t> :tabnew <CR>
        "nmap <C-tab> :tabn<CR>
    "}

    "split handling {
        map <C-t> :vsplit<CR>
        map <C-s> :split<CR>
      "}

    "Switch and resize splited view {
        map <C-left> <c-w>h
        map<C-right> <c-w>l
        map <c-down> <c-w>j
        map <c-up> <c-w>k
        nnoremap <S-down> :vertical resize -5<cr>
        nnoremap <S-up> :vertical resize +5<cr>
    "}

    "Stop searching with F8 {
        map <F8> :noh<CR>
    "}
    "


    "Buffers {
        map <S-b> :b 
        map <S-z> :b#<CR>
    "}
    " Switch from .h to .C{
      map <C-h> :A<CR>
    "}

    " Languages handling {
      map <C-F7> :setlocal spell spelllang=en<CR>
      map <C-F8> :setlocal spell spelllang=fr<CR>
      map <C-F9> :setlocal spell spelllang=en,fr<CR>
      map <C-F10> :setlocal spell spelllang=<CR>
    "}


"}
"{ Trailling whutespaces
    set list
    set lcs:tab:>-,trail:X
"}
"languages specific {

    "Make specific {
        "command -nargs=* Make make <args> | cwindow 3
        map <Leader>m :make<CR>
        map <Leader>l :make ERROR_CFLAGS=""<CR>
        map <Leader>i :make install<CR>
        autocmd QuickFixCmdPost [^l]* nested cwindow
        autocmd QuickFixCmdPost    l* nested lwindow
    "}

    "GLib gtk configs { SHOULD be necessary
        "autocmd BufRead *.c set keywordprg=keywordprg
        "set tags+=/home/thiblahute/.vim/tags/gtk+.vim "Add gtk autocompletion
        "set tags+=/home/thiblahute/.vim/tags/glib.vim "Add glib autocompletion
        "set tags+=/home/thiblahute/.vim/tags/libgdata.vim "Add glib autocompletion

        set tags+=~/.vim/tags/gst
        set tags+=~/.vim/tags/glib
        set tags+=~/.vim/tags/gl
        " build tags of your own project with CTRL+F12
       "map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
       noremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
       inoremap <F12> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

       " OmniCppComplete
       let OmniCpp_NamespaceSearch = 1
       let OmniCpp_GlobalScopeSearch = 1
       let OmniCpp_ShowAccess = 1
       let OmniCpp_MayCompleteDot = 1
       let OmniCpp_MayCompleteArrow = 1
       let OmniCpp_MayCompleteScope = 1

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

    " C  {
        autocmd FileType c map <C-F6> :silent %!gst-indent<CR>
    "}

    "python {
        au BufRead,BufNewFile *.py            setfiletype python
        let python_highlight_all = 1
        map <silent> <F4> "<Esc>:w!<cr>:!python %<cr>"
        autocmd FileType python compiler pylint
        let g:pylint_onwrite = 0
        autocmd FileType python set omnifunc=pythoncomplete#Complete
        autocmd FileType python set shiftwidth=4
        autocmd FileType python set tabstop=4
        let g:pydiction_location = '/home/thiblahute/.vim/ftplugin/pydiction/complete-dict'
        "autocmd FileType python autocmd BufWritePre <buffer> let s:saveview = winsaveview() | exe '%!PythonTidy.py' | call winrestview(s:saveview) | unlet s:saveview
        "let g:pep8_map=u'F8'
        let g:pyflakes_use_quickfix = 1
    "}
    "wiki {
      au BufNewFile,BufRead *.wiki setf Wikipedia
    "}

    " xml {
      au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
    "}

    "Latex specific {
        set grepprg=grep\ -nH\ $*
        let g:tex_flavor='latex'
        let g:tex_fold_disable=1
        "imap <buffer> <m-c> <Plug>Tex_InsertItemOnThisLine
        "imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine
        autocmd FileType latex setlocal spell spelllang=fr
        autocmd FileType latex set wrap
        imap <C-space> <Plug>IMAP_JumpForward
    " }

    "Binary {
      "nnoremap <C-b> :Hexmode<CR>
      "inoremap <C-b> <Esc>:Hexmode<CR>
      "vnoremap <C-b> :<C-U>Hexmode<CR>
    " }

"}

"My plugins configs {
    "My taglist config {
        let Tlist_Close_On_Select = 1
        let Tlist_Show_One_File = 1
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
        let g:tskelUserEmail  = 'thibaul.saunier@collabora.com'
        let g:tskelUserWWW    = 'http://www.thiblahute.blogspot.com'
        let g:tskelLicense    = 'GPL'
        let g:tskelDateFormat = '%Y'
    "}

    "MRU (most recently used) {
        let MRU_File = '/home/thiblahute/.local/share/vim/rmu_files'
        :map <C-o> :MRU <CR>
    "}

    "NERDTreeIgnore {
        let NERDTreeIgnore=['\.aux$', '\.bak$', '\.bbl$','\.blg$','\.gif$','\.gz$','\.idx$','\.ilg$','\.info$','\.jpg$','\.lof$','\.log$','\.o$','\.obj$','\.pdf$','\.png$','\.swp$','\.tar$','\.toc$','\.mount$','\.pyc$','\.pyo$','\.lo$','\.tgz$'] "unsed suffixes on file list
        map <C-e> :NERDTree <CR>
    " }

    "Project{
        map <C-p> :Project <CR>
    " }
    "Devhelp {
       let g:devhelpSearch=1
       let g:devhelpSearchKey = '<F3>'
    "}

    "Dpaste {
        "map <c-p> :Dpaste<CR>
    "}

    "Bike {
        "map <C-z> :BikeRename<CR>
    "}

    "FindFile {
         nmap <C-f> :FindFile<CR>
    "}

    "Todo list toggle {
        map <C-g> :TDlist <CR>
    "}

    "Blogspot{
        nnoremap <Leader>blog :! bg.py --f %:p --u my@email.com  --p inline<cr>
    "}
    " clang completion {
         " SuperTab option for context aware completion
         let g:SuperTabDefaultCompletionType = "context"

         " Disable auto popup, use <Tab> to autocomplete
         let g:clang_complete_auto = 0
         " Show clang errors in the quickfix window
         let g:clang_complete_copen = 1
    "}
"}


"My functions {
    fun CleanText()
         let curcol = col(".")
         let curline = line(".")
         exe ":retab"
    " $//ge"xe ":%s/
    " / /ge"xe ":%s/
         exe ":%s/ \\+$//e"
         call cursor(curline, curcol)
    endfun
    map <F6> :call CleanText()<CR>


    " ex command for toggling hex mode - define mapping if desired
    command -bar Hexmode call ToggleHex()

    "" helper function to toggle hex mode
    function ToggleHex()
      " hex mode should be considered a read-only operation
      " save values for modified and read-only for restoration later,
      " and clear the read-only flag for now
      let l:modified=&mod
      let l:oldreadonly=&readonly
      let &readonly=0
      let l:oldmodifiable=&modifiable
      let &modifiable=1
      if !exists("b:editHex") || !b:editHex
        " save old options
        let b:oldft=&ft
        let b:oldbin=&bin
        " set new options
        setlocal binary " make sure it overrides any textwidth, etc.
        let &ft="xxd"
        " set status
        let b:editHex=1
        " switch to hex editor
        %!xxd
      else
        " restore old options
        let &ft=b:oldft
        if !b:oldbin
          setlocal nobinary
        endif
        " set status
        let b:editHex=0
        " return to normal editing
        %!xxd -r
      endif
      " restore values for modified and read only state
      let &mod=l:modified
      let &readonly=l:oldreadonly
      let &modifiable=l:oldmodifiable
    endfunction


"}
"Pdf handlng{
    autocmd BufReadPost *.pdf silent %!pdftotext "%" -
    autocmd BufWritePost *.pdf silent !rm -rf ~/PDF/%
    autocmd BufWritePost *.pdf silent !lp -s -d pdffg "%"
    autocmd BufWritePost *.pdf silent !until [ -e ~/PDF/% ]; do sleep 1; done
    autocmd BufWritePost *.pdf silent !mv ~/PDF/% %:p:h
"}


"dictionnary {
    set spellfile=~/.vim/dict.add
    "Underline errors
    highlight clear SpellBad
    highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
"}
"
"Vimdiff {
    highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white
    highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
    highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
    highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black
"}
"
" INtergrayion with bugzilla {

  " Get the issue number under the cursor. An issue number is containing

  " digits, lating letters and #. The # characters are removed from the result.
  "
  " Code heavily inspired from the words_tools.vim of Luc Hermitte
  " http://hermitte.free.fr/vim/ressources/dollar_VIM/plugin/words_tools_vim.html
  function! GetCurrentIssueText()
    let c = col ('.')-1
    let l = line('.')
    let ll = getline(l)
    let ll1 = strpart(ll,0,c)
    let ll1 = matchstr(ll1,'[0-9#a-zA-Z]*$')
    if strlen(ll1) == 0
      return ll1
    else
      let ll2 = strpart(ll,c,strlen(ll)-c+1)
      let ll2 = strpart(ll2,0,match(ll2,'$\|[^0-9#a-zA-Z]'))
      let text = ll1.ll2

      let text = substitute( text, "#", "", "g" )
      return text
    endif
  endfunction

  " Open IssueZilla / Bugzilla for the selected issue
  function! OpenIssue( )

      let s:browser = "firefox"

      let s:issueText = GetCurrentIssueText( )
      let s:urlTemplate = ""
      let s:pattern = "\\(\\a\\+\\)\\(\\d\\+\\)"

      let s:prefix = substitute( s:issueText, s:pattern, "\\1", "" )
      let s:id = substitute( s:issueText, s:pattern, "\\2", "" )

      let s:urlTemplate = "https://bugzilla.gnome.org/show_bug.cgi?id=%"

      if s:urlTemplate != ""
          let s:url = substitute( s:urlTemplate, "%", s:id, "g" )
          let s:cmd = "silent !" . s:browser . " " . s:url . "&"
          execute s:cmd
      endif
  endfunction

  map <silent> <C-i> :call OpenIssue()<CR><C-l>
"}

"{ Intergration with screen
if match($TERM, "screen")!=-1
  set term=xterm
endif
