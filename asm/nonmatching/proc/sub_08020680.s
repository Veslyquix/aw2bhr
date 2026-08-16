	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08020680
sub_08020680: @ 0x08020680
	ldr r1, _08020694 @ =_08020698
_08020682:
	ldrb r0, [r2]
	adds r2, #1
	cmp r0, #4
	bhi _08020682
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08020694: .4byte _08020698
_08020698: @ jump table
	.4byte _08020682 @ case 0
	.4byte _08020682 @ case 1
	.4byte _08020682 @ case 2
	.4byte _08020682 @ case 3
	.4byte _080206AC @ case 4
_080206AC:
	bx lr
	.align 2, 0

