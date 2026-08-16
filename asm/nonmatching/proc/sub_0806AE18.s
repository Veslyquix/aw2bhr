	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806AE18
sub_0806AE18: @ 0x0806AE18
	push {lr}
	adds r3, r0, #0
	ldr r2, _0806AE3C @ =gUnknown_0858178C
	ldr r1, [r3, #0x2c]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, [r3, #0x30]
	movs r2, #0xd8
	lsls r2, r2, #6
	adds r1, r1, r2
	bl sub_08011CAC
	pop {r0}
	bx r0
	.align 2, 0
_0806AE3C: .4byte gUnknown_0858178C

