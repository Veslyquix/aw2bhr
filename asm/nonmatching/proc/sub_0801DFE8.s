	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801DFE8
sub_0801DFE8: @ 0x0801DFE8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	bl sub_0801A700
	adds r5, r0, #0
	cmp r5, #0
	beq _0801E08E
	ldr r7, _0801E018 @ =gUnknown_03002B54
_0801DFF8:
	ldr r6, [r5, #4]
	movs r1, #0xc0
	lsls r1, r1, #0x18
	ands r1, r6
	ldr r0, _0801E01C @ =0x3FFFFFFF
	ands r6, r0
	cmp r1, #0
	beq _0801E02A
	cmp r1, #0
	bgt _0801E020
	movs r0, #0x80
	lsls r0, r0, #0x18
	cmp r1, r0
	beq _0801E066
	b _0801E07C
	.align 2, 0
_0801E018: .4byte gUnknown_03002B54
_0801E01C: .4byte 0x3FFFFFFF
_0801E020:
	movs r0, #0x80
	lsls r0, r0, #0x17
	cmp r1, r0
	beq _0801E04E
	b _0801E07C
_0801E02A:
	ldrh r0, [r7]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0
	ldrsh r1, [r5, r2]
	movs r3, #2
	ldrsh r2, [r5, r3]
	ldr r3, [r5, #0xc]
	ldr r4, [r5, #0x10]
	str r3, [sp]
	str r4, [sp, #4]
	movs r4, #0xa
	ldrsh r3, [r5, r4]
	str r3, [sp, #8]
	adds r3, r6, #0
	bl sub_0801E9B0
	b _0801E07C
_0801E04E:
	ldrh r0, [r7]
	movs r2, #0
	ldrsh r1, [r5, r2]
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r4, #8
	ldrsh r3, [r5, r4]
	str r3, [sp]
	adds r3, r6, #0
	bl sub_0801E3E8
	b _0801E07C
_0801E066:
	ldrh r0, [r7]
	movs r2, #0
	ldrsh r1, [r5, r2]
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r4, #8
	ldrsh r3, [r5, r4]
	str r3, [sp]
	adds r3, r6, #0
	bl sub_0801E508
_0801E07C:
	ldrh r0, [r7]
	ldrh r1, [r6]
	adds r0, r0, r1
	strh r0, [r7]
	bl sub_0801A700
	adds r5, r0, #0
	cmp r5, #0
	bne _0801DFF8
_0801E08E:
	ldr r1, _0801E0A0 @ =gUnknown_03002510
	movs r0, #0
	str r0, [r1]
	bl sub_0801A6C0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E0A0: .4byte gUnknown_03002510

