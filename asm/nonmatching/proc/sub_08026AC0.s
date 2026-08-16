	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026AC0
sub_08026AC0: @ 0x08026AC0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r2, r1, #0
	ldr r3, _08026AE4 @ =gUnknown_085C77A0
	ldr r0, _08026AE8 @ =gUnknown_03003FC0
	ldrb r1, [r0, #2]
	movs r0, #0x5c
	muls r0, r1, r0
	subs r0, #1
	adds r1, r5, r0
	adds r0, r3, #0
	adds r0, #0x3c
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08026AEC
	adds r4, r2, #0
	b _08026AF4
	.align 2, 0
_08026AE4: .4byte gUnknown_085C77A0
_08026AE8: .4byte gUnknown_03003FC0
_08026AEC:
	adds r0, r3, #0
	adds r0, #0x40
	adds r0, r1, r0
	ldrb r4, [r0]
_08026AF4:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08026A88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08026B20
	movs r4, #1
	b _08026B08
_08026B06:
	adds r4, #1
_08026B08:
	cmp r4, #4
	bgt _08026B1A
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08026A88
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08026B06
_08026B1A:
	cmp r4, #5
	ble _08026B20
	movs r4, #5
_08026B20:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1

