fun is_older (d1 : int*int*int, d2 : int*int*int) =
    ((#1 d1) < (#1 d2)) 
    orelse ((#1 d1) = (#1 d2) andalso (#2 d1) < (#2 d2))
    orelse ((#1 d1) = (#1 d2) andalso (#2 d1) = (#2 d2) andalso (#3 d1) < (#3 d2))

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
    if position = 1
    then hd input
    else get_nth(tl input, position - 1)

fun date_to_string (date : int*int*int) = 
    let
        val months = ["January", "February", "March", "April",
            "May", "June", "July", "August", "September", 
            "October", "November", "December"]
    in
     get_nth(months, (#2 date)) ^ " " ^ Int.toString((#3 date)) ^ ", " ^ Int.toString((#1 date))
    end

fun number_before_reaching_sum (sum : int, integers : int list) = 
    if sum <= hd integers
    then 0
    else 1 + number_before_reaching_sum(sum - hd integers, tl integers)
    
fun what_month(day : int) = 
    let
        val days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
     number_before_reaching_sum(day, days) + 1
    end

fun month_range (day1 : int, day2 : int) =
    if day1 > day2
    then []
    else what_month day1 :: month_range(day1 + 1, day2)

fun oldest(dates : (int*int*int) list) =
    if null dates
    then NONE
    else
        let val tl_ans = oldest(tl dates)
        in if isSome tl_ans andalso is_older(valOf tl_ans, hd dates)
            then tl_ans
            else SOME (hd dates)
        end

(* ================Challendges================= *)

fun remove_duplicates (lst : int list) =
    if null lst
    then []
    else 
        let
            fun find_equal(lst : int list, value : int) =
                if null lst
                then false
                else if hd lst = value
                then true
                else find_equal(tl lst, value)                
        in
            if find_equal(tl lst, hd lst) 
            then remove_duplicates(tl lst)
            else hd lst :: remove_duplicates(tl lst)
        end

fun number_in_months_challenge (dates : (int*int*int) list, months : int list) =         
    number_in_months (dates, remove_duplicates(months))

fun dates_in_months_challenge (dates : (int*int*int) list, months : int list) =
    dates_in_months (dates, remove_duplicates(months))

fun reasonable_date (date : int*int*int) =
    let
        val year = #1 date
        val month = #2 date
        val day = #3 date        
        val leap  = year mod 400 = 0 orelse (year mod 4 = 0 andalso year mod 100 <> 0)
        val feb_length = if leap then 29 else 28
        val month_days = [31, feb_length, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        fun get_days_for_month (tl_md : int list, position : int) = 
            if position = 1
            then hd tl_md
            else get_days_for_month (tl tl_md, position - 1)    
    in
        year > 0 
        andalso month >=1 andalso month <= 12 
        andalso day >= 1 andalso day <= get_days_for_month(month_days, month)
    end
