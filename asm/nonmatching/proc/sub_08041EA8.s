	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08041EA8
sub_08041EA8: @ 0x08041EA8
	push {r4, r5, lr}
	adds r4, r2, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
	cmp r3, #0
	blt _08041F30
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08041F30
	ldr r0, _08041F1C @ =gUnknown_08499590
	ldr r2, [r0]
	ldrh r0, [r2]
	cmp r3, r0
	bge _08041F30
	ldrh r5, [r2, #2]
	cmp r1, r5
	bge _08041F30
	lsls r1, r1, #1
	ldr r5, _08041F20 @ =0x0000417A
	adds r0, r2, r5
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r1, r0, r3
	adds r0, r2, #0
	adds r0, #0x12
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08041F30
	ldr r0, _08041F24 @ =gUnknown_085D3DD0
	movs r3, #0xaa
	lsls r3, r3, #1
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r5, _08041F28 @ =0x00001432
	adds r0, r2, r5
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #0x1f
	ands r1, r0
	ldr r2, _08041F2C @ =gUnknown_085D5ABC
	movs r0, #0x5c
	muls r0, r4, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0x19]
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r3, r3, r1
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	blt _08041F30
	movs r0, #1
	b _08041F32
	.align 2, 0
_08041F1C: .4byte gUnknown_08499590
_08041F20: .4byte 0x0000417A
_08041F24: .4byte gUnknown_085D3DD0
_08041F28: .4byte 0x00001432
_08041F2C: .4byte gUnknown_085D5ABC
_08041F30:
	movs r0, #0
_08041F32:
	pop {r4, r5}
	pop {r1}
	bx r1

