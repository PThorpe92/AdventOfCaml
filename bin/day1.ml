open Base;;
open Core;;
open! Helper;;

let is_digit (ch: char) = 
  match ch with
  | '0' .. '9' -> true
  | _ -> false

let rec first_last_digit lines acc =
  match lines with
  | [] -> acc
  | hd :: tl ->
      let first = String.filter hd ~f:is_digit |> String.to_list |> List.hd_exn in
      let last =  String.filter hd ~f:is_digit |> String.to_list_rev |> List.hd_exn in
      let both =  (int_of_string ((Char.to_string first) ^ (Char.to_string last))) in
      Core.printf "first: %c second: %c sum: %d total_so_far: %d \n" first last both (acc + both);
      first_last_digit tl (acc + both);;

let input = read_input_file_string "input_day1" in 
Core.printf "%d \n" (first_last_digit input 0);;

(**************   PART TWO    *******************)


