type lexeme = Lint of int
| Lident of string
| Lsymbol of string
| Lstring of string
| Lend;;

let keywords =
["CHOREOGRAPHY";"ENVSETLIST";"TIME";"RESERVOIR";"WIDTH";"LENGTH";
"USELIST";"INSTANTLIST";"SEPARATOR";"DOLIST";"ENDLIST";",";":";";"];;


