if !has('conceal')
    finish
endif

syntax match cppOperator "!=" conceal cchar=≠
syntax match cppOperator "<=" conceal cchar=≤
syntax match cppOperator ">=" conceal cchar=≥

syntax match cppOperator "->" conceal cchar=→

hi link cNiceOperator Operator
hi! link Conceal Operator

set conceallevel=2

