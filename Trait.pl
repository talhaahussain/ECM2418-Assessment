/*Begin Question 4.1*/

checklist([], _).
checklist([H|T], N) :-
	N mod H =\= 0,
    checklist(T, N).

prime( 2 ).
prime( N ) :-
    M is ceiling(sqrt(N)),
    numlist( 2, M, L1 ),
    checklist(L1, N).
    
/*End Question 4.1*/

/*Begin Question 4.2*/

combinations( LIST ) :-
    length(LIST, 9),
    member(1, LIST),
    member(2, LIST),
    member(3, LIST),
    member(4, LIST),
    member(5, LIST),
    member(6, LIST),
    member(7, LIST),
    member(8, LIST),
    member(9, LIST).

possible( X, Y, Z ) :-
    combinations( LS ),
    nth0( 0, LS, X1 ),
    nth0( 1, LS, X2 ),
    nth0( 2, LS, X3 ),
    nth0( 3, LS, Y1 ),
    nth0( 4, LS, Y2 ),
    nth0( 5, LS, Y3 ),
    nth0( 6, LS, Z1 ),
    nth0( 7, LS, Z2 ),
    nth0( 8, LS, Z3 ),
    X is (X1*100) + (X2*10) + X3,
    Y is (Y1*100) + (Y2*10) + Y3,
    Z is (Z1*100) + (Z2*10) + Z3.
 
/*End Question 4.2*/

/*Begin Question 4.3*/

acceptable( X, Y, Z ) :-
    \+ prime(X),
    \+ prime(Y),
    \+ prime(Z),
    X > 90,
    Y > 180,
    Z > 270,
    Z < 360,
    X < Y,
    Y < Z.
    
trait( X, Y, Z ) :-
    possible( X, Y, Z ),
    acceptable( X, Y, Z ).

/*End Question 4.3*/

/*-- any main predicates for testing goes here
 */