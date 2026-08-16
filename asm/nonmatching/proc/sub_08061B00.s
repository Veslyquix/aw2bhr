	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08061B00
sub_08061B00: @ 0x08061B00
	push {lr}
	ldr r0, _08061B20 @ =gUnknown_03003FC0
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _08061B2C
	ldr r3, _08061B24 @ =gUnknown_085766E8
	ldr r2, _08061B28 @ =gUnknown_03004770
	ldr r0, [r2]
	lsls r1, r0, #2
	adds r1, r1, r3
	adds r0, #1
	str r0, [r2]
	ldr r0, [r1]
	bl _call_via_r0
	b _08061B40
	.align 2, 0
_08061B20: .4byte gUnknown_03003FC0
_08061B24: .4byte gUnknown_085766E8
_08061B28: .4byte gUnknown_03004770
_08061B2C:
	ldr r3, _08061B44 @ =gUnknown_08576738
	ldr r2, _08061B48 @ =gUnknown_03004770
	ldr r0, [r2]
	lsls r1, r0, #2
	adds r1, r1, r3
	adds r0, #1
	str r0, [r2]
	ldr r0, [r1]
	bl _call_via_r0
_08061B40:
	pop {r0}
	bx r0
	.align 2, 0
_08061B44: .4byte gUnknown_08576738
_08061B48: .4byte gUnknown_03004770

