	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08084974
sub_08084974: @ 0x08084974
	push {lr}
	ldr r2, _080849B8 @ =gUnknown_030030CC
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	bl sub_0801A5B0
	movs r0, #0xca
	lsls r0, r0, #4
	movs r1, #0
	movs r2, #0
	bl sub_08019818
	pop {r0}
	bx r0
	.align 2, 0
_080849B8: .4byte gUnknown_030030CC

