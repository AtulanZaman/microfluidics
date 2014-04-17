#use "basic_types.mli";;
type value = Vint of int | Vstr of string | Vbool of bool;;
type environment = (string * value) list;;
type code = line array;;
type state_exec = { line:int ; xprog:code ; xenv:environment };;

exception RunError of int
let runerr n = raise (RunError n);;

exception Result_lookup_index of int;;

let lookup_index tprog num_line =
try
 for i=0 to (Array.length tprog)-1 do
let num_i = tprog.(i).num
in if num_i=num_line then raise (Result_lookup_index i)
else if num_i>num_line then raise (Result_lookup_index (-1))
done ;
(-1 )
with Result_lookup_index i ->i;;

let assemble prog =
let tprog = Array.of_list prog in
for i=0 to (Array.length tprog)-1 do
match tprog.(i).cmd with
Goto n->let index = lookup_index tprog n
in tprog.(i) <- { tprog.(i) with cmd = Goto index }
| If(c,n)->let index = lookup_index tprog n
in tprog.(i) <- { tprog.(i) with cmd = If (c,index) }
| _ ->()
done ;
tprog;;

let rec eval_exp n envt expr = match expr with
ExpInt p-> Vint p
| ExpVar v->( try List.assoc v envt with Not_found ->runerr n )
| ExpUnr (UMINUS,e)-> ( match eval_exp n envt e with Vint p ->Vint (-p)
| _-> runerr n )
| ExpUnr (NOT,e)->
( match eval_exp n envt e with
Vbool p-> Vbool (not p)
| _ ->runerr n )
| ExpStr s ->Vstr s
| ExpBin (e1,op,e2)->match eval_exp n envt e1 , op , eval_exp n envt e2 with
Vint v1 , PLUS, Vint v2-> Vint (v1 + v2)
| Vint v1 , MINUS , Vint v2-> Vint (v1 - v2)
| Vint v1 , MULT, Vint v2 ->Vint (v1 * v2)
| Vint v1 , DIV , Vint v2 when v2<>0 ->Vint (v1 / v2)
| Vint v1 , MOD , Vint v2 when v2<>0-> Vint (v1 mod v2)
|Vint v1,EQUAL, Vint v2 -> Vbool (v1=v2)
|Vint v1, DIFF, Vint v2 -> Vbool (v1<>v2)
|Vint v1, LESS, Vint v2 -> Vbool (v1<v2)
|Vint v1, GREAT, Vint v2 -> Vbool (v1>v2)
|Vint v1, LESSEQ, Vint v2 -> Vbool (v1<=v2)
|Vint v1, GREATEQ, Vint v2 -> Vbool (v1>=v2)
|Vbool v1 , AND , Vbool v2-> Vbool (v1 && v2)
| Vbool v1 , OR , Vbool v2-> Vbool (v1 || v2)
| Vstr v1 , PLUS , Vstr v2-> Vstr (v1 ^ v2)
| _ , _ , _ ->runerr n;;


let rec add v e env = match env with
[] -> [v,e]
| (w,f) :: l -> if w=v then (v,e) :: l else (w,f) :: (add v e l);;


let print_value v = match v with
Vint n->print_int n
| Vbool true ->print_string "true"
| Vbool false-> print_string "false"
| Vstr s->print_string s;;

let next_line state =
let n = state.line+1 in
if n < Array.length state.xprog then n else -1;;

let eval_cmd state =match state.xprog.(state.line).cmd with
Rem _-> { state with line = next_line state }
|Print e ->print_value (eval_exp state.line state.xenv e);
           print_newline (); 
           { state with line = next_line state }
|Let(v,e)-> let ev = eval_exp state.line state.xenv e
            in { state with line = next_line state; xenv = add v ev state.xenv }
|Goto n ->{ state with line = n }
|Input v -> let x = try read_int () with Failure "int_of_string" ->0
in { state with line = next_line state;
xenv = add v (Vint x) state.xenv }
| If (t,n) ->match eval_exp state.line state.xenv t with
Vbool true ->{ state with line = n }
|Vbool false-> { state with line = next_line state }
| _ ->runerr state.line;;

let rec run state =
if state.line = -1 then state else run (eval_cmd state);;

let rec insert line p = match p with
[] -> [line]
| l :: prog -> if l.num < line.num then l :: (insert line prog)
               else if l.num=line.num then line :: prog
               else line :: l :: prog;;

let print_prog prog =
let print_line x = print_string (pp_line x) ; print_newline () in
print_newline () ;
List.iter print_line prog ;
print_newline ();;

type loop_state = { prog:program; env:environment };;
exception End;;
let one_command state =
print_string ">";flush stdout;
try
      match line lexer (Lexing.from_string ((input_line stdin)^"\n")) with
      Line l -> { state with prog = insert l state.prog }
      | List-> (print_prog state.prog ; state )
      | Run->let tprog = assemble state.prog in
       let xstate = run { line = 0; xprog = tprog; xenv = state.env }in
       {state with env = xstate.xenv }
| PEnd-> raise End
with
LexerError -> print_string "Illegal character\n"; state
| ParseError -> print_string "syntax error\n"; state
| RunError n ->print_string "runtime error at line ";
               print_int n ;
               print_string "\n";
               state;;

let go () =
try
print_string "Mini-BASIC version 0.1\n\n";
let rec loop state = loop (one_command state) in
loop { prog = [] ; env = [] }
with End-> print_string "See you later...\n";;






go();;









                                                                   


