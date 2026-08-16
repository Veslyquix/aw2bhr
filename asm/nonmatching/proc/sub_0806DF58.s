	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806DF58
sub_0806DF58: @ 0x0806DF58
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r1, _0806DF80 @ =gUnknown_0816E1BC
	ldr r0, [r1]
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #0
	bne _0806DF98
	adds r3, r2, #0
	adds r3, #0x33
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #6
	beq _0806DF88
	ldr r1, _0806DF84 @ =gUnknown_08581F68
	b _0806DF8C
	.align 2, 0
_0806DF80: .4byte gUnknown_0816E1BC
_0806DF84: .4byte gUnknown_08581F68
_0806DF88:
	ldr r1, _0806DF94 @ =gUnknown_08581F74
	ldrb r0, [r2, #2]
_0806DF8C:
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	b _0806DF9A
	.align 2, 0
_0806DF94: .4byte gUnknown_08581F74
_0806DF98:
	ldr r6, _0806DFE8 @ =0x000009DE
_0806DF9A:
	ldr r7, [r4]
	ldr r0, [r7]
	ldrh r0, [r0, #0x2e]
	cmp r6, r0
	beq _0806DFDE
	bl sub_08014878
	ldr r4, _0806DFEC @ =gUnknown_08499578
	ldr r0, [r4]
	movs r5, #2
	str r5, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #3
	movs r2, #0x11
	movs r3, #0x1a
	bl sub_08012BC8
	ldr r2, [r4]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp, #4]
	movs r0, #3
	movs r1, #0x11
	adds r3, r6, #0
	bl sub_08014740
	adds r0, #0x3a
	strb r5, [r0]
	ldr r0, [r7]
	strh r6, [r0, #0x2e]
_0806DFDE:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806DFE8: .4byte 0x000009DE
_0806DFEC: .4byte gUnknown_08499578

