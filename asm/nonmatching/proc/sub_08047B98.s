	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08047B98
sub_08047B98: @ 0x08047B98
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldrb r1, [r6, #0x1e]
	bl sub_08047190
	ldr r5, _08047C00 @ =gUnknown_08499578
	ldr r0, [r5]
	movs r1, #2
	str r1, [sp]
	movs r4, #0
	str r4, [sp, #4]
	movs r1, #0xf
	movs r2, #1
	movs r3, #1
	bl sub_08012BC8
	ldr r0, [r5]
	movs r1, #0xc
	str r1, [sp]
	str r4, [sp, #4]
	movs r1, #1
	movs r2, #7
	movs r3, #0x1c
	bl sub_08012BC8
	ldr r2, [r5]
	adds r0, r2, #0
	adds r0, #0x6e
	strh r4, [r0]
	adds r0, #0x40
	strh r4, [r0]
	ldrb r3, [r6, #0x1f]
	adds r3, #1
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x18
	movs r1, #1
	bl sub_08014B0C
	adds r0, r6, #0
	bl sub_08047920
	bl sub_08013AEC
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08047C00: .4byte gUnknown_08499578

