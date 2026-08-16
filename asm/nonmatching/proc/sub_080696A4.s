	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080696A4
sub_080696A4: @ 0x080696A4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	beq _08069746
	ldrh r0, [r4, #0x2a]
	subs r0, #1
	movs r5, #0
	strh r0, [r4, #0x2a]
	ldrh r0, [r4, #0x30]
	adds r0, #4
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x8f
	ble _080696C8
	strh r5, [r4, #0x30]
_080696C8:
	ldrh r1, [r4, #0x2a]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r4, #0x30]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x11
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #1
	bl sub_08072C40
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	ldrh r0, [r4, #0x32]
	subs r0, #2
	strh r0, [r4, #0x32]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x50
	rsbs r1, r1, #0
	cmp r0, r1
	bgt _080696FC
	strh r5, [r4, #0x32]
_080696FC:
	ldrh r1, [r4, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r4, #0x32]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x11
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl sub_08072C40
	ldrh r1, [r4, #0x2e]
	adds r1, #4
	strh r1, [r4, #0x2e]
	ldrh r0, [r4, #0x34]
	adds r0, #2
	strh r0, [r4, #0x34]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x9f
	ble _0806972C
	strh r5, [r4, #0x2e]
_0806972C:
	ldrh r1, [r4, #0x2e]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r4, #0x34]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x11
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl sub_08072C40
_08069746:
	pop {r4, r5}
	pop {r0}
	bx r0

