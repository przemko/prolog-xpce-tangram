% tangram.pl
%
% author: Przemyslaw Kobylanski <przemko@mac.com>

:- module(tangram, [solve/0, solve/2]).

solve :-
    new(Window, window('Solution', size(40*6, 40*6))),
    send(Window, open),
    (   solve(Box),
        draw(Window, Box)
    ;   send(Window, destroy),
        fail).

solve(Height, Width) :-
    new(Window, window('Solution', size(40*Width, 40*Height))),
    send(Window, open),
    (   solve(Height, Width, Box),
        draw(Window, Box)
    ;   send(Window, destroy),
        fail).

solve(Box) :-
    cross(Box),
    piece(3, _, _, P1), insert(P1, Box),
    piece(7, _, _, P2), insert(P2, Box),
    piece(6, _, _, P3), insert(P3, Box),
    piece(1, _, _, P4), insert(P4, Box),
    piece(2, _, _, P5), insert(P5, Box),
    piece(4, _, _, P6), insert(P6, Box),
    piece(5, _, _, P7), insert(P7, Box).

solve(Height, Width, Box) :-
    box(Height, Width, Box),
    piece(3, _, _, P1), insert(P1, Box),
    piece(7, _, _, P2), insert(P2, Box),
    piece(6, _, _, P3), insert(P3, Box),
    piece(1, _, _, P4), insert(P4, Box),
    piece(2, _, _, P5), insert(P5, Box),
    piece(4, _, _, P6), insert(P6, Box),
    piece(5, _, _, P7), insert(P7, Box).

draw(Window, Box) :-
    send(Window, clear),
    draw(Box, Window, 0).

draw([], _, _).
draw([Row | Box], Window, Y) :-
    draw(Row, Window, Y, 0),
    Y1 is Y + 40,
    draw(Box, Window, Y1).

draw([], _, _, _).
draw([Cell | Row], Window, Y, X) :-
    draw_cell(Cell, Window, Y, X),
    X1 is X + 40,
    draw(Row, Window, Y, X1).

draw_cell(Cell, _, _, _) :-
    var(Cell), !.
draw_cell([North, East, South, West], Window, Y, X) :-
    draw_north(North, Window, Y, X),
    draw_east(East, Window, Y, X),
    draw_south(South, Window, Y, X),
    draw_west(West, Window, Y, X).

draw_north(North, _, _, _) :-
    var(North), !.
draw_north(+, _, _, _) :- !.
draw_north(North, Window, Y, X) :-
    color(North, Color),
    triangle(Color, Window, Y,X, Y,X+40, Y+20,X+20).

draw_east(East, _, _, _) :-
    var(East), !.
draw_east(+, _, _, _) :- !.
draw_east(East, Window, Y, X) :-
    color(East, Color),
    triangle(Color, Window, Y,X+40, Y+40,X+40, Y+20,X+20).

draw_south(South, _, _, _) :-
    var(South), !.
draw_south(+, _, _, _) :- !.
draw_south(South, Window, Y, X) :-
    color(South, Color),
    triangle(Color, Window, Y+20,X+20, Y+40,X+40, Y+40,X).

draw_west(West, _, _, _) :-
    var(West), !.
draw_west(+, _, _, _) :- !.
draw_west(West, Window, Y, X) :-
    color(West, Color),
    triangle(Color, Window, Y,X, Y+20,X+20, Y+40,X).

color(1, yellow).
color(2, orange).
color(3, red).
color(4, green).
color(5, blue).
color(6, gray).
color(7, magenta).


triangle(C, W, Y1,X1, Y2,X2, Y3,X3) :-
    new(P, path(poly)),
    send(P, append, point(X1, Y1)),
    send(P, append, point(X2, Y2)),
    send(P, append, point(X3, Y3)),
    send(P, fill_pattern, colour(C)),
    send(W, display, P).


% \A /
%  \/B
% D/\
% / C\

% piece(Id, Side, Rot, [L1, L2, ...,Lh])
% Li = [C1, C2, ..., Cw], Cj = [Aij,Bij,Cij,Dij],
% Aij,Bij,Cij,Dij = _ lub Id

piece(1, 1, 0, [[[_,_,1,1],[_,_,_,_]],
                [[1,1,1,1],[_,_,1,1]]]).
piece(1, 1, 1, [[[1,1,1,1],[1,_,_,1]],
                [[1,_,_,1],[_,_,_,_]]]).
piece(1, 1, 2, [[[1,1,_,_],[1,1,1,1]],
                [[1,1,_,_],[_,_,_,_]]]).
piece(1, 1, 3, [[[_,_,_,_],[_,1,1,_]],
                [[_,1,1,_],[1,1,1,1]]]).
piece(2, 1, 0, [[[_,_,2,2],[_,_,_,_]],
                [[2,2,2,2],[_,_,2,2]]]).
piece(2, 1, 1, [[[2,2,2,2],[2,_,_,2]],
                [[2,_,_,2],[_,_,_,_]]]).
piece(2, 1, 2, [[[2,2,_,_],[2,2,2,2]],
                [[2,2,_,_],[_,_,_,_]]]).
piece(2, 1, 3, [[[_,_,_,_],[_,2,2,_]],
                [[_,2,2,_],[2,2,2,2]]]).
piece(3, 1, 0, [[[3,3,3,3],[3,3,3,3],[_,_,3,3]],
                [[3,3,3,3],[3,3,3,3],[3,_,_,3]]]).
piece(3, 1, 1, [[[3,3,3,3],[3,3,3,3]],
                [[3,3,3,3],[3,3,3,3]],
                [[3,3,_,_],[3,_,_,3]]]).
piece(3, 1, 2, [[[_,3,3,_],[3,3,3,3],[3,3,3,3]],
                [[3,3,_,_],[3,3,3,3],[3,3,3,3]]]).
piece(3, 1, 3, [[[_,3,3,_],[_,_,3,3]],
                [[3,3,3,3],[3,3,3,3]],
                [[3,3,3,3],[3,3,3,3]]]).
piece(4, 1, 0, [[[_,_,4,4]],
                [[4,4,4,4]]]).
piece(4, 1, 1, [[[4,4,4,4],[4,_,_,4]]]).
piece(4, 1, 2, [[[4,4,4,4]],
                [[4,4,_,_]]]).
piece(4, 1, 3, [[[_,4,4,_],[4,4,4,4]]]).
piece(4, 2, 0, [[[_,4,4,_]],
                [[4,4,4,4]]]).
piece(4, 2, 1, [[[4,4,4,4],[_,_,4,4]]]).
piece(4, 2, 2, [[[4,4,4,4]],
                [[4,_,_,4]]]).
piece(4, 2, 3, [[[4,4,_,_],[4,4,4,4]]]).
piece(5, 1, 0, [[[_,_,5,5]],
                [[5,5,5,5]]]).
piece(5, 1, 1, [[[5,5,5,5],[5,_,_,5]]]).
piece(5, 1, 2, [[[5,5,5,5]],
                [[5,5,_,_]]]).
piece(5, 1, 3, [[[_,5,5,_],[5,5,5,5]]]).
piece(5, 2, 0, [[[_,5,5,_]],
                [[5,5,5,5]]]).
piece(5, 2, 1, [[[5,5,5,5],[_,_,5,5]]]).
piece(5, 2, 2, [[[5,5,5,5]],
                [[5,_,_,5]]]).
piece(5, 2, 3, [[[5,5,_,_],[5,5,5,5]]]).
piece(6, 1, 0, [[[_,_,_,_],[_,6,6,_]],
                [[_,6,6,_],[6,6,6,6]],
                [[6,6,_,_],[6,_,_,6]]]).
piece(6, 1, 1, [[[_,6,6,_],[_,_,6,6],[_,_,_,_]],
                [[6,6,_,_],[6,6,6,6],[_,_,6,6]]]).
piece(6, 1, 2, [[[_,6,6,_],[_,_,6,6]],
                [[6,6,6,6],[6,_,_,6]],
                [[6,_,_,6],[_,_,_,_]]]).
piece(6, 1, 3, [[[6,6,_,_],[6,6,6,6],[_,_,6,6]],
                [[_,_,_,_],[6,6,_,_],[6,_,_,6]]]).
piece(6, 2, 0, [[[_,_,6,6],[_,_,_,_]],
                [[6,6,6,6],[_,_,6,6]],
                [[6,6,_,_],[6,_,_,6]]]).
piece(6, 2, 1, [[[_,6,6,_],[6,6,6,6],[6,_,_,6]],
                [[6,6,_,_],[6,_,_,6],[_,_,_,_]]]).
piece(6, 2, 2, [[[_,6,6,_],[_,_,6,6]],
                [[6,6,_,_],[6,6,6,6]],
                [[_,_,_,_],[6,6,_,_]]]).
piece(6, 2, 3, [[[_,_,_,_],[_,6,6,_],[_,_,6,6]],
                [[_,6,6,_],[6,6,6,6],[6,_,_,6]]]).
piece(7, 1, 0, [[[_,_,_,_],[_,_,_,_],[_,7,7,_]],
                [[_,_,_,_],[_,7,7,_],[7,7,7,7]],
                [[_,7,7,_],[7,7,7,7],[7,_,_,7]],
                [[7,7,_,_],[7,_,_,7],[_,_,_,_]]]).
piece(7, 1, 1, [[[_,7,7,_],[_,_,7,7],[_,_,_,_],[_,_,_,_]],
                [[7,7,_,_],[7,7,7,7],[_,_,7,7],[_,_,_,_]],
                [[_,_,_,_],[7,7,_,_],[7,7,7,7],[_,_,7,7]]]).
piece(7, 1, 2, [[[_,_,_,_],[_,7,7,_],[_,_,7,7]],
                [[_,7,7,_],[7,7,7,7],[7,_,_,7]],
                [[7,7,7,7],[7,_,_,7],[_,_,_,_]],
                [[7,_,_,7],[_,_,_,_],[_,_,_,_]]]).
piece(7, 1, 3, [[[7,7,_,_],[7,7,7,7],[_,_,7,7],[_,_,_,_]],
                [[_,_,_,_],[7,7,_,_],[7,7,7,7],[_,_,7,7]],
                [[_,_,_,_],[_,_,_,_],[7,7,_,_],[7,_,_,7]]]).
piece(7, 2, 0, [[[_,_,7,7],[_,_,_,_],[_,_,_,_]],
                [[7,7,7,7],[_,_,7,7],[_,_,_,_]],
                [[7,7,_,_],[7,7,7,7],[_,_,7,7]],
                [[_,_,_,_],[7,7,_,_],[7,_,_,7]]]).
piece(7, 2, 1, [[[_,_,_,_],[_,7,7,_],[7,7,7,7],[7,_,_,7]],
                [[_,7,7,_],[7,7,7,7],[7,_,_,7],[_,_,_,_]],
                [[7,7,_,_],[7,_,_,7],[_,_,_,_],[_,_,_,_]]]).
piece(7, 2, 2, [[[_,7,7,_],[_,_,7,7],[_,_,_,_]],
                [[7,7,_,_],[7,7,7,7],[_,_,7,7]],
                [[_,_,_,_],[7,7,_,_],[7,7,7,7]],
                [[_,_,_,_],[_,_,_,_],[7,7,_,_]]]).
piece(7, 2, 3, [[[_,_,_,_],[_,_,_,_],[_,7,7,_],[_,_,7,7]],
                [[_,_,_,_],[_,7,7,_],[7,7,7,7],[7,_,_,7]],
                [[_,7,7,_],[7,7,7,7],[7,_,_,7],[_,_,_,_]]]).
box(0, _, []).
box(H, W, [Row | Box]) :-
    H > 0,
    H1 is H - 1,
    length(Row, W),
    box(H1, W, Box).

cross([[[+,+,+,+],[+,+,+,+],[_,_,_,_],[_,_,_,_],[+,+,+,+],[+,+,+,+]],
       [[+,+,+,+],[+,+,+,+],[_,_,_,_],[_,_,_,_],[+,+,+,+],[+,+,+,+]],
       [[_,_,_,_],[_,_,_,_],[_,_,_,_],[_,_,_,_],[_,_,_,_],[_,_,_,_]],
       [[_,_,_,_],[_,_,_,_],[_,_,_,_],[_,_,_,_],[_,_,_,_],[_,_,_,_]],
       [[+,+,+,+],[+,+,+,+],[_,_,_,_],[_,_,_,_],[+,+,+,+],[+,+,+,+]],
       [[+,+,+,+],[+,+,+,+],[_,_,_,_],[_,_,_,_],[+,+,+,+],[+,+,+,+]]]).
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


