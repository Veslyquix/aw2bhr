	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08057F54
sub_08057F54: @ 0x08057F54
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r0, _08057F9C @ =gUnknown_03003F2C
	ldrh r2, [r0]
	adds r3, r2, #0
	adds r3, #0x40
	cmp r2, r3
	bge _08057F94
	ldr r0, _08057FA0 @ =gUnknown_08499594
	ldr r1, [r0]
	ldr r7, _08057FA4 @ =gUnknown_085D5ABC
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r1
	movs r6, #0x5c
	subs r2, r3, r2
_08057F78:
	ldrb r0, [r1]
	cmp r0, #0
	beq _08057F8C
	muls r0, r6, r0
	adds r0, r0, r7
	ldrb r0, [r0, #0x1a]
	ands r0, r5
	cmp r0, #0
	beq _08057F8C
	adds r4, #1
_08057F8C:
	adds r1, #0xc
	subs r2, #1
	cmp r2, #0
	bne _08057F78
_08057F94:
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08057F9C: .4byte gUnknown_03003F2C
_08057FA0: .4byte gUnknown_08499594
_08057FA4: .4byte gUnknown_085D5ABC

