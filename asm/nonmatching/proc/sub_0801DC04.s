	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801DC04
sub_0801DC04: @ 0x0801DC04
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r3, #0
	ldr r7, _0801DC34 @ =gUnknown_0200E440
	lsls r4, r1, #0x10
	lsls r5, r2, #0x10
_0801DC10:
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x4c
	muls r0, r1, r0
	adds r0, r0, r7
	ldr r0, [r0]
	cmp r0, #0
	bne _0801DC38
	adds r0, r1, #0
	adds r1, r6, #0
	asrs r2, r4, #0x10
	asrs r3, r5, #0x10
	bl sub_0801DC50
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	b _0801DC48
	.align 2, 0
_0801DC34: .4byte gUnknown_0200E440
_0801DC38:
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1e
	ble _0801DC10
	movs r0, #1
	rsbs r0, r0, #0
_0801DC48:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

