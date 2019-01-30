Prolog project 1~3

P1
- To perform the tokenizer, we have to assign an relationship between the lexemes and tokens. First when we read from an input string, we read them as the ASKII characters. That way prolog can automatically break the string down to a list of characters.  Then we just use recursion to find the token for each character.
`tokenizer("Your equation", T).`

p2
- a) Implement BNF in prolog is simple, just follow the rules and write relationships. 
`assign([Your equation], [Your reminder]).`
- b) Adding the different operator “add_op” and “mul_op” to the rules.
To compile, simply consult p1.pl and p2.pl and run
` tokenizer("Your equation", T), assign_val(T, [], V). `

p3
- I’m changing the 2nd expr appears in the BNF to another term, for example
`<expr>= <expr><op><term>` 
to avoid ambiguous. Same method is used on the other levels of the parse tree. Also the lower level on the parse tree will be a higher precedence.
To compile, simply consult "p1.pl" and "p3.pl" and run
` tokenizer("Your equation", T), assign_val(T, [], V). `



Implement Token and BNF on C.
Part1
- I used the character array to store the input equation and then take each of the character as an input to find the tokens and return a pointer to a char array of the token name.

Part2
- I don’t really know how to write this on C but I have an explicit idea on how to do this.
For example the input equation is a=(1+2^3)x4+6^5 
We can first write a infix to prefix function, to change the equation to “+x+1^234^65” and push this array of characters onto a stack. Because the stack in first in last out, the top character of the stack in this case is “5”. 
And then, every time I pop, if I get a number, I look for an operator next. If not, I’ll save the number for later use. If yes, we just use the operator on the closest two numbers.
So that +x+1^234^65
=+x+1(2^3)4(6^5)
=+x(1+(2^3))4(6^5)
=+(1+2^3)x4(6^5)
=(1+2^3)x4+6^5
Which is the correct way to calculate it!
