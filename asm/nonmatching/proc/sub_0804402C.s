	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804402C
sub_0804402C: @ 0x0804402C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r2, _08044070 @ =0xFFFFFE00
	adds r1, r2, #0
	adds r4, r0, #0
	ands r4, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r2, _08044074 @ =0xFFFFFF00
	adds r1, r2, #0
	adds r3, r7, #0
	ands r3, r1
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r1, _08044078 @ =0x000001FF
	ands r1, r0
	adds r2, r7, #0
	subs r2, #0x10
	movs r0, #0xff
	ands r2, r0
	orrs r1, r4
	orrs r2, r3
	ldr r3, _0804407C @ =gUnknown_084A07DA
	str r5, [sp]
	adds r0, r6, #0
	bl sub_0801BEFC
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044070: .4byte 0xFFFFFE00
_08044074: .4byte 0xFFFFFF00
_08044078: .4byte 0x000001FF
_0804407C: .4byte gUnknown_084A07DA

