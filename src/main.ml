open Lang

let parse (s : string) : expr =
  let lexbuf = Lexing.from_string s in
  let ast = Parser.prog Lexer.read lexbuf in
  ast


let run_file filename =
  try
    let file = open_in_bin filename in
    let source = really_input_string file (in_channel_length file) in
    close_in file;
    let ast = parse source in
    match type_of_expr (empty_context, ast) with
    | None -> print_endline "Type error"
    | Some _ ->
        let value = multistep ast in
        if is_val value then
          print_endline (string_of_expr value)
        else
          print_endline "Evaluation error"
  with
  | Parser.Error -> print_endline "Syntax error"
  | Failure _ -> print_endline "Lexer error"
  | Sys_error msg -> print_endline ("File error: " ^ msg)