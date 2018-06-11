# prolog-xpce-tangram
Program w Prologu rozwiązujący łamigłówkę Tangram.


```bash
$ cd src
$ swipl
?- [main].
true.

?- run(1, 1).
% 745,253 inferences, 0.058 CPU in 0.058 seconds (100% CPU, 12857240 Lips)
true ;
% 1,044 inferences, 0.000 CPU in 0.000 seconds (99% CPU, 3406655 Lips)
true ;
% 2,540 inferences, 0.001 CPU in 0.001 seconds (100% CPU, 2377941 Lips)
true ;
% 1,042 inferences, 0.001 CPU in 0.001 seconds (100% CPU, 2002233 Lips)
true ;
% 13,663 inferences, 0.005 CPU in 0.005 seconds (100% CPU, 2756671 Lips)
true ;
% 1,042 inferences, 0.000 CPU in 0.000 seconds (99% CPU, 2499610 Lips)
true ;
% 2,540 inferences, 0.001 CPU in 0.001 seconds (100% CPU, 2563670 Lips)
true ;
% 1,042 inferences, 0.000 CPU in 0.000 seconds (99% CPU, 2800307 Lips)
true ;
% 512,023 inferences, 0.110 CPU in 0.110 seconds (100% CPU, 4660614 Lips)
false.

```

Czasy w sekundach znalezienia pierwszego oraz wszystkich rozwiązań (SWI-Prolog 7.2.3, Intel Core i-7 3.4 GHz):

|Fig   |Pierwsze |Wszystkie|
|:----:|--------:|--------:|
|1/1|0.056|0.096|
|1/2|0.006|0.098|
|1/3|0.001|0.712|
|1/4|0.013|0.155|
|2/1|0.007|0.430|
|2/2|0.020|0.178|
