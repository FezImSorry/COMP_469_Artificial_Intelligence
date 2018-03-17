/*
Muhammad Ansari
Comp 469 Artificial Intelligence
Project #3: Prolog Challenges
02/19/2018
*/

/*Find the last element of the list*/
last(X,[X]) :- !.              %Base Case
last(X,[_|A]) :- last(X,A).    %Recursive Call


/*Find the second last element of a list*/
nextLast(X, [X,_]) :- !.              %Base Case
nextLast(X, [_|A]) :- nextLast(X,A).  %Recursive Call


/*Find the K'th element of a list*/
kelement(X,[X|_], 1) :- !.     %Base Case (N = 1)
kelement(X,[_|A], N) :-
        I is N - 1,
        kelement(X, A, I).     %Recursive Call (N-1 Each Call)


/*Find out whether a list is a palindrome*/
palin(L) :- reverse(L,L).


/*Flatten a nested list structure*/
flatten([A], X) :-
        is_list(A),
        flatten(A,X).
flatten([A], [A]).      %Base Case
flatten([A|B], X) :-
        is_list(A),
        flatten(A, Y),  %Recursive Call
        flatten(B, Z),  %Recursive Call
        append(Y,Z,X).  %Concatination of two previous calls
flatten([A|B], [A|X]) :- flatten(B,X).   %Recursive Call


/*Elimiate consecutive duplicates of list elements*/
compress([A], [A]).                           %Base Case
compress([A,A|B], X) :- compress([A|B],X).    %Recursive Call
compress([A|B], [A|X]) :- compress(B, X).     %Recursive Call





















