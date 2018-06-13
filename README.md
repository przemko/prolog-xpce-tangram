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

