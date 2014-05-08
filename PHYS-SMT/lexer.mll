{
open Lexing
open Parser

exception SyntaxError of string
}

let int = ['0'-'9']['0'-'9']*

let white = [' ' '\t']+

rule read = 
	parse
	| white {read lexbuf}
	| int	{INT (int_of_string (Lexing.lexeme lexbuf))}
	| '{'	{LEFT_BRACE}
	| '}'	{RIGHT_BRACE}
	| ':'	{COLON}
	| ','	{COMMA}
	| '?'	{QM}
	| ';'	{SEMICOLON}
	| _ { raise (SyntaxError ("Unexpected Char: " ^ Lexing.lexeme lexbuf))}
	| eof	{EOF}

