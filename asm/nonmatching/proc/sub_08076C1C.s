	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08076C1C
sub_08076C1C: @ 0x08076C1C
	push {lr}
	adds r3, r0, #0
	ldr r1, _08076C38 @ =gUnknown_0202FDFC
	ldrb r0, [r1, #0x11]
	cmp r0, #0
	bne _08076C40
	ldr r2, _08076C3C @ =gUnknown_08615194
	ldr r1, [r1, #0xc]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r2, #0x1c
	b _08076C4C
	.align 2, 0
_08076C38: .4byte gUnknown_0202FDFC
_08076C3C: .4byte gUnknown_08615194
_08076C40:
	ldr r2, _08076C60 @ =gUnknown_08615194
	ldr r1, [r1, #0xc]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r2, #0x18
_08076C4C:
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #0
	beq _08076C5A
	adds r1, r3, #0
	bl sub_08078540
_08076C5A:
	pop {r0}
	bx r0
	.align 2, 0
_08076C60: .4byte gUnknown_08615194

