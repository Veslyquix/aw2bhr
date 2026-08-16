	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08066EBC
sub_08066EBC: @ 0x08066EBC
	push {r4, lr}
	ldr r0, _08066F0C @ =gUnknown_03004008
	ldr r4, [r0]
	movs r0, #0x1f
	adds r1, r4, #0
	ands r1, r0
	cmp r1, #0xf
	ble _08066ECE
	subs r1, r0, r1
_08066ECE:
	ldr r3, _08066F10 @ =gPal
	adds r1, #0xa
	lsls r0, r1, #0xa
	lsls r2, r1, #5
	adds r0, r0, r2
	adds r0, r0, r1
	movs r2, #0xa4
	lsls r2, r2, #2
	adds r1, r3, r2
	strh r0, [r1]
	movs r1, #0xf
	lsrs r0, r4, #1
	ands r0, r1
	ldr r1, _08066F14 @ =gUnknown_0817AF18
	adds r0, #0x20
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r2, [r0]
	ldr r4, _08066F18 @ =0x000003B2
	adds r1, r3, r4
	strh r2, [r1]
	ldrh r0, [r0]
	ldr r1, _08066F1C @ =0x000003BE
	adds r3, r3, r1
	strh r0, [r3]
	bl sub_080135A4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08066F0C: .4byte gUnknown_03004008
_08066F10: .4byte gPal
_08066F14: .4byte gUnknown_0817AF18
_08066F18: .4byte 0x000003B2
_08066F1C: .4byte 0x000003BE

