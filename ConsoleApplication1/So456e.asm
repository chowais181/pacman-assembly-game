Include Irvine32.inc
Include macros.inc
buffer_size = 2000

.data



; lebel 1 30 dots

lev_1            db  "                ###################", 0dh, 0ah
                db     "                              #P  . . • .      .#", 0dh, 0ah
            db     "                              #######   • . .   #", 0dh, 0ah
  db     "                              # . •   .•        #", 0dh, 0ah
      db     "                              #     .    .#######", 0dh, 0ah
db     "                              #   .•.   . •  ...#", 0dh, 0ah
db     "                              # . #########  .. #", 0dh, 0ah
db     "                              #. .  •     .   . #", 0dh, 0ah
db     "                              # .. .     ..•..  #", 0dh, 0ah
db     "                              ###################", 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 30 dots
lev_2           db     "                              ###################", 0dh, 0ah
db     "                              #P  . . • . .  • .#", 0dh, 0ah
db     "                              #######   • . .   #", 0dh, 0ah
db     "                              # .     • .•.  .•.#", 0dh, 0ah
db     "                              ########  • #######", 0dh, 0ah
db     "                              # •       .    ...#", 0dh, 0ah
db     "                              #.. #########.• . #", 0dh, 0ah
db     "                              #. .  • . . .   . #", 0dh, 0ah
db     "                              #    .  • .  • . .#", 0dh, 0ah
db     "                              ###################", 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 30
lev_3           db     "                              ###################", 0dh, 0ah
db     "                              #P  . . • . .  • .#", 0dh, 0ah
db     "                              ####### • • . .   #", 0dh, 0ah
db     "                              # .     .  •.  .•.#", 0dh, 0ah
db     "                              ##########.########", 0dh, 0ah
db     "                              # •  .    .   •...#", 0dh, 0ah
db     "                              #•. #########.• . #", 0dh, 0ah
db     "                              #   .  • . .    . #", 0dh, 0ah
db     "                              # . • . • .  • . .#", 0dh, 0ah
db     "                              ###################", 0

score_str        db      "                             ___Score is = ", 0
life_str         db      "                             ___Life  is = ", 0

score            dw      0
life             dw      3

level            dw      0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.code
main PROC

call display
call menu_proc
call control_menu

exit
main endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
display proc
mov eax, yellow
call settextcolor
mWrite <"     ********************************************************************************************", 0dh, 0ah>
mWrite <"      __________________________________________________________________________________________ ", 0dh, 0ah>
mWrite <"     |                                                                                          |   ", 0dh, 0ah>
mWrite <"     |        |ppppppp      A         CCCCC    MMMM    MMMMM        A          |N       N|      | ", 0dh, 0ah>
mWrite <"     |        |pp    pp    A  A      C         M   MM  MM  M       A  A        |N N     N|      |", 0dh, 0ah>
mWrite <"     |        |ppppppp    AAAAAA     C         M     M     M      AAAAAA       |N   N   N|      |", 0dh, 0ah>
mWrite <"     |        |pp        A      A    C         M           M     A      A      |N     N N|      |", 0dh, 0ah>
mWrite <"     |        |pp       A        A    CCCCC    M           M    A        A     |N       N|      |", 0dh, 0ah>
mWrite <"     |__________________________________________________________________________________________| ", 0dh, 0ah>
mWrite <"                                                                                                  ", 0dh, 0ah>
mWrite <"     ********************************************************************************************", 0dh, 0ah>
call crlf
call crlf
mWrite <"     ____________________________________MADE BY_______________________________________________ ", 0ah, 0dh>
call crlf
call crlf
mov eax, lightcyan
call settextcolor
mWrite <"          #  MUHAMMAD AWAIS ZAHID", 0dh, 0ah>
mWrite <"          #  ZULQARNAIN HAIDER", 0dh, 0ah>
mWrite <"          #  FAHAD USMAN", 0dh, 0ah>
call crlf
call crlf
mov eax, LightMagenta
call settextcolor

mWrite <"   ************************************************* ", 0dh, 0ah>
mWrite <"   *  _________________________________________    *", 0dh, 0ah>
mWrite <"   * |   Game is    Loading------------------  *|  *", 0dh, 0ah>
mWrite <"   * |_________________________________________*|  *", 0dh, 0ah>
mWrite <"   *                                               *", 0dh, 0ah>
mWrite <"   ************************************************* ", 0dh, 0ah>
;;;;;;;;;;;;;;;;;; for delay
; mov eax, 3000
; call delay


call readchar
call CLRSCR

ret
display endp

control_menu proc

cmp level, 1
je l1
cmp level, 2
je l2
cmp level, 3
je l3
l1 :
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov eax, yellow
call settextcolor
mov esi, offset lev_1
add esi, 82
jmp again
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
l2:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov eax, lightgreen
call settextcolor
mov esi, offset lev_2
add esi, 82
jmp again
l3 :
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov eax, red
call settextcolor
mov esi, offset lev_3
add esi, 82
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


again:

mGotoxy 0, 0; goto condion overriding the same string
call crlf
call crlf
call crlf
call crlf
call crlf
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cmp level, 1
je l_1
cmp level, 2
je l_2
cmp level, 3
je l_3

l_1 :
mov edx, offset lev_1
call writestring
jmp next_go
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
l_2:
mov edx, offset lev_2
call writestring
jmp next_go
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
l_3:
mov edx, offset lev_3
call writestring

next_go :

call crlf
call crlf
call crlf
mov eax, Cyan
call settextcolor
mov edx, offset score_str
call writestring
mov eax, white
call settextcolor
mov ax, score
call writedec
call crlf
call crlf
mov eax, Cyan
call settextcolor
mov edx, offset life_str
call writestring
mov eax, white
call settextcolor
mov ax, life
call writedec
call crlf

;;;;;;;;;;;;;;;;;
cmp score, 30
jae won1

; again:
;  mov  dl, row; row
;  mov  dh, col; column
;  call Gotoxy

call readchar

cmp al, 'd'
je d
cmp al, 's'
je s
cmp al, 'w'
je w
cmp al, 'a'
je a
jmp again
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
d:
inc esi
mov al, '.'
cmp[esi], al
;;;;;;;;;;;;;;;;;;;;; checking dot;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
je do_d
mov al, ' '
cmp[esi], al
;;;;;;;;;;;;;;;;;;;;; checking space;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
je do_d
;;;;;;;;;;;;;;;;;;;;; checking mine;;;;;;;;;;;;;;;;;;;;;;;;;
mov al, '•'
cmp[esi], al
je dec_d
;;;;;;;;;;;;;;;;;;;;;; else again;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
dec esi
jmp again
dec_d :
dec esi
jmp mine_1

do_d :
mov al, ' '
cmp[esi], al
je go_d
inc score
go_d :
dec esi
mov al, ' '
mov[esi], al
inc esi
mov al, 'P'
mov[esi], al
jmp again
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
s:

add esi, 51
mov al, '.'
cmp[esi], al
je do_s
mov al, ' '
cmp[esi], al
je do_s
;;;;;;;;;;;;;;;;;;; checking mine;;;;;;;;;;;;;;;;;;;
mov al, '•'
cmp[esi], al
je sub_s
;;;;;;;;;;;;;;;;;;;; else;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sub esi, 51
jmp again
sub_s :
sub esi, 51
jmp mine_1

do_s :
mov al, ' '
cmp[esi], al
je go_s
inc score
go_s :
sub esi, 51
mov al, ' '
mov[esi], al
add esi, 51
mov al, 'P'
mov[esi], al
jmp again

;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
w:
sub esi, 51
mov al, '.'
cmp[esi], al
je do_w
mov al, ' '
cmp[esi], al
je do_w
;;;;;;;;;;;;;;;;;;; checking mine;;;;;;;;;;;;;;;;;;;
mov al, '•'
cmp[esi], al
je add_w
;;;;;;;;;;;;;;;;;;;; else;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
add esi, 51
jmp again
add_w :
add esi, 51
jmp mine_1

do_w :
mov al, ' '
cmp[esi], al
je go_w
inc score
go_w :
add esi, 51
mov al, ' '
mov[esi], al
sub esi, 51
mov al, 'P'
mov[esi], al
jmp again
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
a:

dec esi
mov al, '.'
cmp[esi], al
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; checking dot;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
je do_a
mov al, ' '
cmp[esi], al
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; checking space;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
je do_a
;;;;;;;;;;;;;;;;;;;;; checking mine;;;;;;;;;;;;;;;;;;;;;;;;;
mov al, '•'
cmp[esi], al
je inc_a
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; else again;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
inc esi
jmp again

inc_a :
inc esi
jmp mine_1

do_a :
mov al, ' '
cmp[esi], al
je go_a
inc score
go_a :
inc esi
mov al, ' '
mov[esi], al
dec esi
mov al, 'P'
mov[esi], al
jmp again

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mine_1:
mov al, ' '
mov[esi], al
call mine_proc
won1 :
call won_proc
ret
control_menu endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mine_proc proc
dec life
cmp life, 0
je zero


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cmp level, 1
je l_1
cmp level, 2
je l_2
cmp level, 3
je l_3

l_1 :
mov esi, offset lev_1
add esi, 82
jmp space_
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
l_2:
mov esi, offset lev_2
add esi, 82
jmp space_
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
l_3:
mov esi, offset lev_3
add esi, 82
jmp space_
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
space_:
mov al, 'P'
mov[esi], al
call control_menu
zero :
call loss_proc
ret
mine_proc endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

won_proc proc
call crlf
call crlf
mov eax, LightGreen
call settextcolor
mWrite <"   ***************CONGRATULATIONS******************* ", 0dh, 0ah>
mWrite <"   *  __________________________________________   *", 0dh, 0ah>
mwrite <"   * |                                          |  *", 0dh, 0ah>
mWrite <"   * |           YOU WON THE GAME               |  *", 0dh, 0ah>
mWrite <"   * |__________________________________________|  *", 0dh, 0ah>
mWrite <"   *                                               *", 0dh, 0ah>
mWrite <"   ************************************************* ", 0dh, 0ah>

mov eax, 2000
call delay
call menu_proc
exit
ret
won_proc endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
loss_proc proc
call crlf
call crlf
mov eax, LightGreen
call settextcolor
mWrite <"   *****************TRY AGAIN*********************** ", 0dh, 0ah>
mWrite <"   *  __________________________________________   *", 0dh, 0ah>
mwrite <"   * |                                          |  *", 0dh, 0ah>
mWrite <"   * |           YOU LOSS THE GAME              |  *", 0dh, 0ah>
mWrite <"   * |__________________________________________|  *", 0dh, 0ah>
mWrite <"   *                                               *", 0dh, 0ah>
mWrite <"   ************************************************* ", 0dh, 0ah>
mov eax, 2000
call delay

call menu_proc
ret
loss_proc endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
menu_proc proc

again1 :
mov score, 0
mov life, 3

call clrscr
call crlf
call crlf
call crlf
call crlf

mwrite<"                         1.Play Game", 0dh, 0ah>
call crlf
mwrite<"                         2.Instruction", 0dh, 0ah>
call crlf
mwrite<"                         3.Levels", 0dh, 0ah>
call crlf
mwrite<"                         4.EXIT", 0dh, 0ah>


call crlf
mov al, 0
call readdec

cmp al, 1
je play_1_auto
cmp al, 3
je lev_lab
cmp al, 2
je instruction

cmp al, 4
je exit_lab
jmp again1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
play_1_auto:
mov level, 1
call clrscr
call control_menu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
instruction:
call clrscr
mwrite<"1.  Display a menu on the screen which will guide the user how to move the pacman (up 'W', down 'S', left 'A', right 'D').", 0dh, 0ah>
call crlf
mwrite<"2.  Display a map for pac-man in Which Pac-Man can move. The walls of map is obstacles for Pac-Man. Pac-Man cannot move outside walls.", 0dh, 0ah>
call crlf
mwrite<"3.  Allow the pacman to move on the map as per the instructions you have given in your menu", 0dh, 0ah>
call crlf
mwrite<"4.  Allow the pacman to eat everything (dots '.', mines '•') on the map except Wall .", 0dh, 0ah>
call crlf
mwrite<"5.  So 1 points will be added to the score as as Pac-Man eats a dot. ", 0dh, 0ah>
call crlf
mwrite<"                      _____PRESS 6 TO GOTO TO BACK MENU______", 0dh, 0ah>
mov al, 0
call readdec
cmp al, 6
je again1
jmp instruction
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

lev_lab:
call clrscr
mwrite<"________________________________select the level you want to play_____________________________", 0dh, 0ah>
CALL CRLF
CALL CRLF
CALL CRLF
mwrite<"       press         1. LEVEL 1 ", 0dh, 0ah>
CALL CRLF
mwrite<"       press         2. LEVEL 2 ", 0dh, 0ah>
CALL CRLF
mwrite<"       press         3. LEVEL 3 ", 0dh, 0ah>

CALL CRLF
mov ax, 0
call readdec
cmp ax, 3
ja lev_lab
mov level, ax
call clrscr
call control_menu

exit_lab :
exit
ret
menu_proc endp


END main