	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080760B4
sub_080760B4: @ 0x080760B4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0801F114
	ldr r0, _08076108 @ =gUnknown_03002B6C
	ldr r1, [r0]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	movs r0, #1
	movs r2, #0x29
	movs r3, #1
	bl sub_0801F150
	movs r0, #0x3e
	bl sub_0801F234
	movs r0, #0x3f
	bl sub_0801F234
	movs r0, #0x40
	bl sub_0801F234
	movs r0, #0x41
	bl sub_0801F234
	movs r0, #0x42
	bl sub_0801F234
	movs r1, #0
	str r1, [r4, #0x40]
	adds r2, r4, #0
	adds r2, #0x3a
	movs r0, #1
	strb r0, [r2]
	str r1, [r4, #0x3c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076108: .4byte gUnknown_03002B6C

