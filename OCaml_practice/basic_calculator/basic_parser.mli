type token =
  | Lint of (int)
  | Lident of (string)
  | Lstring of (string)
  | Lcmd of (string)
  | Lplus
  | Lminus
  | Lmult
  | Ldiv
  | Lmod
  | Lrel of (string)
  | Land
  | Lor
  | Lneg
  | Lpar
  | Rpar
  | Lrem of (string)
  | Llet
  | Lprint
  | Linput
  | Lif
  | Lthen
  | Lgoto
  | Lequal
  | Leol

val line :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Basic_types.phrase
