	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08087220
sub_08087220: @ 0x08087220
	push {lr}
	sub sp, #4
	adds r2, r1, #0
	movs r1, #0xff
	lsls r1, r1, #1
	lsls r0, r0, #4
	adds r2, r2, r0
	ldr r3, _08087240 @ =gUnknown_08615C4E
	ldr r0, _08087244 @ =0x00005470
	str r0, [sp]
	movs r0, #1
	bl sub_0801BEBC
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08087240: .4byte gUnknown_08615C4E
_08087244: .4byte 0x00005470

