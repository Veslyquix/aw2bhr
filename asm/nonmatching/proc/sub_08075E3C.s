	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08075E3C
sub_08075E3C: @ 0x08075E3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	bl sub_08075904
	ldr r0, _08075E60 @ =gUnknown_08614280
	ldr r0, [r0]
	ldr r1, _08075E64 @ =0x0600F000
	movs r2, #0x80
	lsls r2, r2, #5
	bl sub_08011E54
	ldr r0, [r4, #0x54]
	bl sub_0801C240
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08075E60: .4byte gUnknown_08614280
_08075E64: .4byte 0x0600F000

