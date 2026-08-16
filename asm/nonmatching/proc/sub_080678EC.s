	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080678EC
sub_080678EC: @ 0x080678EC
	push {lr}
	sub sp, #0x14
	ldr r2, [r0, #0x30]
	lsls r1, r2, #8
	str r1, [sp]
	ldr r3, [r0, #0x34]
	lsls r1, r3, #8
	str r1, [sp, #4]
	subs r2, #0x40
	add r1, sp, #8
	strh r2, [r1]
	ldr r1, [r0, #0x2c]
	adds r3, r3, r1
	mov r1, sp
	adds r1, #0xa
	strh r3, [r1]
	ldr r2, [r0, #0x40]
	add r1, sp, #0xc
	strh r2, [r1]
	adds r1, #2
	strh r2, [r1]
	ldr r1, [r0, #0x38]
	add r0, sp, #0x10
	strh r1, [r0]
	ldr r1, _0806792C @ =gUnknown_030024D0
	mov r0, sp
	movs r2, #1
	bl BgAffineSet
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_0806792C: .4byte gUnknown_030024D0

