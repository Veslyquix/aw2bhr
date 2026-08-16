	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803A07C
sub_0803A07C: @ 0x0803A07C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r7, _0803A158 @ =gUnknown_0849D89C
	ldr r0, [r7]
	ldr r6, [r0, #4]
	ldrb r4, [r0]
	adds r4, #0x30
	ldr r5, _0803A15C @ =gUnknown_0849DC18
	ldrb r0, [r0, #8]
	bl sub_08042DE0
	subs r0, #1
	ldrb r2, [r6]
	lsls r1, r2, #4
	subs r1, r1, r2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	ldr r2, [r1]
	ldr r3, _0803A160 @ =0x000032E8
	adds r0, r4, #0
	movs r1, #0x39
	bl sub_0801BD00
	ldr r1, _0803A164 @ =gUnknown_0849E224
	ldrb r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r1, [r7]
	ldrb r1, [r1]
	adds r1, #0x3a
	movs r4, #0
	str r4, [sp]
	movs r2, #8
	movs r3, #0
	bl sub_0801F34C
	ldr r0, [r7]
	ldrb r1, [r0]
	adds r1, #0x3a
	str r4, [sp]
	movs r0, #0x23
	movs r2, #0x18
	movs r3, #0
	bl sub_0801F34C
	ldr r0, [r7]
	ldrb r1, [r0]
	adds r1, #0x44
	str r4, [sp]
	movs r0, #6
	movs r2, #0x28
	movs r3, #0
	bl sub_0801F34C
	ldrb r0, [r6, #6]
	lsls r2, r0, #0x19
	lsrs r0, r2, #0x19
	movs r1, #0
	cmp r0, #9
	bhi _0803A0F8
	movs r1, #0xfc
_0803A0F8:
	lsls r0, r1, #0x18
	ldr r1, [r7]
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, #0x58
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsrs r2, r2, #0x19
	movs r1, #0x28
	bl sub_0802BCF0
	ldr r2, _0803A168 @ =gUnknown_085D5ABC
	ldrb r1, [r6]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r2, r0, r2
	ldrb r0, [r2, #0x10]
	movs r1, #0
	cmp r0, #9
	bhi _0803A124
	movs r1, #0xfc
_0803A124:
	lsls r0, r1, #0x18
	ldr r1, [r7]
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, #0x64
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r2, [r2, #0x10]
	movs r1, #0x30
	bl sub_0802BCF0
	ldr r0, [r7]
	ldrb r0, [r0]
	adds r0, #0x5b
	ldr r2, _0803A16C @ =gUnknown_0849D8A0
	ldr r3, _0803A170 @ =0x000013CA
	movs r1, #0x2c
	bl sub_0801BD00
	bl sub_0803AB3C
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803A158: .4byte gUnknown_0849D89C
_0803A15C: .4byte gUnknown_0849DC18
_0803A160: .4byte 0x000032E8
_0803A164: .4byte gUnknown_0849E224
_0803A168: .4byte gUnknown_085D5ABC
_0803A16C: .4byte gUnknown_0849D8A0
_0803A170: .4byte 0x000013CA

