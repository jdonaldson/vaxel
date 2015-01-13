package lua.vimvar;
import lua.vimvar.GetSet;
import lua.vimvar.VimBool;

class Options {
    public static var options = new Option();
    public static var locals  = new LocalOption();
    public static var globals = new GlobalOption();
}

class GlobalOption extends Option { 
    public function new(?prefix:String){
        super(prefix == null ? "&g:" : prefix); 
    }
}
class LocalOption  extends Option { 
    public function new(?prefix:String){
        super(prefix == null ? "&l:" : prefix); 
    }
}

class Option extends GetSet {
    public function new(?prefix:String) super(prefix == null ? "&" : prefix); 
    public var aleph           : Int;
    public var allowrevins     : VimBool; // ari     allow CTRL-_ in Insert and Command-line mode
    public var altkeymap       : VimBool; // akm     for default second language (Farsi/Hebrew)
    public var ambiwidth       : String; // ambw    what to do with Unicode chars of ambiguous width
    public var antialias       : VimBool; // anti    Mac OS X: use smooth, antialiased fonts
    public var autochdir       : VimBool; // acd     change directory to the file in the current window
    public var arabic          : VimBool; // arab    for Arabic as a default second language
    public var arabicshape     : VimBool; // arshape do shaping for Arabic characters
    public var autoindent      : VimBool; // ai	    take indent for new line from previous line
    public var autoread        : VimBool; // ar	    autom. read file when changed outside of Vim
    public var autowrite       : VimBool; // aw	    automatically write file if changed
    public var autowriteall    : VimBool; // awa     as autowrite, but works with more commands
    public var background      : String; // bg	    "dark" or "light", used for highlight colors
    public var backspace       : String; // bs	    how backspace works at start of line
    public var backup          : VimBool; // bk	    keep backup file after overwriting a file
    public var backupcopy      : VimBool; // bkc     make backup as a copy, dont rename the file
    public var backupdir       : String; // bdir    list of directories for the backup file
    public var backupext       : String; // bex     extension used for the backup file
    public var backupskip      : VimBool; // bsk     no backup for files that match these patterns
    public var balloondelay    : Int; // bdlay   delay in mS before a balloon may pop up
    public var ballooneval     : String; // beval   switch on balloon evaluation
    public var balloonexpr     : String; // bexpr   expression to show in balloon
    public var binary          : String; // bin     read/write/edit file in binary mode
    public var bioskey         : VimBool; // biosk   MS-DOS: use bios calls for input characters
    public var bomb            : VimBool; //           prepend a Byte Order Mark to the file
    public var breakat         : String; // brk     characters that may cause a line break
    public var browsedir       : String; // bsdir   which directory to start browsing in
    public var bufhidden       : String; // bh	    what to do when buffer is no longer in window
    public var buflisted       : VimBool; // bl	    whether the buffer shows up in the buffer list
    public var buftype         : String; // bt	    special type of buffer
    public var casemap         : String; // cmp     specifies how case of letters is changed
    public var cdpath          : String; // cd	    list of directories searched with ":cd"
    public var cedit           : String; //           key used to open the command-line window
    public var charconvert     : String; // ccv     expression for character encoding conversion
    public var cindent         : VimBool; // cin     do C program indenting
    public var cinkeys         : String; // cink    keys that trigger indent when cindent is set
    public var cinoptions      : String; // cino    how to do indenting when cindent is set
    public var cinwords        : String; // cinw    words where si and cin add an indent
    public var clipboard       : VimBool; // cb	    use the clipboard as the unnamed register
    public var cmdheight       : Int; // ch	    number of lines to use for the command-line
    public var cmdwinheight    : Int; // cwh     height of the command-line window
    public var colorcolumn     : Int; // cc	    columns to highlight
    public var columns         : Int; // co	    number of columns in the display
    public var comments        : String; // com     patterns that can start a comment line
    public var commentstring   : String; // cms     template for comments; used for fold marker
    public var compatible      : VimBool; // cp	    behave Vi-compatible as much as possible
    public var complete        : String; // cpt     specify how Insert mode completion works
    public var completefunc    : String; // cfu     function to be used for Insert mode completion
    public var completeopt     : String; // cot     options for Insert mode completion
    public var concealcursor   : String; // cocu    whether concealable text is hidden in cursor line
    public var conceallevel    : VimBool; // cole    whether concealable text is shown or hidden
    public var confirm         : VimBool; // cf	    ask what to do about unsaved/read-only files
    public var conskey         : VimBool; // consk   get keys directly from console (MS-DOS only)
    public var copyindent      : VimBool; // ci	    make autoindent use existing indent structure
    public var cpoptions       : String; // cpo     flags for Vi-compatible behavior
    public var cryptmethod     : String; // cm	    type of encryption to use for file writing
    public var cscopepathcomp  : Int; // cspc    how many components of the path to show
    public var cscopeprg       : String; // csprg   command to execute cscope
    public var cscopequickfix  : VimBool; // csqf    use quickfix window for cscope results
    public var cscopetag       : VimBool; // cst     use cscope for tag commands
    public var cscopetagorder  : String; // csto    determines ":cstag" search order
    public var cscopeverbose   : VimBool; // csverb  give messages when adding a cscope database
    public var cursorbind      : VimBool; // crb     move cursor in window as it moves in other windows
    public var cursorcolumn    : VimBool; // cuc	    highlight the screen column of the cursor
    public var cursorline      : VimBool; // cul	    highlight the screen line of the cursor
    // *** haven't typed anything beyond this 
    public var debug           : String; //           set to "msg" to see all error messages
    public var define          : String; // def     pattern to be used to find a macro definition
    public var delcombine      : String; // deco    delete combining characters on their own
    public var dictionary      : String; // dict    list of file names used for keyword completion
    public var diff            : String; //           use diff mode for the current window
    public var diffexpr        : String; // dex     expression used to obtain a diff file
    public var diffopt         : String; // dip     options for using diff mode
    public var digraph         : String; // dg	    enable the entering of digraphs in Insert mode
    public var directory       : String; // dir     list of directory names for the swap file
    public var display         : String; // dy	    list of flags for how to display text
    public var eadirection     : String; // ead     in which direction equalalways works
    public var edcompatible    : String; // ed	    toggle flags of ":substitute" command
    public var encoding        : String; // enc     encoding used internally
    public var endofline       : String; // eol     write <EOL> for last line in file
    public var equalalways     : String; // ea	    windows are automatically made the same size
    public var equalprg        : String; // ep	    external program to use for "=" command
    public var errorbells      : String; // eb	    ring the bell for error messages
    public var errorfile       : String; // ef	    name of the errorfile for the QuickFix mode
    public var errorformat     : String; // efm     description of the lines in the error file
    public var esckeys         : String; // ek	    recognize function keys in Insert mode
    public var eventignore     : String; // ei	    autocommand events that are ignored
    public var expandtab       : String; // et	    use spaces when <Tab> is inserted
    public var exrc            : String; // ex	    read .vimrc and .exrc in the current directory
    public var fileencoding    : String; // fenc    file encoding for multi-byte text
    public var fileencodings   : String; // fencs   automatically detected character encodings
    public var fileformat      : String; // ff	    file format used for file I/O
    public var fileformats     : String; // ffs     automatically detected values for fileformat
    public var filetype        : String; // ft	    type of file, used for autocommands
    public var fillchars       : String; // fcs     characters to use for displaying special items
    public var fkmap           : String; // fk	    Farsi keyboard mapping
    public var foldclose       : String; // fcl     close a fold when the cursor leaves it
    public var foldcolumn      : String; // fdc     width of the column used to indicate folds
    public var foldenable      : String; // fen     set to display all folds open
    public var foldexpr        : String; // fde     expression used when foldmethod is "expr"
    public var foldignore      : String; // fdi     ignore lines when foldmethod is "indent"
    public var foldlevel       : String; // fdl     close folds with a level higher than this
    public var foldlevelstart  : String; // fdls    foldlevel when starting to edit a file
    public var foldmarker      : String; // fmr     markers used when foldmethod is "marker"
    public var foldmethod      : String; // fdm     folding type
    public var foldminlines    : String; // fml     minimum number of lines for a fold to be closed
    public var foldnestmax     : String; // fdn     maximum fold depth
    public var foldopen        : String; // fdo     for which commands a fold will be opened
    public var foldtext        : String; // fdt     expression used to display for a closed fold
    public var formatlistpat   : String; // flp     pattern used to recognize a list header
    public var formatoptions   : String; // fo	    how automatic formatting is to be done
    public var formatprg       : String; // fp	    name of external program used with "gq" command
    public var formatexpr      : String; // fex     expression used with "gq" command
    public var fsync           : String; // fs	    whether to invoke fsync() after file write
    public var gdefault        : String; // gd	    the ":substitute" flag g is default on
    public var grepformat      : String; // gfm     format of grepprg output
    public var grepprg         : String; // gp	    program to use for ":grep"
    public var guicursor       : String; // gcr     GUI: settings for cursor shape and blinking
    public var guifont         : String; // gfn     GUI: Name(s) of font(s) to be used
    public var guifontset      : String; // gfs     GUI: Names of multi-byte fonts to be used
    public var guifontwide     : String; // gfw     list of font names for double-wide characters
    public var guiheadroom     : String; // ghr     GUI: pixels room for window decorations
    public var guioptions      : String; // go	    GUI: Which components and options are used
    public var guipty          : String; //           GUI: try to use a pseudo-tty for ":!" commands
    public var guitablabel     : String; // gtl     GUI: custom label for a tab page
    public var guitabtooltip   : String; // gtt     GUI: custom tooltip for a tab page
    public var helpfile        : String; // hf	    full path name of the main help file
    public var helpheight      : String; // hh	    minimum height of a new help window
    public var helplang        : String; // hlg     preferred help languages
    public var hidden          : String; // hid     dont unload buffer when it is YXXYabandon|ed
    public var highlight       : String; // hl	    sets highlighting mode for various occasions
    public var hlsearch        : String; // hls     highlight matches with last search pattern
    public var history         : String; // hi	    number of command-lines that are remembered
    public var hkmap           : String; // hk	    Hebrew keyboard mapping
    public var hkmapp          : String; // hkp     phonetic Hebrew keyboard mapping
    public var icon            : String; //           let Vim set the text of the window icon
    public var iconstring      : String; //           string to use for the Vim icon text
    public var ignorecase      : String; // ic	    ignore case in search patterns
    public var imactivatekey   : String; // imak    key that activates the X input method
    public var imcmdline       : String; // imc     use IM when starting to edit a command line
    public var imdisable       : String; // imd     do not use the IM in any mode
    public var iminsert        : String; // imi     use :lmap or IM in Insert mode
    public var imsearch        : String; // ims     use :lmap or IM when typing a search pattern
    public var include         : String; // inc     pattern to be used to find an include file
    public var includeexpr     : String; // inex    expression used to process an include line
    public var incsearch       : String; // is	    highlight match while typing search pattern
    public var indentexpr      : String; // inde    expression used to obtain the indent of a line
    public var indentkeys      : String; // indk    keys that trigger indenting with indentexpr
    public var infercase       : String; // inf     adjust case of match for keyword completion
    public var insertmode      : String; // im	    start the edit of a file in Insert mode
    public var isfname         : String; // isf     characters included in file names and pathnames
    public var isident         : String; // isi     characters included in identifiers
    public var iskeyword       : String; // isk     characters included in keywords
    public var isprint         : String; // isp     printable characters
    public var joinspaces      : String; // js	    two spaces after a period with a join command
    public var key             : String; //           encryption key
    public var keymap          : String; // kmp     name of a keyboard mapping
    public var keymodel        : String; // km	    enable starting/stopping selection with keys
    public var keywordprg      : String; // kp	    program to use for the "K" command
    public var langmap         : String; // lmap    alphabetic characters for other language mode
    public var langmenu        : String; // lm	    language to be used for the menus
    public var laststatus      : String; // ls	    tells when last window has status lines
    public var lazyredraw      : String; // lz	    dont redraw while executing macros
    public var linebreak       : String; // lbr     wrap long lines at a blank
    public var lines           : String; //           number of lines in the display
    public var linespace       : String; // lsp     number of pixel lines to use between characters
    public var lisp            : String; //           automatic indenting for Lisp
    public var lispwords       : String; // lw	    words that change how lisp indenting works
    public var list            : String; //           show <Tab> and <EOL>
    public var listchars       : String; // lcs     characters for displaying in list mode
    public var loadplugins     : String; // lpl     load plugin scripts when starting up
    public var macatsui        : String; //           Mac GUI: use ATSUI text drawing
    public var magic           : String; //           changes special characters in search patterns
    public var makeef          : String; // mef     name of the errorfile for ":make"
    public var makeprg         : String; // mp	    program to use for the ":make" command
    public var matchpairs      : String; // mps     pairs of characters that "%" can match
    public var matchtime       : String; // mat     tenths of a second to show matching paren
    public var maxcombine      : String; // mco     maximum nr of combining characters displayed
    public var maxfuncdepth    : String; // mfd     maximum recursive depth for user functions
    public var maxmapdepth     : String; // mmd     maximum recursive depth for mapping
    public var maxmem          : String; // mm	    maximum memory (in Kbyte) used for one buffer
    public var maxmempattern   : String; // mmp     maximum memory (in Kbyte) used for pattern search
    public var maxmemtot       : String; // mmt     maximum memory (in Kbyte) used for all buffers
    public var menuitems       : String; // mis     maximum number of items in a menu
    public var mkspellmem      : String; // msm     memory used before |:mkspell| compresses the tree
    public var modeline        : String; // ml	    recognize modelines at start or end of file
    public var modelines       : String; // mls     number of lines checked for modelines
    public var modifiable      : String; // ma	    changes to the text are not possible
    public var modified        : String; // mod     buffer has been modified
    public var more            : String; //           pause listings when the whole screen is filled
    public var mouse           : String; //           enable the use of mouse clicks
    public var mousefocus      : String; // mousef  keyboard focus follows the mouse
    public var mousehide       : String; // mh	    hide mouse pointer while typing
    public var mousemodel      : String; // mousem  changes meaning of mouse buttons
    public var mouseshape      : String; // mouses  shape of the mouse pointer in different modes
    public var mousetime       : String; // mouset  max time between mouse double-click
    public var mzquantum       : String; // mzq     the interval between polls for MzScheme threads
    public var nrformats       : String; // nf	    number formats recognized for CTRL-A command
    public var number          : String; // nu	    print the line number in front of each line
    public var numberwidth     : String; // nuw     number of columns used for the line number
    public var omnifunc        : String; // ofu     function for filetype-specific completion
    public var opendevice      : String; // odev    allow reading/writing devices on MS-Windows
    public var operatorfunc    : String; // opfunc  function to be called for |g@| operator
    public var osfiletype      : String; // oft     operating system-specific filetype information
    public var paragraphs      : String; // para    nroff macros that separate paragraphs
    public var paste           : String; //           allow pasting text
    public var pastetoggle     : String; // pt	    key code that causes paste to toggle
    public var patchexpr       : String; // pex     expression used to patch a file
    public var patchmode       : String; // pm	    keep the oldest version of a file
    public var path            : String; // pa	    list of directories searched with "gf" et.al.
    public var preserveindent  : String; // pi	    preserve the indent structure when reindenting
    public var previewheight   : String; // pvh     height of the preview window
    public var previewwindow   : String; // pvw     identifies the preview window
    public var printdevice     : String; // pdev    name of the printer to be used for :hardcopy
    public var printencoding   : String; // penc    encoding to be used for printing
    public var printexpr       : String; // pexpr   expression used to print PostScript for :hardcopy
    public var printfont       : String; // pfn     name of the font to be used for :hardcopy
    public var printheader     : String; // pheader format of the header used for :hardcopy
    public var printmbcharset  : String; // pmbcs   CJK character set to be used for :hardcopy
    public var printmbfont     : String; // pmbfn   font names to be used for CJK output of :hardcopy
    public var printoptions    : String; // popt    controls the format of :hardcopy output
    public var pumheight       : String; // ph	    maximum height of the popup menu
    public var quoteescape     : String; // qe	    escape characters used in a string
    public var readonly        : String; // ro	    disallow writing the buffer
    public var redrawtime      : String; // rdt     timeout for hlsearch and |:match| highlighting
    public var relativenumber  : String; // rnu	    show relative line number in front of each line
    public var remap           : String; //           allow mappings to work recursively
    public var report          : String; //           threshold for reporting nr. of lines changed
    public var restorescreen   : String; // rs	    Win32: restore screen when exiting
    public var revins          : String; // ri	    inserting characters will work backwards
    public var rightleft       : String; // rl	    window is right-to-left oriented
    public var rightleftcmd    : String; // rlc     commands for which editing works right-to-left
    public var ruler           : String; // ru	    show cursor line and column in the status line
    public var rulerformat     : String; // ruf     custom format for the ruler
    public var runtimepath     : String; // rtp     list of directories used for runtime files
    public var scroll          : String; // scr     lines to scroll with CTRL-U and CTRL-D
    public var scrollbind      : String; // scb     scroll in window as other windows scroll
    public var scrolljump      : String; // sj	    minimum number of lines to scroll
    public var scrolloff       : String; // so	    minimum nr. of lines above and below cursor
    public var scrollopt       : String; // sbo     how scrollbind should behave
    public var sections        : String; // sect    nroff macros that separate sections
    public var secure          : String; //           secure mode for reading .vimrc in current dir
    public var selection       : String; // sel     what type of selection to use
    public var selectmode      : String; // slm     when to use Select mode instead of Visual mode
    public var sessionoptions  : String; // ssop    options for |:mksession|
    public var shell           : String; // sh	    name of shell to use for external commands
    public var shellcmdflag    : String; // shcf    flag to shell to execute one command
    public var shellpipe       : String; // sp	    string to put output of ":make" in error file
    public var shellquote      : String; // shq     quote character(s) for around shell command
    public var shellredir      : String; // srr     string to put output of filter in a temp file
    public var shellslash      : String; // ssl     use forward slash for shell file names
    public var shelltemp       : String; // stmp    whether to use a temp file for shell commands
    public var shelltype       : String; // st	    Amiga: influences how to use a shell
    public var shellxquote     : String; // sxq     like shellquote, but include redirection
    public var shiftround      : String; // sr	    round indent to multiple of shiftwidth
    public var shiftwidth      : String; // sw	    number of spaces to use for (auto)indent step
    public var shortmess       : String; // shm     list of flags, reduce length of messages
    public var shortname       : String; // sn	    non-MS-DOS: Filenames assumed to be 8.3 chars
    public var showbreak       : String; // sbr     string to use at the start of wrapped lines
    public var showcmd         : String; // sc	    show (partial) command in status line
    public var showfulltag     : String; // sft     show full tag pattern when completing tag
    public var showmatch       : String; // sm	    briefly jump to matching bracket if insert one
    public var showmode        : String; // smd     message on status line to show current mode
    public var showtabline     : String; // stal    tells when the tab pages line is displayed
    public var sidescroll      : String; // ss	    minimum number of columns to scroll horizontal
    public var sidescrolloff   : String; // siso    min. nr. of columns to left and right of cursor
    public var smartcase       : String; // scs     no ignore case when pattern has uppercase
    public var smartindent     : String; // si	    smart autoindenting for C programs
    public var smarttab        : String; // sta     use shiftwidth when inserting <Tab>
    public var softtabstop     : String; // sts     number of spaces that <Tab> uses while editing
    public var spell           : String; //           enable spell checking
    public var spellcapcheck   : String; // spc     pattern to locate end of a sentence
    public var spellfile       : String; // spf     files where |zg| and |zw| store words
    public var spelllang       : String; // spl     language(s) to do spell checking for
    public var spellsuggest    : String; // sps     method(s) used to suggest spelling corrections
    public var splitbelow      : String; // sb	    new window from split is below the current one
    public var splitright      : String; // spr     new window is put right of the current one
    public var startofline     : String; // sol     commands move cursor to first non-blank in line
    public var statusline      : String; // stl     custom format for the status line
    public var suffixes        : String; // su	    suffixes that are ignored with multiple match
    public var suffixesadd     : String; // sua     suffixes added when searching for a file
    public var swapfile        : String; // swf     whether to use a swapfile for a buffer
    public var swapsync        : String; // sws     how to sync the swap file
    public var switchbuf       : String; // swb     sets behavior when switching to another buffer
    public var synmaxcol       : String; // smc     maximum column to find syntax items
    public var syntax          : String; // syn     syntax to be loaded for current buffer
    public var tabstop         : String; // ts	    number of spaces that <Tab> in file uses
    public var tabline         : String; // tal     custom format for the console tab pages line
    public var tabpagemax      : String; // tpm     maximum number of tab pages for |-p| and "tab all"
    public var tagbsearch      : String; // tbs     use binary searching in tags files
    public var taglength       : String; // tl	    number of significant characters for a tag
    public var tagrelative     : String; // tr	    file names in tag file are relative
    public var tags            : String; // tag     list of file names used by the tag command
    public var tagstack        : String; // tgst    push tags onto the tag stack
    public var term            : String; //           name of the terminal
    public var termbidi        : String; // tbidi   terminal takes care of bi-directionality
    public var termencoding    : String; // tenc    character encoding used by the terminal
    public var terse           : String; //           shorten some messages
    public var textauto        : String; // ta	    obsolete, use fileformats
    public var textmode        : String; // tx	    obsolete, use fileformat
    public var textwidth       : String; // tw	    maximum width of text that is being inserted
    public var thesaurus       : String; // tsr     list of thesaurus files for keyword completion
    public var tildeop         : String; // top     tilde command "~" behaves like an operator
    public var timeout         : String; // to	    time out on mappings and key codes
    public var timeoutlen      : String; // tm	    time out time in milliseconds
    public var title           : String; //           let Vim set the title of the window
    public var titlelen        : String; //           percentage of columns used for window title
    public var titleold        : String; //           old title, restored when exiting
    public var titlestring     : String; //           string to use for the Vim window title
    public var toolbar         : String; // tb	    GUI: which items to show in the toolbar
    public var toolbariconsize : String;// tbis    size of the toolbar icons (for GTK 2 only)
    public var ttimeout        : String; //           time out on mappings
    public var ttimeoutlen     : String; // ttm     time out time for key codes in milliseconds
    public var ttybuiltin      : String; // tbi     use built-in termcap before external termcap
    public var ttyfast         : String; // tf	    indicates a fast terminal connection
    public var ttymouse        : String; // ttym    type of mouse codes generated
    public var ttyscroll       : String; // tsl     maximum number of lines for a scroll
    public var ttytype         : String; // tty     alias for term
    public var undodir         : String; // udir    where to store undo files
    public var undofile        : String; // udf	    save undo information in a file
    public var undolevels      : String; // ul	    maximum number of changes that can be undone
    public var undoreload      : String; // ur	    max nr of lines to save for undo on a buffer reload
    public var updatecount     : String; // uc	    after this many characters flush swap file
    public var updatetime      : String; // ut	    after this many milliseconds flush swap file
    public var verbose         : String; // vbs     give informative messages
    public var verbosefile     : String; // vfile   file to write messages in
    public var viewdir         : String; // vdir    directory where to store files with :mkview
    public var viewoptions     : String; // vop     specifies what to save for :mkview
    public var viminfo         : String; // vi	    use .viminfo file upon startup and exiting
    public var virtualedit     : String; // ve	    when to use virtual editing
    public var visualbell      : String; // vb	    use visual bell instead of beeping
    public var warn            : String; //           warn for shell command when buffer was changed
    public var weirdinvert     : String; // wiv	    for terminals that have weird inversion method
    public var whichwrap       : String; // ww	    allow specified keys to cross line boundaries
    public var wildchar        : String; // wc	    command-line character for wildcard expansion
    public var wildcharm       : String; // wcm     like wildchar but also works when mapped
    public var wildignore      : String; // wig     files matching these patterns are not completed
    public var wildignorecase  : String; // wic     ignore case when completing file names
    public var wildmenu        : String; // wmnu    use menu for command line completion
    public var wildmode        : String; // wim     mode for wildchar command-line expansion
    public var wildoptions     : String; // wop     specifies how command line completion is done
    public var winaltkeys      : String; // wak     when the windows system handles ALT keys
    public var window          : String; // wi	    nr of lines to scroll for CTRL-F and CTRL-B
    public var winheight       : String; // wh	    minimum number of lines for the current window
    public var winfixheight    : String; // wfh     keep window height when opening/closing windows
    public var winfixwidth     : String; // wfw     keep window width when opening/closing windows
    public var winminheight    : String; // wmh     minimum number of lines for any window
    public var winminwidth     : String; // wmw     minimal number of columns for any window
    public var winwidth        : String; // wiw     minimal number of columns for current window
    public var wrap            : String; //           long lines wrap and continue on the next line
    public var wrapmargin      : String; // wm	    chars from the right where wrapping starts
    public var wrapscan        : String; // ws	    searches wrap around the end of the file
    public var write           : String; //           writing to a file is allowed
    public var writeany        : String; // wa	    write to file with no need for "!" override
    public var writebackup     : String; // wb	    make a backup before overwriting a file
    public var writedelay      : String; // wd	    delay this many msec for each char (for debug)
}

