	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08027428
sub_08027428: @ 0x08027428
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08027460 @ =gUnknown_08112614
	movs r1, #1
	movs r2, #1
	bl sub_0801C210
	str r0, [r4, #0x50]
	ldr r1, _08027464 @ =0x000031CA
	strh r1, [r0, #0x22]
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x54]
	ldr r3, [r4, #0x50]
	bl sub_08027560
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	adds r4, #0x44
	ldr r0, _08027468 @ =0x0000FFFF
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027460: .4byte gUnknown_08112614
_08027464: .4byte 0x000031CA
_08027468: .4byte 0x0000FFFF

