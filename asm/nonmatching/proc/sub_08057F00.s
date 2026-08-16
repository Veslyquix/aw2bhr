	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08057F00
sub_08057F00: @ 0x08057F00
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r0, _08057F48 @ =gUnknown_03003F2C
	ldrh r2, [r0]
	adds r3, r2, #0
	adds r3, #0x40
	cmp r2, r3
	bge _08057F3E
	ldr r0, _08057F4C @ =gUnknown_08499594
	ldr r1, [r0]
	ldr r7, _08057F50 @ =gUnknown_085D5ABC
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r1
	movs r6, #0x5c
	subs r2, r3, r2
_08057F24:
	ldrb r0, [r1]
	cmp r0, #0
	beq _08057F36
	muls r0, r6, r0
	adds r0, r0, r7
	ldrb r0, [r0, #0x1b]
	cmp r0, r5
	bne _08057F36
	adds r4, #1
_08057F36:
	adds r1, #0xc
	subs r2, #1
	cmp r2, #0
	bne _08057F24
_08057F3E:
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08057F48: .4byte gUnknown_03003F2C
_08057F4C: .4byte gUnknown_08499594
_08057F50: .4byte gUnknown_085D5ABC

