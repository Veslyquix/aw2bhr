	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807BED8
sub_0807BED8: @ 0x0807BED8
	push {r4, r5, lr}
	sub sp, #0x18
	adds r5, r0, #0
	ldr r3, [r5, #0x34]
	adds r3, #1
	str r3, [r5, #0x34]
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r4, #0x32
	str r4, [sp]
	movs r0, #4
	movs r2, #0x50
	bl Interpolate
	str r0, [r5, #0x2c]
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r3, [r5, #0x34]
	str r4, [sp]
	movs r0, #4
	movs r1, #0x6a
	bl Interpolate
	str r0, [r5, #0x5c]
	movs r1, #0x80
	lsls r1, r1, #4
	movs r2, #0x80
	lsls r2, r2, #2
	ldr r3, [r5, #0x34]
	str r4, [sp]
	movs r0, #5
	bl Interpolate
	ldr r1, [r5, #0x58]
	subs r1, r1, r0
	str r1, [r5, #0x58]
	ldr r0, [r5, #0x34]
	movs r1, #6
	bl DivRem
	cmp r0, #0
	bne _0807BF34
	ldr r1, _0807BF6C @ =gUnknown_03002020
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_0807BF34:
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r1, [r5, #0x2c]
	add r0, sp, #0xc
	strh r1, [r0]
	mov r1, sp
	adds r1, #0xe
	movs r0, #0x50
	strh r0, [r1]
	ldr r1, [r5, #0x5c]
	add r0, sp, #0x10
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	ldr r1, [r5, #0x58]
	add r0, sp, #0x14
	strh r1, [r0]
	ldr r1, _0807BF70 @ =gUnknown_030024D0
	add r0, sp, #4
	movs r2, #1
	bl BgAffineSet
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807BF6C: .4byte gUnknown_03002020
_0807BF70: .4byte gUnknown_030024D0

