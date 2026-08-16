	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806778C
sub_0806778C: @ 0x0806778C
	push {lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x5c]
	cmp r0, #0
	beq _080677B8
	ldr r1, [r3, #0x2c]
	ldr r0, [r3, #0x34]
	adds r1, r1, r0
	str r1, [r3, #0x2c]
	ldr r2, [r3, #0x30]
	ldr r0, [r3, #0x38]
	adds r2, r2, r0
	str r2, [r3, #0x30]
	ldr r0, [r3, #0x58]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl sub_08072C40
_080677B8:
	pop {r0}
	bx r0

