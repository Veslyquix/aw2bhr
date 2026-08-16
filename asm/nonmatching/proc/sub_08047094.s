	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08047094
sub_08047094: @ 0x08047094
	push {r4, r5, lr}
	movs r1, #0
	ldr r5, _080470D4 @ =gUnknown_08499578
	movs r4, #0
	ldr r3, _080470D8 @ =0x000003FF
_0804709E:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	ldr r2, [r5]
	lsls r1, r0, #1
	adds r1, r1, r2
	strh r4, [r1]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r3
	ble _0804709E
	bl sub_08013AEC
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_0801A538
	bl sub_08022580
	bl sub_080227A8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080470D4: .4byte gUnknown_08499578
_080470D8: .4byte 0x000003FF

