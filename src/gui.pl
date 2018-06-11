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
    draw_triangle(North, Window, X,Y, X+40,Y, X+20,Y+20),
    draw_triangle(East,  Window, X+40,Y, X+40,Y+40, X+20,Y+20),
    draw_triangle(South, Window, X+20,Y+20, X+40,Y+40, X,Y+40),
    draw_triangle(West,  Window, X,Y, X+20,Y+20, X,Y+40).

draw_triangle(Pc, Window, X1,Y1, X2,Y2, X3,Y3) :-
    color(Pc, Color),
    new(Path, path(poly)),
    send(Path, append, point(X1, Y1)),
    send(Path, append, point(X2, Y2)),
    send(Path, append, point(X3, Y3)),
    send(Path, fill_pattern, colour(Color)),
    send(Path, colour, colour(black)),
    send(Window, display, Path).

color(1, yellow).
color(2, orange).
color(3, red).
color(4, green).
color(5, blue).
color(6, gray).
color(7, magenta).
