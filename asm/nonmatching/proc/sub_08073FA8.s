	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08073FA8
sub_08073FA8: @ 0x08073FA8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	adds r4, r6, #0
	adds r4, #0x30
_08073FB2:
	movs r1, #1
	lsls r1, r5
	ldr r0, [r6, #0x2c]
	ands r0, r1
	cmp r0, #0
	beq _08073FE6
	ldrh r1, [r4, #0x10]
	ldrh r0, [r4]
	adds r1, r1, r0
	strh r1, [r4]
	ldrh r2, [r4, #0x12]
	ldrh r0, [r4, #2]
	adds r2, r2, r0
	strh r2, [r4, #2]
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl sub_08072C40
_08073FE6:
	adds r4, #4
	adds r5, #1
	cmp r5, #3
	ble _08073FB2
	pop {r4, r5, r6}
	pop {r0}
	bx r0

