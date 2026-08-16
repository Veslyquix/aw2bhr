	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035E24
sub_08035E24: @ 0x08035E24
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x1e
	ldrsh r1, [r4, r0]
	ldr r0, _08035E60 @ =0x0000027F
	cmp r1, r0
	ble _08035E36
	movs r0, #0
	str r0, [r4, #8]
_08035E36:
	ldrh r2, [r4, #0x1e]
	adds r2, #0x14
	strh r2, [r4, #0x1e]
	ldr r0, _08035E64 @ =gUnknown_03005BA0
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #1
	bl sub_08071488
	ldr r0, _08035E68 @ =gUnknown_030059E0
	ldrh r2, [r4, #0x1e]
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r1, #1
	bl sub_08071488
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035E60: .4byte 0x0000027F
_08035E64: .4byte gUnknown_03005BA0
_08035E68: .4byte gUnknown_030059E0

