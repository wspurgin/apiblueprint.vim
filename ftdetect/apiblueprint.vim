" DESC: Check variable and set default value if it not exists
fun! apiblueprint#default(name, default) "{{{
    if !exists(a:name)
        let {a:name} = a:default
        return 0
    endif
    return 1
endfunction "}}}

call apiblueprint#default('g:detect_markdown_as_api_blueprint', 'disable')

autocmd BufReadPost,BufNewFile *.apib set filetype=apiblueprint
autocmd FileType apiblueprint set syntax=apiblueprint
autocmd FileType apiblueprint set makeprg=drafter\ -l\ %

fun! s:DetectAPIBlueprint()
  if getline(1) =~ '^FORMAT: 1A$'
    set filetype=apiblueprint
  endif
endfun

if g:detect_markdown_as_api_blueprint != 'disable'

  autocmd BufNewFile,BufRead *.md call s:DetectAPIBlueprint()
  autocmd BufNewFile,BufRead *.markdown call s:DetectAPIBlueprint()

endif
