open Core
open Re
open Helper

let contains_digit_over str num =
  let regex = Re.compile (Re.char(' ')) in
  match split regex str with
  | digit :: _ when Int.of_string digit > num -> true
  | _ -> false
;;

let rec parse_lines lines acc line =
  match lines with
  | [] -> acc
  | hd :: tl ->
    let rec match_color_pattern pattern threshold num =
      let matches = Re.all ~pos:0 ~len:(String.length hd) pattern hd in
      let color = List.filter ~f:(fun x -> contains_digit_over (Group.get x num) threshold) matches in
      if List.length color > 0 then parse_lines tl (acc + 1) (line + 1)
      else match_color_pattern pattern threshold num+1
    in

    match_color_pattern (Re.Perl.compile_pat "\\d+ red") 12 acc
    |> match_color_pattern (Re.Perl.compile_pat "\\d+ green") 13
    |> match_color_pattern (Re.Perl.compile_pat "\\d+ blue") 14
    |> fun new_acc -> parse_lines tl new_acc (line + 1)
;;




let lines = read_input_file_string "input_day2" in
let answer = parse_lines lines 0 1 in
Core.printf "%d\n" answer
