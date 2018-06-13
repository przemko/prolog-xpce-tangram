# prolog-xpce-tangram
Program w Prologu rozwiązujący łamigłówkę Tangram.


```bash
$ cd src
$ swipl
Welcome to SWI-Prolog (threaded, 64 bits, version 7.6.4)
SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
Please run ?- license. for legal details.

For online help and background, visit http://www.swi-prolog.org
For built-in help, use ?- help(Topic). or ?- apropos(Word).

?- [main].
true.

?- run(1, 1).
% 715,642 inferences, 0.054 CPU in 0.054 seconds (100% CPU, 13209350 Lips)
true ;
% 1,014 inferences, 0.000 CPU in 0.000 seconds (100% CPU, 5001356 Lips)
true ;
% 2,486 inferences, 0.000 CPU in 0.000 seconds (99% CPU, 5340884 Lips)
true ;
% 1,012 inferences, 0.000 CPU in 0.000 seconds (99% CPU, 3742437 Lips)
true ;
% 12,859 inferences, 0.004 CPU in 0.004 seconds (100% CPU, 3338082 Lips)
true ;
% 1,012 inferences, 0.000 CPU in 0.000 seconds (99% CPU, 4358162 Lips)
true ;
% 2,486 inferences, 0.000 CPU in 0.000 seconds (99% CPU, 5043087 Lips)
true ;
% 1,012 inferences, 0.000 CPU in 0.000 seconds (99% CPU, 3776260 Lips)
true ;
% 494,387 inferences, 0.042 CPU in 0.042 seconds (100% CPU, 11796315 Lips)
false.

```

Średni czas w sekundach znalezienia pierwszego oraz wszystkich rozwiązań (SWI-Prolog 7.6.4, Ubuntu 18.04, Intel Core i7 3.6 GHz):

|Obrazek|Pierwsze|Wszystkie|
|:----:|--------:|--------:|
|1/1|0.052|0.091|
|1/2|0.003|0.096|
|1/3|0.000|0.666|
|1/4|0.007|0.144|
|2/1|0.036|0.280|
|2/2|0.017|0.160|
|2/3|0.023|0.184|
|2/4|0.014|0.322|

