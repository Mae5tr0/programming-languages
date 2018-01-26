fun is_older (d1 : int*int*int, d2 : int*int*int) =
    if (#1 d1) < (#1 d2)
    then true
    else if (#1 d1) = (#1 d2) andalso (#2 d1) < (#2 d2)
    then true
    else if ((#1 d1) = (#1 d2) andalso (#2 d1) = (#2 d2) andalso (#3 d1) < (#3 d2))
    then true
    else false

(* //simplified version
fun is_older (d1 : int*int*int, d2 : int*int*int) =
    ((#1 d1) < (#1 d2)) 
    orelse ((#1 d1) = (#1 d2) andalso (#2 d1) < (#2 d2))
    orelse ((#1 d1) = (#1 d2) andalso (#2 d1) = (#2 d2) andalso (#3 d1) < (#3 d2)) *)

fun number_in_month (dates : (int*int*int) list, month : int) =
    if null dates
    then 0
    else if (#2 (hd dates)) = month
    then 1 + number_in_month(tl dates, month)
    else 0 + number_in_month(tl dates, month)

fun number_in_months (dates : (int*int*int) list, months : int list) =
    if null months
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)

fun dates_in_month (dates : (int*int*int) list, month : int) = 
    if null dates
    then []
    else if (#2 (hd dates)) = month
    then (hd dates) :: dates_in_month(tl dates, month)
    else dates_in_month(tl dates, month)

fun dates_in_months (dates : (int*int*int) list, months : int list) =
    if null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, (tl months))

fun get_nth (input : string list, position : int) = 
    let
      fun get_by_position(tailed_input : string list, current : int) = 
        if current = position
        then hd tailed_input
        else get_by_position(tl tailed_input, current + 1) 
    in
      get_by_position(input, 1)
    end

fun date_to_string (date : int*int*int) = 
    let
        val months = ["January", "February", "March", "April",
            "May", "June", "July", "August", "September", 
            "October", "November", "December"]
    in
     get_nth(months, (#2 date)) ^ " " ^ Int.toString((#3 date)) ^ ", " ^ Int.toString((#1 date))
    end

fun number_before_reaching_sum (sum : int, integers : int list) = 
    let
      fun find_position(tl_input : int list, position : int, acc : int) = 
        let
            val current_sum = (hd tl_input) + acc
        in
            if current_sum >= sum
            then position - 1
            else find_position(tl tl_input, position + 1, current_sum) 
        end        
    in
      find_position(integers, 1, 0)
    end
    
fun what_month(day : int) = 
    let
        val days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
     number_before_reaching_sum(day, days) + 1
    end

fun month_range (day1 : int, day2 : int) =
    let
      fun countdown(start : int) = 
        if (start > day2)
        then []
        else what_month(start) :: countdown(start + 1)
    in
      countdown(day1)
    end    

fun oldest(dates : (int*int*int) list) =
    if null dates
    then NONE
    else
        let val tl_ans = oldest(tl dates)
        in if isSome tl_ans andalso is_older(valOf tl_ans, hd dates)
            then tl_ans
            else SOME (hd dates)
        end