let () = print_endline "Advent o' Caml 2023"


(* Read input file to list of strings *)
let read_input_file_string name : string list =
  let ic = open_in name in
  let try_read () =
    try Some(input_line ic) with End_of_file -> None in
  let rec loop acc = match try_read () with
  | Some s -> loop(s :: acc)
  | None -> close_in ic; List.rev acc in
  loop []
;;



(* Read input file to list of strings *)
let read_input_file_int name : int list =
  let ic = open_in name in
  let try_read () =
    try Some(input_line ic) with End_of_file -> None in
  let rec loop acc = match try_read () with
  | Some s -> loop(s :: acc)
  | None -> close_in ic; List.rev acc in
List.map int_of_string (loop [])
;;

