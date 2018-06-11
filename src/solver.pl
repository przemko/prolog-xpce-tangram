% solver.pl
%
% author: Przemyslaw Kobylanski <przemko@mac.com>

:- module(solver, [solve/1]).


solve(Box) :-
    piece(3, P3), insert(P3, Box),
    piece(7, P7), insert(P7, Box),
    piece(6, P6), insert(P6, Box),
    piece(1, P1), insert(P1, Box),
    piece(2, P2), insert(P2, Box),
    piece(4, P4), insert(P4, Box),
    piece(5, P5), insert(P5, Box).

piece(1, [[[_,_,1,1],[_,_,_,_]],
	    [[1,1,1,1],[_,_,1,1]]]).
piece(1, [[[1,1,1,1],[1,_,_,1]],
	    [[1,_,_,1],[_,_,_,_]]]).
piece(1, [[[1,1,_,_],[1,1,1,1]],
	    [[1,1,_,_],[_,_,_,_]]]).
piece(1, [[[_,_,_,_],[_,1,1,_]],
	    [[_,1,1,_],[1,1,1,1]]]).
piece(2, [[[_,_,2,2],[_,_,_,_]],
	    [[2,2,2,2],[_,_,2,2]]]).
piece(2, [[[2,2,2,2],[2,_,_,2]],
	    [[2,_,_,2],[_,_,_,_]]]).
piece(2, [[[2,2,_,_],[2,2,2,2]],
	    [[2,2,_,_],[_,_,_,_]]]).
piece(2, [[[_,_,_,_],[_,2,2,_]],
	    [[_,2,2,_],[2,2,2,2]]]).
piece(3, [[[3,3,3,3],[3,3,3,3],[_,_,3,3]],
	    [[3,3,3,3],[3,3,3,3],[3,_,_,3]]]).
piece(3, [[[3,3,3,3],[3,3,3,3]],
	    [[3,3,3,3],[3,3,3,3]],
	    [[3,3,_,_],[3,_,_,3]]]).
piece(3, [[[_,3,3,_],[3,3,3,3],[3,3,3,3]],
	    [[3,3,_,_],[3,3,3,3],[3,3,3,3]]]).
piece(3, [[[_,3,3,_],[_,_,3,3]],
	  [[3,3,3,3],[3,3,3,3]],
	  [[3,3,3,3],[3,3,3,3]]]).
piece(4, [[[_,_,4,4]],
	  [[4,4,4,4]]]).
piece(4, [[[4,4,4,4],[4,_,_,4]]]).
piece(4, [[[4,4,4,4]],
	  [[4,4,_,_]]]).
piece(4, [[[_,4,4,_],[4,4,4,4]]]).
piece(4, [[[_,4,4,_]],
	  [[4,4,4,4]]]).
piece(4, [[[4,4,4,4],[_,_,4,4]]]).
piece(4, [[[4,4,4,4]],
	  [[4,_,_,4]]]).
piece(4, [[[4,4,_,_],[4,4,4,4]]]).
piece(5, [[[_,_,5,5]],
	  [[5,5,5,5]]]).
piece(5, [[[5,5,5,5],[5,_,_,5]]]).
piece(5, [[[5,5,5,5]],
	  [[5,5,_,_]]]).
piece(5, [[[_,5,5,_],[5,5,5,5]]]).
piece(5, [[[_,5,5,_]],
	  [[5,5,5,5]]]).
piece(5, [[[5,5,5,5],[_,_,5,5]]]).
piece(5, [[[5,5,5,5]],
	  [[5,_,_,5]]]).
piece(5, [[[5,5,_,_],[5,5,5,5]]]).
piece(6, [[[_,_,_,_],[_,6,6,_]],
	  [[_,6,6,_],[6,6,6,6]],
	  [[6,6,_,_],[6,_,_,6]]]).
piece(6, [[[_,6,6,_],[_,_,6,6],[_,_,_,_]],
	  [[6,6,_,_],[6,6,6,6],[_,_,6,6]]]).
piece(6, [[[_,6,6,_],[_,_,6,6]],
	  [[6,6,6,6],[6,_,_,6]],
	  [[6,_,_,6],[_,_,_,_]]]).
piece(6, [[[6,6,_,_],[6,6,6,6],[_,_,6,6]],
	  [[_,_,_,_],[6,6,_,_],[6,_,_,6]]]).
piece(6, [[[_,_,6,6],[_,_,_,_]],
	  [[6,6,6,6],[_,_,6,6]],
	  [[6,6,_,_],[6,_,_,6]]]).
piece(6, [[[_,6,6,_],[6,6,6,6],[6,_,_,6]],
	  [[6,6,_,_],[6,_,_,6],[_,_,_,_]]]).
piece(6, [[[_,6,6,_],[_,_,6,6]],
	  [[6,6,_,_],[6,6,6,6]],
	  [[_,_,_,_],[6,6,_,_]]]).
piece(6, [[[_,_,_,_],[_,6,6,_],[_,_,6,6]],
	  [[_,6,6,_],[6,6,6,6],[6,_,_,6]]]).
piece(7, [[[_,_,_,_],[_,_,_,_],[_,7,7,_]],
	  [[_,_,_,_],[_,7,7,_],[7,7,7,7]],
	  [[_,7,7,_],[7,7,7,7],[7,_,_,7]],
	  [[7,7,_,_],[7,_,_,7],[_,_,_,_]]]).
piece(7, [[[_,7,7,_],[_,_,7,7],[_,_,_,_],[_,_,_,_]],
	  [[7,7,_,_],[7,7,7,7],[_,_,7,7],[_,_,_,_]],
	  [[_,_,_,_],[7,7,_,_],[7,7,7,7],[_,_,7,7]]]).
piece(7, [[[_,_,_,_],[_,7,7,_],[_,_,7,7]],
	  [[_,7,7,_],[7,7,7,7],[7,_,_,7]],
	  [[7,7,7,7],[7,_,_,7],[_,_,_,_]],
	  [[7,_,_,7],[_,_,_,_],[_,_,_,_]]]).
piece(7, [[[7,7,_,_],[7,7,7,7],[_,_,7,7],[_,_,_,_]],
	  [[_,_,_,_],[7,7,_,_],[7,7,7,7],[_,_,7,7]],
	  [[_,_,_,_],[_,_,_,_],[7,7,_,_],[7,_,_,7]]]).
piece(7, [[[_,_,7,7],[_,_,_,_],[_,_,_,_]],
	  [[7,7,7,7],[_,_,7,7],[_,_,_,_]],
	  [[7,7,_,_],[7,7,7,7],[_,_,7,7]],
	  [[_,_,_,_],[7,7,_,_],[7,_,_,7]]]).
piece(7, [[[_,_,_,_],[_,7,7,_],[7,7,7,7],[7,_,_,7]],
	  [[_,7,7,_],[7,7,7,7],[7,_,_,7],[_,_,_,_]],
	  [[7,7,_,_],[7,_,_,7],[_,_,_,_],[_,_,_,_]]]).
piece(7, [[[_,7,7,_],[_,_,7,7],[_,_,_,_]],
	  [[7,7,_,_],[7,7,7,7],[_,_,7,7]],
	  [[_,_,_,_],[7,7,_,_],[7,7,7,7]],
	  [[_,_,_,_],[_,_,_,_],[7,7,_,_]]]).
piece(7, [[[_,_,_,_],[_,_,_,_],[_,7,7,_],[_,_,7,7]],
	  [[_,_,_,_],[_,7,7,_],[7,7,7,7],[7,_,_,7]],
	  [[_,7,7,_],[7,7,7,7],[7,_,_,7],[_,_,_,_]]]).


insert(Piece, Box) :-
    insert2(Piece, Box).
insert(Piece, [_ | Box]) :-
    insert(Piece, Box).

insert2(Piece, Box) :-
    insert2(Piece, Box, _).

insert2([], _, _).
insert2([R1 | Piece], [R2 | Box], N) :-
    append(Prefix, Sufix, R2),
    length(Prefix, N),
    append(R1, _, Sufix),
    insert2(Piece, Box, N).


