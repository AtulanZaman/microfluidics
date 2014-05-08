{
 let string_chars s =
  String.sub s 1 ((String.length s)-2) ;;
}

let op_ar = ['-' '+' '*' '%' '/']
let op_bool = ['!' '&' '|'] 
let rel = ['=' '<' '>']

rule lexer = parse
   [' ']   { lexer lexbuf }

 | op_ar   { Lsymbol (Lexing.lexeme lexbuf) }
 | op_bool { Lsymbol (Lexing.lexeme lexbuf) }

 | "<="    { Lsymbol (Lexing.lexeme lexbuf) }
 | ">="    { Lsymbol (Lexing.lexeme lexbuf) }
 | "<>"    { Lsymbol (Lexing.lexeme lexbuf) }
 | rel     { Lsymbol (Lexing.lexeme lexbuf) }

 | "REM"   { Lsymbol (Lexing.lexeme lexbuf) }
 | "LET"   { Lsymbol (Lexing.lexeme lexbuf) }
 | "PRINT" { Lsymbol (Lexing.lexeme lexbuf) }
 | "INPUT" { Lsymbol (Lexing.lexeme lexbuf) }
 | "IF"    { Lsymbol (Lexing.lexeme lexbuf) }
 | "THEN"  { Lsymbol (Lexing.lexeme lexbuf) }
 
 | '-'? ['0'-'9']+   { Lint (int_of_string (Lexing.lexeme lexbuf)) }
 | ['A'-'z']+        { Lident (Lexing.lexeme lexbuf) }
 | '"' [^ '"']* '"'  { Lstring (string_chars (Lexing.lexeme lexbuf)) }
