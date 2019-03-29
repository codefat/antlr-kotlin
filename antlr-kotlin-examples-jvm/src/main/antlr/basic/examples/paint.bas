10 REM SIMPLE PAINT PROGRAM
20 REM BY VECTRONIC
100 HOME : GR
110 X = 20 : Y = 20 : C = 9 : K = 160
120 COLOR = C: PLOT X, Y
130 GOSUB 2000
150 XP%=PDL(0): FOR PX = 1 TO 10 : NEXT: YP%=PDL(1): FOR PY =1 TO 10: NEXT
160 K = PEEK(-16384)
170 IF XP% > 130 THEN 300
180 IF XP% < 120 THEN 400
190 IF YP% > 130 THEN 500
200 IF YP% < 120 THEN 600
210 IF K = 155 THEN GOSUB 3000
220 GOTO 150

299 REM PLOT X MOVING LEFT
300 GOSUB 1000
310 IF X =39 THEN 150
320 X = X + 1: COLOR = C: PLOT X - 1, Y
330 COLOR = 9: PLOT X, Y
340 GOTO 150

399 REM PLOT X MOVING RIGHT
400 GOSUB 1000
410 IF X = 0 THEN 150
420 X = X -1: COLOR = C: PLOT X + 1, Y
430 COLOR = 9: PLOT X, Y
440 GOTO 150

499 REM PLOT Y MOVING DOWN
500 GOSUB 1000
510 IF Y = 39 THEN 150
520 Y = Y+ 1: COLOR = C: PLOT X, Y-1
530 COLOR = 9: PLOT X, Y
540 GOTO 150

599 REM PLOT Y MOVING UP
600 GOSUB 1000
610 IF Y = 0 THEN 150
620 Y = Y - 1: COLOR = C: PLOT X, Y + 1
630 COLOR = 9: PLOT X,Y
640 GOTO 150

999 END

1000 REM COLOR PICKER
1100 IF K = 177 THEN C = 1
1110 IF K = 178 THEN C = 2
1120 IF K = 179 THEN C = 3
1130 IF K = 180 THEN C = 4
1140 IF K = 181 THEN C = 5
1150 IF K = 182 THEN C = 6
1160 IF K = 183 THEN C = 7
1170 IF K = 184 THEN C = 8
1180 IF K = 185 THEN C = 9
1200 IF K = 209 THEN C = 11
1210 IF K = 215 THEN C = 12
1220 IF K = 197 THEN C = 13
1230 IF K = 210 THEN C = 14
1240 IF K = 212 THEN C = 15
1250 IF K = 160 THEN C = 0
1260 RETURN

2000 REM MENU OPTIONS
2100 PRINT "1=PRD 2=DBL 3=PRL 4=DGR 5=GR 6=MBL 7=LBL 8=BN 9=OR Q=PK W=GR E=YW R=AQ T=WT SBR=BK ESC=QUIT"
2200 K= PEEK (-16368)
2999 RETURN

3000 REM QUIT
3100 PRINT "ARE YOU SURE YOU WANT TO QUIT? "
3110 PRINT "TYPE 'Y' OR 'N'"
3200 INPUT N$
3300 IF N$= "Y" THEN 3700
3400 IF N$= "N" THEN 3800
3500 PRINT "PLEASE ENTER A 'Y' OR 'N'"
3600 GOTO 3100
3700 TEXT : HOME : GOTO 999
3800 GOSUB 2000
3900 RETURN