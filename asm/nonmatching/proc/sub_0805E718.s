	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805E718
sub_0805E718: @ 0x0805E718
	push {r4, lr}
	sub sp, #4
	bl sub_08062474
	bl sub_08058744
	bl sub_080587FC
	cmp r0, #0
	beq _0805E770
	bl sub_0805878C
	adds r1, r0, #0
	cmp r1, #0
	beq _0805E770
	ldrh r2, [r1]
	movs r4, #0xff
	lsls r4, r4, #8
	ands r4, r2
	cmp r4, #0
	bne _0805E758
	movs r3, #4
	ldrsh r0, [r1, r3]
	movs r3, #6
	ldrsh r1, [r1, r3]
	lsls r3, r2, #0x18
	lsrs r3, r3, #0x18
	str r4, [sp]
	movs r2, #4
	bl sub_0805D648
	b _0805E770
_0805E758:
	movs r3, #4
	ldrsh r0, [r1, r3]
	movs r3, #6
	ldrsh r1, [r1, r3]
	lsls r3, r2, #0x10
	lsrs r3, r3, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #5
	bl sub_0805D648
_0805E770:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

