10 goto 5000
20 ****************************************
30 * jerry - a small compiler for the c64 *
40 * (c)2025 by ir. marc dendooven        *
50 ****************************************
100" # just a test program
110" # this is a comment
120" 'hello world'
130" $


5000 print " +------------------------------------+"
5010 print " !      welcome to jerry v0.0         !"
5020 print " !  a small compiler based on mouse   !"
5030 print " !     (c)2025 ir. marc dendooven     !"
5040 print " +------------------------------------+"
5050 print

5100 rem settings
5110 es=2240: rem first character (double quote) in editor
5120 ep=es+1: rem editor pointer
5130 cs=49152: rem codespace


5200 if peek(es)<>34 then print"error:first double quote expected":stop

5300 gosub 9000:rem getchar
5310 if ch$=" " then 5300
5320 if ch$="$" then poke cs,96:cs=cs+1:print:print "bye":end:rem rts
5330 if ch$="#" then 6000
5340 if ch$="'" then 6100

5500 print:print"error:unknown character '";ch$;"'":stop

6000 rem comment
6010 gosub 9000: if ch<>13 then 6010
6020 rem gosub 9000
6030 goto 5300

6100 rem print a static string
6110 gosub 9000: if ch$="'" then gosub 9000:goto 5300
6120 print chr$(18)+ch$+chr$(146);
6222 poke cs,169:poke cs+1,ch:rem lda# ch
6224 poke cs+2,32:poke cs+3,210:poke cs+4,255:rem jsr $ffd2
6226 cs=cs+5
6130 goto 6110 


9000 rem getchar
9010 ch=peek(ep):ep=ep+1
9020 if ch=0 then ch=13:ep=ep+5
9025 ch$=chr$(ch)
9030 print ch$;
9040 return



9100 for i = 2024 to 3050
9110 if peek(i)=34 then print i
9120 next



