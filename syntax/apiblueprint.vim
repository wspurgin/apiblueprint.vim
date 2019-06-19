runtime! syntax/markdown.vim
unlet! b:current_syntax

" Metadata
syntax region apibMarkdownMetadata start=/\%^.*:.*$/ end=/^$/ contains=apibMarkdownMetadataKey,apibMarkdownMetadataValue fold
syntax match apibMarkdownMetadataKey /^[^:]*\ze:/ contained
syntax match apibMarkdownMetadataValue /:.*/ contained

syntax region apibHTTPStatusCode start=/\d\d\d/ end=// contained
syntax region apibHTTPContentType start=/(.*)/ end=// contained

syntax match apibMSONIdentifier /\w\+\ze:/ contained
syntax match apibMSONType /\s\+(\w\+\(,\s\+\w\+\)\?)/ contained
syntax match apibParamDesc /\s\+-.*/ contained

syntax match apibBracketedMeta /\[.*\]/ contained
syntax region apibHeadingSection start=/^[#]{1,6}.*/  end=/^$/ contains=apibBracketedMeta

syntax cluster markdownInline add=apibHeadersSectionValue,apibBracketedMeta

syntax region apibModelSection start=/^+ Model/ end=/$/ oneline
syntax region apibRequestSection start=/^[-+*] [Rr]equest.*/ end=/^$/ contains=markdownCode,apibBracketedMeta,apibHTTPContentType
syntax region apibResponseSection start=/^[-+*] [Rr]esponse \d\d\d/ end=/^$/ contains=markdownCode,apibHTTPStatusCode,apibHTTPContentType
syntax region apibResponseSection start=/^[-+*] Parameters.*/ end=/^$/ contains=markdownCode,apibMSONIdentifier,apibMSONType,apibParamDesc
syntax region apibResponseSection start=/^[-+*] Schema / end=/^$/ contains=markdownCode
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
highlight default link apibMSONIdentifier Identifier
highlight default link apibMSONType Type
highlight default link apibParamDesc Comment

let b:current_syntax = 'apiblueprint'

