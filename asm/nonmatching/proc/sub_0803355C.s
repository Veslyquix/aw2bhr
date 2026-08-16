	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803355C
sub_0803355C: @ 0x0803355C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080335C0 @ =gUnknown_0849B018
	ldr r0, [r0]
	ldr r5, _080335C4 @ =gUnknown_030044D8
	movs r1, #0
	strb r1, [r5]
	ldrh r1, [r0, #0x20]
	movs r2, #0
	strh r2, [r0, #0x20]
	ldrh r1, [r0, #0x20]
	ldrh r3, [r0, #0x22]
	strh r1, [r0, #0x22]
	ldrh r1, [r0, #0x2a]
	strh r2, [r0, #0x2a]
	ldrh r1, [r0, #0x2a]
	ldrh r2, [r0, #0x28]
	strh r1, [r0, #0x28]
	ldrh r1, [r0, #0x28]
	ldrh r2, [r0, #0x26]
	strh r1, [r0, #0x26]
	ldrh r1, [r0, #0x26]
	ldrh r2, [r0, #0x24]
	strh r1, [r0, #0x24]
	bl sub_0802F03C
	ldr r0, _080335C8 @ =gUnknown_03004400
	adds r1, r4, #0
	adds r1, #0x28
	ldrb r1, [r1]
	ldrb r2, [r0]
	strb r1, [r0]
	ldrh r2, [r4, #0x2a]
	lsrs r1, r2, #8
	ldrb r3, [r0, #1]
	strb r1, [r0, #1]
	ldrb r1, [r0, #2]
	strb r2, [r0, #2]
	adds r4, #0x2e
	ldrb r1, [r4]
	ldrb r2, [r0, #3]
	strb r1, [r0, #3]
	bl sub_080308B4
	movs r0, #1
	strb r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080335C0: .4byte gUnknown_0849B018
_080335C4: .4byte gUnknown_030044D8
_080335C8: .4byte gUnknown_03004400

