% gui.pl
%
% author: Przemyslaw Kobylanski <przemko@mac.com>

:- module(gui, [draw/2]).

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
    send(P, colour, colour(black)),
    send(W, display, P).


