open Base;;
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
      let both =  (Int.of_string ((Char.to_string first) ^ (Char.to_string last))) in
      Core.printf "first: %c second: %c sum: %d total_so_far: %d \n" first last both (acc + both);
      first_last_digit tl (acc + both);;

let input = read_input_file_string "input_day1" in 
Core.printf "%d \n" (first_last_digit input 0);;

(**************   PART TWO    *******************)
;;

let replace_digits hd =
  let words = [("one", "1"); ("two", "2"); ("three", "3"); ("four", "4"); ("five", "5"); ("six", "6"); ("seven", "7"); ("eight", "8");("nine", "9");] in
    List.fold words ~init:hd ~f:(fun acc (word, digit) ->
    String.substr_replace_first acc ~pattern:word ~with_:digit
  )
;;

let replace_digits_rev hd =
  let words = [("one", "1"); ("two", "2"); ("three", "3"); ("four", "4"); ("five", "5"); ("six", "6"); ("seven", "7"); ("eight", "8");("nine", "9");] in
  List.fold_left words ~init:hd ~f:(fun acc (word, digit) ->
    String.substr_replace_first acc ~pattern:(String.rev word) ~with_:digit
  )
;;

let rec first_last_digit_words lines acc = 
  match lines with 
  | [] -> acc
  | hd :: tl ->
      let front = replace_digits hd in 
      let sure = replace_digits_rev (String.rev front) in 
      let first = String.filter front ~f:is_digit |> String.to_list |> List.hd_exn in
      let last  = String.filter sure ~f:is_digit |> String.to_list |> List.hd_exn in
      let both  = (Int.of_string ((Char.to_string first) ^ (Char.to_string last))) in
      first_last_digit_words tl (acc + both)
;;
