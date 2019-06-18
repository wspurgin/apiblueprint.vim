runtime! syntax/markdown.vim
unlet! b:current_syntax

" Metadata
syntax region apibMarkdownMetadata start=/\%^.*:.*$/ end=/^$/ contains=apibMarkdownMetadataKey,apibMarkdownMetadataValue fold
syntax match apibMarkdownMetadataKey /^[^:]*\ze:/ contained
syntax match apibMarkdownMetadataValue /:.*/ contained

syntax region apibHTTPStatusCode start=/\d\d\d/ end=// contained containedin=apibResponseSection
syntax region apibHTTPContentType start=/(.*)/ end=// contained containedin=apibResponseSection

syntax region apibHeadingSection start=/^[#]{1,6}.*/  end=/^$/ contains=apibBracketedMeta
syntax match apibBracketedMeta /\[.*\]/ contained

syntax cluster markdownInline add=apibHeadersSectionValue,apibBracketedMeta

syntax region apibModelSection start=/^+ Model/ end=/$/ oneline
syntax region apibRequestSection start=/^[-+*] Request.*/ end=/^$/ contains=apibBracketedMeta,apibHTTPContentType
syntax region apibResponseSection start=/^[-+*] Response \d\d\d/ end=/^$/ contains=apibHTTPStatusCode,apibHTTPContentType
syntax region apibHeadersSection start=/^+ Headers$/ end=/^\S.*$/ contains=apibHeadersSectionKey,apibHeadersSectionValue

syntax region apibActionRelationKey start=/: .*/ end=/$/ contained
syntax region apibActionRelation start=/^[-+*] Relation: .*$/ end=/$/ oneline contains=apibActionRelationKey

syntax match apibHeadersSectionKey /^[^:]*\ze:/ contained
syntax match apibHeadersSectionValue /:.*/ contained

highlight default link apibMarkdownMetadataKey Function
highlight default link apibRequestSection Function
highlight default link apibResponseSection Function
highlight default link apibModelSection Function
highlight default link apibHeadersSectionKey Function
highlight default link apibHTTPStatusCode Special
highlight default link apibHTTPContentType Delimiter
highlight default link apibActionRelation Function
highlight default link apibActionRelationKey Identifier
highlight default link apibBracketedMeta Type

let b:current_syntax = 'apiblueprint'

