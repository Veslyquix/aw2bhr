	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08059AEC
sub_08059AEC: @ 0x08059AEC
	push {r4, r5, r6, lr}
	ldr r5, _08059B10 @ =gUnknown_030033EC
	ldrh r0, [r5]
	ldr r4, _08059B14 @ =gUnknown_030040D8
	ldr r1, [r4]
	ldrb r1, [r1]
	bl sub_08042D50
	cmp r0, #1
	ble _08059B18
	ldrh r0, [r5]
	ldr r1, [r4]
	ldrb r1, [r1]
	bl sub_08042D50
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _08059B26
	.align 2, 0
_08059B10: .4byte gUnknown_030033EC
_08059B14: .4byte gUnknown_030040D8
_08059B18:
	ldr r2, _08059B48 @ =gUnknown_085D5ABC
	ldr r0, [r4]
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r6, [r0, #0xe]
_08059B26:
	movs r4, #0
	cmp r4, r6
	bge _08059B42
	movs r5, #0xf2
	lsls r5, r5, #0x17
_08059B30:
	lsrs r0, r5, #0x18
	bl sub_0801FD9C
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r5, r5, r0
	adds r4, #1
	cmp r4, r6
	blt _08059B30
_08059B42:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08059B48: .4byte gUnknown_085D5ABC

