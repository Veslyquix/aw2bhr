	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017704
sub_08017704: @ 0x08017704
	adds r2, r0, #0
	ldr r3, _08017714 @ =gUnknown_0200C420
	ldr r1, [r3]
	cmp r1, r2
	bhs _08017718
	movs r0, #0
	b _0801771C
	.align 2, 0
_08017714: .4byte gUnknown_0200C420
_08017718:
	subs r1, r1, r2
	str r1, [r3]
_0801771C:
	bx lr
	.align 2, 0

