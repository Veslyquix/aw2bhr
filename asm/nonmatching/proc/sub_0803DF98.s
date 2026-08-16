	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803DF98
sub_0803DF98: @ 0x0803DF98
	adds r2, r1, #0
	subs r0, #2
	cmp r0, #6
	bhi _0803DFD8
	lsls r0, r0, #2
	ldr r1, _0803DFAC @ =_0803DFB0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803DFAC: .4byte _0803DFB0
_0803DFB0: @ jump table
	.4byte _0803DFD0 @ case 0
	.4byte _0803DFCC @ case 1
	.4byte _0803DFD8 @ case 2
	.4byte _0803DFCC @ case 3
	.4byte _0803DFD8 @ case 4
	.4byte _0803DFD0 @ case 5
	.4byte _0803DFD0 @ case 6
_0803DFCC:
	movs r0, #1
	b _0803DFDA
_0803DFD0:
	movs r0, #1
	strh r0, [r2]
	movs r0, #2
	b _0803DFDC
_0803DFD8:
	movs r0, #0
_0803DFDA:
	strh r0, [r2]
_0803DFDC:
	strh r0, [r2, #2]
	bx lr

