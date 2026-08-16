	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801EE10
sub_0801EE10: @ 0x0801EE10
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	b _0801EE5C
_0801EE16:
	ldr r6, [r5, #4]
	cmp r6, #0
	bge _0801EE2C
	ldr r0, _0801EE28 @ =0x7FFFFFFF
	ands r6, r0
	bl _call_via_r6
	b _0801EE5C
	.align 2, 0
_0801EE28: .4byte 0x7FFFFFFF
_0801EE2C:
	ldr r7, _0801EE78 @ =gUnknown_03002B54
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
	cmp r0, #0
	bne _0801EE5C
	ldrh r0, [r7]
	ldrh r1, [r6]
	adds r0, r0, r1
	strh r0, [r7]
_0801EE5C:
	bl sub_0801A700
	adds r5, r0, #0
	cmp r5, #0
	bne _0801EE16
	ldr r1, _0801EE7C @ =gUnknown_03002510
	movs r0, #0
	str r0, [r1]
	bl sub_0801A6C0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801EE78: .4byte gUnknown_03002B54
_0801EE7C: .4byte gUnknown_03002510

