	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08021D10
sub_08021D10: @ 0x08021D10
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r6, _08021D60 @ =gUnknown_08090978
_08021D16:
	ldr r0, [r6]
	ldr r1, [r0]
	ldrh r2, [r1, #4]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	ldrh r0, [r1, #0xc]
	subs r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r3, [r1, #6]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x14
	ldrh r1, [r1, #0xe]
	subs r1, r3, r1
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	adds r1, r4, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r3, r4, r3
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	bl sub_08023BAC
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #0xf
	ble _08021D16
	bl sub_08013B1C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08021D60: .4byte gUnknown_08090978

