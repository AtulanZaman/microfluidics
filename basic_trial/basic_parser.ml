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

open Parsing;;
let _ = parse_error;;
# 3 "basic_parser.mly"
open Basic_types ;;

let phrase_of_cmd c =
 match c with
   "RUN" -> Run
 | "LIST" -> List
 | "END" -> PEnd
 | _ -> failwith "line : unexpected command"
;;

let bin_op_of_rel r =
 match r with
   "=" -> EQUAL
 | "<" -> INF
 | "<=" -> INFEQ
 | ">" -> SUP
 | ">=" -> SUPEQ
 | "<>" -> DIFF
 | _ -> failwith "line : unexpected relation symbol"
;;

# 52 "basic_parser.ml"
let yytransl_const = [|
  261 (* Lplus *);
  262 (* Lminus *);
  263 (* Lmult *);
  264 (* Ldiv *);
  265 (* Lmod *);
  267 (* Land *);
  268 (* Lor *);
  269 (* Lneg *);
  270 (* Lpar *);
  271 (* Rpar *);
  273 (* Llet *);
  274 (* Lprint *);
  275 (* Linput *);
  276 (* Lif *);
  277 (* Lthen *);
  278 (* Lgoto *);
  279 (* Lequal *);
  280 (* Leol *);
    0|]

let yytransl_block = [|
  257 (* Lint *);
  258 (* Lident *);
  259 (* Lstring *);
  260 (* Lcmd *);
  266 (* Lrel *);
  272 (* Lrem *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\002\000\002\000\002\000\002\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\000\000"

let yylen = "\002\000\
\003\000\002\000\001\000\002\000\002\000\002\000\004\000\004\000\
\001\000\001\000\001\000\002\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\023\000\003\000\000\000\000\000\
\000\000\000\000\000\000\000\000\002\000\000\000\009\000\010\000\
\011\000\000\000\000\000\000\000\006\000\000\000\004\000\001\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\022\000\000\000\
\000\000\015\000\016\000\000\000\000\000\000\000\000\000\000\000\
\007\000"

let yydgoto = "\002\000\
\005\000\012\000\020\000"

let yysindex = "\011\000\
\035\255\000\000\149\255\248\254\000\000\000\000\015\255\000\255\
\028\255\000\255\039\255\017\255\000\000\019\255\000\000\000\000\
\000\000\000\255\000\255\100\255\000\000\062\255\000\000\000\000\
\000\255\100\255\081\255\000\255\000\255\000\255\000\255\000\255\
\000\255\000\255\000\255\000\255\043\255\100\255\000\000\003\255\
\003\255\000\000\000\000\255\254\053\255\071\255\071\255\053\255\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\025\255\000\000\000\000\000\000\000\000\
\000\000\014\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\026\255\000\000\022\255\
\042\255\000\000\000\000\104\255\119\255\133\255\140\255\126\255\
\000\000"

let yygindex = "\000\000\
\000\000\000\000\246\255"

let yytablesize = 171
let yytable = "\022\000\
\015\000\016\000\017\000\028\000\029\000\030\000\031\000\026\000\
\027\000\030\000\031\000\001\000\018\000\019\000\038\000\013\000\
\014\000\040\000\041\000\042\000\043\000\044\000\045\000\046\000\
\047\000\048\000\013\000\013\000\012\000\021\000\013\000\013\000\
\013\000\013\000\012\000\003\000\013\000\012\000\004\000\023\000\
\024\000\025\000\013\000\049\000\013\000\013\000\014\000\014\000\
\005\000\008\000\014\000\014\000\014\000\014\000\000\000\000\000\
\014\000\028\000\029\000\030\000\031\000\032\000\014\000\000\000\
\014\000\014\000\028\000\029\000\030\000\031\000\032\000\033\000\
\034\000\035\000\000\000\028\000\029\000\030\000\031\000\032\000\
\033\000\000\000\037\000\000\000\036\000\028\000\029\000\030\000\
\031\000\032\000\033\000\034\000\035\000\036\000\000\000\039\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\036\000\
\028\000\029\000\030\000\031\000\032\000\033\000\034\000\035\000\
\017\000\017\000\017\000\017\000\000\000\000\000\017\000\000\000\
\000\000\000\000\036\000\000\000\017\000\000\000\017\000\017\000\
\019\000\019\000\019\000\000\000\000\000\019\000\000\000\018\000\
\018\000\018\000\000\000\019\000\018\000\019\000\019\000\020\000\
\020\000\000\000\018\000\020\000\018\000\018\000\021\000\021\000\
\000\000\020\000\021\000\000\000\020\000\000\000\000\000\000\000\
\021\000\000\000\000\000\021\000\006\000\007\000\008\000\009\000\
\010\000\000\000\011\000"

let yycheck = "\010\000\
\001\001\002\001\003\001\005\001\006\001\007\001\008\001\018\000\
\019\000\007\001\008\001\001\000\013\001\014\001\025\000\024\001\
\002\001\028\000\029\000\030\000\031\000\032\000\033\000\034\000\
\035\000\036\000\005\001\006\001\015\001\002\001\009\001\010\001\
\011\001\012\001\021\001\001\001\015\001\024\001\004\001\001\001\
\024\001\023\001\021\001\001\001\023\001\024\001\005\001\006\001\
\024\001\024\001\009\001\010\001\011\001\012\001\255\255\255\255\
\015\001\005\001\006\001\007\001\008\001\009\001\021\001\255\255\
\023\001\024\001\005\001\006\001\007\001\008\001\009\001\010\001\
\011\001\012\001\255\255\005\001\006\001\007\001\008\001\009\001\
\010\001\255\255\021\001\255\255\023\001\005\001\006\001\007\001\
\008\001\009\001\010\001\011\001\012\001\023\001\255\255\015\001\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\023\001\
\005\001\006\001\007\001\008\001\009\001\010\001\011\001\012\001\
\009\001\010\001\011\001\012\001\255\255\255\255\015\001\255\255\
\255\255\255\255\023\001\255\255\021\001\255\255\023\001\024\001\
\010\001\011\001\012\001\255\255\255\255\015\001\255\255\010\001\
\011\001\012\001\255\255\021\001\015\001\023\001\024\001\011\001\
\012\001\255\255\021\001\015\001\023\001\024\001\011\001\012\001\
\255\255\021\001\015\001\255\255\024\001\255\255\255\255\255\255\
\021\001\255\255\255\255\024\001\016\001\017\001\018\001\019\001\
\020\001\255\255\022\001"

let yynames_const = "\
  Lplus\000\
  Lminus\000\
  Lmult\000\
  Ldiv\000\
  Lmod\000\
  Land\000\
  Lor\000\
  Lneg\000\
  Lpar\000\
  Rpar\000\
  Llet\000\
  Lprint\000\
  Linput\000\
  Lif\000\
  Lthen\000\
  Lgoto\000\
  Lequal\000\
  Leol\000\
  "

let yynames_block = "\
  Lint\000\
  Lident\000\
  Lstring\000\
  Lcmd\000\
  Lrel\000\
  Lrem\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : int) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'inst) in
    Obj.repr(
# 53 "basic_parser.mly"
                                ( Line {num=_1; inst=_2} )
# 213 "basic_parser.ml"
               : Basic_types.phrase))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 54 "basic_parser.mly"
                                ( phrase_of_cmd _1 )
# 220 "basic_parser.ml"
               : Basic_types.phrase))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 58 "basic_parser.mly"
                                ( Rem _1 )
# 227 "basic_parser.ml"
               : 'inst))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 59 "basic_parser.mly"
                                ( Goto _2 )
# 234 "basic_parser.ml"
               : 'inst))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 60 "basic_parser.mly"
                                ( Print _2 )
# 241 "basic_parser.ml"
               : 'inst))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 61 "basic_parser.mly"
                                ( Input _2 )
# 248 "basic_parser.ml"
               : 'inst))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 62 "basic_parser.mly"
                                ( If (_2, _4) )
# 256 "basic_parser.ml"
               : 'inst))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 63 "basic_parser.mly"
                                 ( Let (_2, _4) )
# 264 "basic_parser.ml"
               : 'inst))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 67 "basic_parser.mly"
                                ( ExpInt _1 )
# 271 "basic_parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 68 "basic_parser.mly"
                                ( ExpVar _1 )
# 278 "basic_parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 69 "basic_parser.mly"
                                ( ExpStr _1 )
# 285 "basic_parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 70 "basic_parser.mly"
                                ( ExpUnr (NOT, _2) )
# 292 "basic_parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 71 "basic_parser.mly"
                                ( ExpBin (_1, PLUS, _3) )
# 300 "basic_parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 72 "basic_parser.mly"
                                ( ExpBin (_1, MINUS, _3) )
# 308 "basic_parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 73 "basic_parser.mly"
                                ( ExpBin (_1, MULT, _3) )
# 316 "basic_parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 74 "basic_parser.mly"
                                ( ExpBin (_1, DIV, _3) )
# 324 "basic_parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 75 "basic_parser.mly"
                                ( ExpBin (_1, MOD, _3) )
# 332 "basic_parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 76 "basic_parser.mly"
                                 ( ExpBin (_1, EQUAL, _3) )
# 340 "basic_parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 77 "basic_parser.mly"
                                ( ExpBin (_1, (bin_op_of_rel _2), _3) )
# 349 "basic_parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 78 "basic_parser.mly"
                                ( ExpBin (_1, AND, _3) )
# 357 "basic_parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 79 "basic_parser.mly"
                                ( ExpBin (_1, OR, _3) )
# 365 "basic_parser.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 80 "basic_parser.mly"
                                ( _2 )
# 372 "basic_parser.ml"
               : 'exp))
(* Entry line *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let line (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Basic_types.phrase)
;;
# 83 "basic_parser.mly"


# 400 "basic_parser.ml"
