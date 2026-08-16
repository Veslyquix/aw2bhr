	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807821C
sub_0807821C: @ 0x0807821C
	ldr r2, _08078234 @ =gUnknown_08615194
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #4
	adds r1, r1, r2
	ldrb r1, [r1, #2]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08078238
	movs r0, #0
	b _0807823A
	.align 2, 0
_08078234: .4byte gUnknown_08615194
_08078238:
	movs r0, #1
_0807823A:
	bx lr

