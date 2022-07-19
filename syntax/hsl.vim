if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" Functions
syn keyword hslFunction array_every array_filter array_find array_includes array_join array_keys array_map array_range array_reduce array_reverse array_sort array_shuffle array_unique
syn keyword hslFunction aes_decrypt aes_encrypt hmac_md5 hmac_sha1 hmac_sha2 md5 sha1 sha2 hash rsa_sign rsa_verify ed25519_sign ed25519_verify pkcs7_sign random_bytes random_number crypt
syn keyword hslFunction length array boolean number string is_array is_boolean is_function is_number is_object is_string isset unset 
syn keyword hslFunction executiontime sleep strftime strptime time timelocal uptime
syn keyword hslFunction dns_query domain_includes idna_encode idna_decode
syn keyword hslFunction base32_encode base32_decode base64_encode base64_decode zlib_compress zlib_uncompress csv_encode csv_decode json_encode json_decode url_encode url_decode yaml_decode pack unpack
syn keyword hslFunction http
syn keyword hslFunction envelope_address_parse envelope_localpart_escape header_addresslist_extract header_dkim_decode xtext_encode xtext_decode spf_query
syn keyword hslFunction abs ceil floor log pow round sqrt
syn keyword hslFunction gethostname uuid syslog stat inet_includes inet_ntop inet_pton inet_reverse mail
syn keyword hslFunction smtp_lookup_rcpt smtp_lookup_auth ldap_search ldap_bind
syn keyword hslFunction chr ord str_repeat str_replace str_find str_rfind str_lower str_upper str_slice str_split str_strip str_rstrip str_lstrip
syn keyword hslFunction pcre_match pcre_match_all pcre_quote pcre_compile pcre_replace
syn keyword hslFunction queue_policy queue_policy_delete queue_suspend queue_quota

" Classes
syn keyword hslClass Map Set
syn keyword hslClass Iconv
syn keyword hslClass File
syn keyword hslClass Mime MailMessage
syn keyword hslClass Exception
syn keyword hslClass LDAP
syn keyword hslClass Socket TLSSocket X509

" Conditional
syn keyword hslConditional else if switch

" Repeat
syn keyword hslRepeat as for foreach while forever

" Label
syn keyword hslLabel case default switch

" Statement
syn keyword hslStatement return break continue yield cache barrier

" Type
syn keyword hslType none

" Structure
syn keyword hslStructure class static private readonly builtin global

" Operator
syn match hslOperator "[-=+%^&|*!.~?:]" display
syn keyword hslOperator and or
syn match hslRelation "[!=<>]=" display
syn match hslRelation "[<>]" display
syn match hslVarSelector "\$" contained display

" Special functions
syn keyword hslSpecialFunction constructor isset unset array

" Identifier
syn match hslIdentifier "$\h\w*" contains=hslVarSelector display
syn match hslIdentifier "${\h\w*}" contains=hslVarSelector contained display

" Include
syn keyword hslInclude include include_once closure

" Import
syn keyword hslImport import with from

" Boolean
syn keyword hslBoolean true false

" Float
syn match hslFloat "\%(\w\|\.\)\@<!\%(\d_\?\|\.\)*\d\%(\d\|_\|\.\)*\%([eE][+-]\=\%(\d\|_\|\.\)\+\)\=\%(\w\|\.\)\@!" display

" Number
syn match hslNumber "\%(\.\)\@<!\<\%([1-9]\d*\|0\|0[xX]\(\x_\?\)*\x\)\>\%(\.\)\@!" display
syn match hslNumber "\%(\.\)\@<!\<0\d\+\|0[oO]\d\+\>\%(\.\)\@!" display " Octal
syn match hslNumber "\%(\.\)\@<!\<0[bB]\(\d_\?\)*\d\>\%(\.\)\@!" display " Binary

" Backslash escapes
syn match hslBackslashDoubleQuote "\\[\"]" contained display

" Comment
syn match hslComment "\/\/.*$"
syn region hslComment start="/\*" end="\*/" contains=@Spell extend

" Delimiter
syn match hslDelimiter "[({[\]})]"

" String
syn region hslStringDouble start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=hslIdentifier,hslBackslashDoubleQuote extend keepend
syn region hslStringRaw start="''" end="''" extend keepend
syn region hslStringRaw start="'[\x21-\x26\x28-\x7e]*'" end="'[\x21-\x26\x28-\x7e]*'" extend keepend

" Regex
syn region hslRegex start="#\/" skip="\\\\\|\\/" end="\/[imusxUX]*" extend keepend

" Exception
syn keyword hslException try catch throw

" Define
syn keyword hslDefine echo
syn keyword hslDefine function

hi def link hslFunction Function
hi def link hslClass Function
hi def link hslConditional Conditional
hi def link hslRepeat Repeat
hi def link hslLabel Label
hi def link hslStatement Statement
hi def link hslType Type
hi def link hslStructure Structure
hi def link hslOperator Operator
hi def link hslRelation Operator
hi def link hslVarSelector Operator
hi def link hslSpecialFunction Operator
hi def link hslIdentifier Identifier
hi def link hslInclude Include
hi def link hslImport Statement
hi def link hslBoolean Boolean
hi def link hslFloat Float
hi def link hslNumber Number
hi def link hslBackslashDoubleQuote SpecialChar
hi def link hslComment Comment
hi def link hslDelimiter Delimiter
hi def link hslStringDouble String
hi def link hslStringRaw String
hi def link hslRegex String
hi def link hslException Exception
hi def link hslDefine Define

let b:current_syntax = "hsl"

let &cpo = s:cpo_save
unlet s:cpo_save
