
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



(* Read input file to list of ints *)
let read_input_file_int name : int list =
  let ic = open_in name in
  let try_read () =
    try Some(input_line ic) with End_of_file -> None in
  let rec loop acc = match try_read () with
  | Some s -> loop(s :: acc)
  | None -> close_in ic; List.rev acc in
List.map int_of_string (loop [])
;;


(*  Read input file to (k v) of (int * string) *)
let read_input_file_enum name: (int * string) list =
  let ic = open_in name in
  let try_read () =
    try Some(input_line ic) with End_of_file -> None in
  let rec loop acc = match try_read () with
  | Some s -> 
    let l = String.split_on_char ',' s in
    let k = int_of_string (List.nth l 0) in
    let v = List.nth l 1 in
    loop((k,v) :: acc)
  | None -> close_in ic; List.rev acc in
  loop []
;;

