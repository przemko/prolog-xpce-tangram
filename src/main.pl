:- use_module(problems).
:- use_module(solver).
:- use_module(gui).

run(Page, Num) :-
    fig(Page/Num, Width, Height, Box),
    atomic_list_concat(['Fig. ', Page, '.', Num], Title),
    new(Window, window(Title, size(40*Width, 40*Height))),
    send(Window, open),
    (   solve(Box),
        draw(Window, Box)
    ;   send(Window, destroy),
        fail).

