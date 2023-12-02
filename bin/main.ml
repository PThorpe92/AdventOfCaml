open Base
open Helper


let input = read_input_file_string "input_day1" in 
Core.printf "%d \n" (first_last_digit_maybe_word input 0)
