	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067948
sub_08067948: @ 0x08067948
	push {r4, r5, lr}
	sub sp, #0x18
	adds r4, r0, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _08067962
	ldr r1, [r4, #0x38]
	ldr r2, [r4, #0x3c]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x48]
	str r0, [sp]
	movs r0, #4
	b _0806796E
_08067962:
	ldr r1, [r4, #0x38]
	ldr r2, [r4, #0x3c]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x48]
	str r0, [sp]
	movs r0, #1
_0806796E:
	bl Interpolate
	adds r5, r0, #0
	ldr r1, [r4, #0x40]
	ldr r2, [r4, #0x44]
	ldr r3, [r4, #0x54]
	ldr r0, [r4, #0x48]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	ldr r2, [r4, #0x30]
	lsls r1, r2, #8
	str r1, [sp, #4]
	ldr r3, [r4, #0x34]
	lsls r1, r3, #8
	str r1, [sp, #8]
	subs r2, #0x40
	add r1, sp, #0xc
	strh r2, [r1]
	ldr r1, [r4, #0x2c]
	adds r3, r3, r1
	mov r1, sp
	adds r1, #0xe
	strh r3, [r1]
	add r1, sp, #0x10
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	add r0, sp, #0x14
	strh r5, [r0]
	ldr r1, _080679D4 @ =gUnknown_030024D0
	add r0, sp, #4
	movs r2, #1
	bl BgAffineSet
	ldr r1, [r4, #0x54]
	ldr r0, [r4, #0x48]
	cmp r1, r0
	bne _080679C4
	adds r0, r4, #0
	bl Proc_Break
_080679C4:
	ldr r0, [r4, #0x54]
	adds r0, #1
	str r0, [r4, #0x54]
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080679D4: .4byte gUnknown_030024D0

