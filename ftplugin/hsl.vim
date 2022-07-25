if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

let s:undo_ftplugin = ""

if exists("b:undo_ftplugin")
    let s:undo_ftplugin = b:undo_ftplugin
endif

setlocal nosmartindent
setlocal noautoindent
setlocal nolisp
setlocal cindent
setlocal commentstring=/*%s*/
setlocal omnifunc=syntaxcomplete#Complete

let b:undo_ftplugin = "setlocal nosmartindent< noautoindent< nolisp< cindent< commentstring< completefunc< omnifunc< | " .
	    \	      s:undo_ftplugin

let &cpo = s:cpo_save
unlet s:cpo_save
