	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807BF74
sub_0807BF74: @ 0x0807BF74
	push {lr}
	sub sp, #0x14
	ldr r2, [r0, #0x58]
	ldr r1, _0807BFB0 @ =0xFFFFFF00
	adds r2, r2, r1
	str r2, [r0, #0x58]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	str r0, [sp, #4]
	add r0, sp, #8
	movs r1, #0x50
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	add r0, sp, #0xc
	adds r1, #0xb0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	add r0, sp, #0x10
	strh r2, [r0]
	ldr r1, _0807BFB4 @ =gUnknown_030024D0
	mov r0, sp
	movs r2, #1
	bl BgAffineSet
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_0807BFB0: .4byte 0xFFFFFF00
_0807BFB4: .4byte gUnknown_030024D0

