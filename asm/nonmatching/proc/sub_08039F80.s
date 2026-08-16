	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039F80
sub_08039F80: @ 0x08039F80
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r4, _0803A068 @ =gUnknown_0849D89C
	ldr r1, [r4]
	ldr r5, [r1, #4]
	ldr r7, _0803A06C @ =gUnknown_085D5ABC
	ldrb r0, [r5]
	movs r6, #0x5c
	muls r0, r6, r0
	adds r0, r0, r7
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	beq _0803A05C
	ldrh r0, [r5, #4]
	lsls r2, r0, #0x15
	lsrs r0, r2, #0x1c
	movs r3, #0
	cmp r0, #9
	bhi _08039FAC
	movs r3, #0xfc
_08039FAC:
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	adds r0, #0x40
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsrs r2, r2, #0x1c
	movs r1, #0x38
	bl sub_0802BCF0
	ldrb r0, [r5]
	muls r0, r6, r0
	adds r2, r0, r7
	ldrb r0, [r2, #0xb]
	movs r3, #0
	cmp r0, #9
	bhi _08039FD2
	movs r3, #0xfc
_08039FD2:
	ldr r1, [r4]
	lsls r0, r3, #0x18
	asrs r0, r0, #0x18
	adds r0, #0x49
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r2, [r2, #0xb]
	movs r1, #0x40
	bl sub_0802BCF0
	ldr r0, [r4]
	ldrb r0, [r0]
	adds r0, #0x41
	ldr r1, _0803A070 @ =gUnknown_0849D8A0
	mov r8, r1
	ldr r3, _0803A074 @ =0x000013CA
	movs r1, #0x3c
	mov r2, r8
	bl sub_0801BD00
	ldr r0, [r4]
	ldrb r0, [r0, #8]
	ldrb r1, [r5]
	bl sub_08042D50
	cmp r0, #1
	ble _0803A05C
	ldr r0, [r4]
	ldrb r1, [r0]
	adds r1, #0x4c
	movs r0, #0
	str r0, [sp]
	movs r0, #0x3b
	movs r2, #0x38
	movs r3, #0
	bl sub_0801F34C
	ldr r0, [r4]
	ldrb r0, [r0]
	adds r0, #0x50
	ldrb r1, [r5]
	muls r1, r6, r1
	adds r1, r1, r7
	ldrb r2, [r1, #0xe]
	movs r1, #0x40
	bl sub_0802BCF0
	ldr r0, [r4]
	ldrb r0, [r0]
	adds r0, #0x58
	ldr r3, _0803A078 @ =0x000013CB
	movs r1, #0x41
	mov r2, r8
	bl sub_0801BD00
	ldr r0, [r4]
	ldrb r4, [r0]
	adds r4, #0x60
	ldrb r0, [r0, #8]
	ldrb r1, [r5]
	bl sub_08042D50
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0x40
	bl sub_0802BCF0
_0803A05C:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803A068: .4byte gUnknown_0849D89C
_0803A06C: .4byte gUnknown_085D5ABC
_0803A070: .4byte gUnknown_0849D8A0
_0803A074: .4byte 0x000013CA
_0803A078: .4byte 0x000013CB

