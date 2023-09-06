/*Begin Question 3.1*/

indices( [], _, [] ).
indices( [H|T], XS, ES ) :-
    nth0( H, XS, E ),
    indices( T, XS, F ),
    append( [E], F, ES ).

/*End Question 3.1*/

/*Begin Question 3.2*/

possible( GRID ) :-
    length(GRID, 9),
    member(1, GRID),
    member(2, GRID),
    member(3, GRID),
    member(4, GRID),
    member(5, GRID),
    member(6, GRID),
    member(7, GRID),
    member(8, GRID),
    member(9, GRID).

/*End Question 3.2*/

/*Begin Question 3.3*/

acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID) :-
	nth0( 0, GRID, A ), nth0( 1, GRID, B ), nth0( 3, GRID, C ), nth0( 4, GRID, D ),
    T0 is A + B + C + D,
    nth0( 1, GRID, E ), nth0( 2, GRID, F ), nth0( 4, GRID, G ), nth0( 5, GRID, H ),
    T1 is E + F + G + H,
    nth0( 3, GRID, I ), nth0( 4, GRID, J ), nth0( 6, GRID, K ), nth0( 7, GRID, L ),
    T2 is I + J + K + L,
    nth0( 4, GRID, M ), nth0( 5, GRID, N ), nth0( 7, GRID, O ), nth0( 8, GRID, P ),
    T3 is M + N + O + P,
    indices( US, GRID, RESULTU ),
    indices( VS, GRID, RESULTV ),
    indices( WS, GRID, RESULTW ),
    sum_list(RESULTU, X),
    X = U,
    sum_list(RESULTV, Y),
    Y = V,
    sum_list(RESULTW, Z),
    Z = W.
	    
suko( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID ) :-
    possible( GRID ),
    acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID).

/*End Question 3.3*/

/*-- any main predicates for testing goes here
 */
