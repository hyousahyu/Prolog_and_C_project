:- table expr/2, expr_val/3.
%a)
%<assign> -> <id> = <expr>

%<id>         -> a | b | c

%<expr>    -> <expr> + <expr> | <expr> * <expr> | ( <expr> ) | <digit>

%<digit>    -> 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9

assign(S0,S) :- id(S0,S1),eql(S1,S2),expr(S2,S).
expr(S0,S) :- digit(S0,S).
expr(S0,S) :- expr(S0,S1),opr(S1,S2),expr(S2,S).
expr(S0,S) :- lt_paren(S0,S1),expr(S1,S2),rt_paren(S2,S).


id([id | S], S).

digit([0|S],S).
digit([1|S],S).
digit([2|S],S).
digit([3|S],S).
digit([4|S],S).
digit([5|S],S).
digit([6|S],S).
digit([7|S],S).
digit([8|S],S).
digit([9|S],S).
lt_paren([lt_paren|S],S).
rt_paren([rt_paren|S],S).
eql([equal_sign|S],S).
opr([add_op|S],S).
opr([mul_op|S],S).



%b)

digit_value([0|S],S,0).
digit_value([1|S],S,1).
digit_value([2|S],S,2).
digit_value([3|S],S,3).
digit_value([4|S],S,4).
digit_value([5|S],S,5).
digit_value([6|S],S,6).
digit_value([7|S],S,7).
digit_value([8|S],S,8).
digit_value([9|S],S,9).
assign_val(S0, S, V) :-id(S0,S1),eql(S1,S2),expr_val(S2,S,V).
expr_val(S0,S,V) :- digit_value(S0,S,V).
expr_val(S0,S,V) :- expr_val(S0,S1,V0),mul_opr(S1,S2),expr_val(S2,S,V1), V is V0 * V1.
expr_val(S0,S,V) :- expr_val(S0,S1,V0),add_opr(S1,S2),expr_val(S2,S,V1),V is V0 + V1.
expr_val(S0,S,V) :- lt_paren(S0,S1),expr_val(S1,S2,V),rt_paren(S2,S).
add_opr([add_op|S],S).
mul_opr([mul_op|S],S).