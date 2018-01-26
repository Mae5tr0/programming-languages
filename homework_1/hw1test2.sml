use "hw1.sml";

(* val d1 = (1,2,3)
val d2 = (1,2,4)
val d3 = (1,2,3)

val test_1_1 = is_older(d1, d2) = true
val test_1_2 = is_older(d2, d1) = false
val test_1_3 = is_older(d1, d3) = false *)

(* ============== *)

(* val d1 = (1,2,3)
val d2 = (1,3,4)
val d3 = (1,2,3)
val d4 = (1,2,21)

val test_2_1 = number_in_month([d1, d2, d3, d4], 2) = 3
val test_2_2 = number_in_month([d1, d2, d3, d4], 4) = 0
val test_2_3 = number_in_month([], 1) = 0 *)

(* ============== *)

(* val d1 = (1,2,3)
val d2 = (1,3,4)
val d3 = (1,2,3)
val d4 = (1,2,21)
val d5 = (1,6,21)

val test_3_1 = number_in_months([d1, d2, d3, d4, d5], [2, 6]) = 4
val test_3_2 = number_in_months([d1, d2, d3, d4], [9]) = 0
val test_3_3 = number_in_months([], [1]) = 0 *)
(* val test_3_4 = number_in_months([d1, d2], []) = 0   !!!!!! *)

(* ============== *)

(* val d1 = (1,2,3)
val d2 = (1,3,4)
val d3 = (1,2,5)
val d4 = (1,2,21)
val d5 = (1,6,21)

val test_4_1 = dates_in_month([d1, d2, d3], 2) = [d1, d3]
val test_4_2 = dates_in_month([d1, d2, d3, d4], 9) = []
val test_4_3 = dates_in_month([], 3) = [] *)


(* ============== *)

(* val d1 = (1,2,3)
val d2 = (1,3,4)
val d3 = (1,2,5)
val d4 = (1,6,21)

val test_5_1 = dates_in_months([d1, d2, d3, d4], [2, 6]) = [d1, d3, d4]
val test_5_2 = dates_in_months([d1, d2, d3, d4], [9]) = []
val test_5_3 = dates_in_months([], [3]) = []
val test_5_4 = dates_in_months([], []) = [] *)

(* ============== *)
(* 
val input = ["longstring", "abc", "super"]

val test_6_1 = get_nth(input, 3) = "super" *)

(* ============== *)
(* 
val d1 = (1980, 7, 12)

val test_7_1 = date_to_string(d1) = "July 12, 1980" *)

(* ============== *)

(* val integers = [1, 2, 3, 4, 5]
val test_8_1 = number_before_reaching_sum(5, integers) = 2
val test_8_2 = number_before_reaching_sum(1, integers) = 0 *)

(* ============== *)

(* val test_9_1 = what_month(25) = 1
val test_9_2 = what_month(50) = 2
val test_9_3 = what_month(365) = 12
val test_9_4 = what_month(330) = 11 *)

(* ============== *)

(* val test_10_1 = month_range(58, 60) = [2, 2, 3]
val test_10_2 = month_range(20, 15) = [] *)

val d1 = (2,3,4)
val d2 = (2,2,5)
val d3 = (1,6,21)

val test_11_1 = oldest([d1, d2, d3]) = SOME d3
val test_11_2 = oldest([]) = NONE