	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080573F0
sub_080573F0: @ 0x080573F0
	push {r4, lr}
	ldr r2, _08057418 @ =gUnknown_030030A4
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	movs r4, #0x10
	orrs r0, r4
	movs r3, #0x20
	orrs r0, r3
	strb r0, [r2]
	ldrb r0, [r2, #1]
	movs r1, #8
	orrs r0, r1
	orrs r0, r4
	orrs r0, r3
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057418: .4byte gUnknown_030030A4

