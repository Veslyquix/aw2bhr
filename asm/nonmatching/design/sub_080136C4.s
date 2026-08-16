	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080136C4
sub_080136C4: @ 0x080136C4
	movs r1, #0x1f
	ldr r3, _080136D8 @ =gUnknown_0200B5F4
	movs r2, #0
_080136CA:
	adds r0, r1, r3
	strb r2, [r0]
	subs r1, #1
	cmp r1, #0
	bge _080136CA
	bx lr
	.align 2, 0
_080136D8: .4byte gUnknown_0200B5F4

