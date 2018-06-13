:- use_module(problems).
:- use_module(solver).

stat1(N, A/B) :-
    fig(A/B, _, _, Box),
    statistics(runtime, _),
    stat_loop1(N, Box),
    statistics(runtime, [_, T]),
    AVG is T / N / 1000,
    format('average runtime is ~w sec~n', [AVG]).

stat_loop1(0, _).
stat_loop1(N, B) :-
    N > 0,
    N1 is N - 1,
    copy_term(B, B1),
    once(solve(B1)), !,
    stat_loop1(N1, B).

stat2(N, A/B) :-
    fig(A/B, _, _, Box),
    statistics(runtime, _),
    stat_loop2(N, Box),
    statistics(runtime, [_, T]),
    AVG is T / N / 1000,
    format('average runtime is ~w sec~n', [AVG]).

stat_loop2(0, _).
stat_loop2(N, B) :-
    N > 0,
    N1 is N - 1,
    copy_term(B, B1),
    all(B1), !,
    stat_loop2(N1, B).

all(B) :-
    solve(B),
    fail.
all(_).

