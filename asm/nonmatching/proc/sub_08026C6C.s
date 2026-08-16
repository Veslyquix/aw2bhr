	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026C6C
sub_08026C6C: @ 0x08026C6C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	subs r0, #6
	cmp r0, #0xe
	bhi _08026CCC
	lsls r0, r0, #2
	ldr r1, _08026C80 @ =_08026C84
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08026C80: .4byte _08026C84
_08026C84: @ jump table
	.4byte _08026CC0 @ case 0
	.4byte _08026CCC @ case 1
	.4byte _08026CC0 @ case 2
	.4byte _08026CCC @ case 3
	.4byte _08026CC0 @ case 4
	.4byte _08026CC0 @ case 5
	.4byte _08026CCC @ case 6
	.4byte _08026CCC @ case 7
	.4byte _08026CC0 @ case 8
	.4byte _08026CCC @ case 9
	.4byte _08026CCC @ case 10
	.4byte _08026CCC @ case 11
	.4byte _08026CCC @ case 12
	.4byte _08026CCC @ case 13
	.4byte _08026CC0 @ case 14
_08026CC0:
	ldr r0, _08026CC8 @ =gUnknown_03003FC0
	ldr r0, [r0, #0x28]
	b _08026CCE
	.align 2, 0
_08026CC8: .4byte gUnknown_03003FC0
_08026CCC:
	movs r0, #0
_08026CCE:
	bx lr

