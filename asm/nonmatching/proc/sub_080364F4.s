	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080364F4
sub_080364F4: @ 0x080364F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	bl sub_080191B0
	ldr r0, _08036584 @ =gUnknown_08090EBC
	ldr r2, [r0]
	ldrb r1, [r2, #1]
	cmp r1, #0
	beq _080365AA
	ldr r0, _08036588 @ =gUnknown_08090EC0
	mov sl, r0
	cmp r1, #0
	blt _080365D2
	cmp r1, #2
	bgt _080365D2
	movs r4, #0
	mov ip, r2
	mov r1, sl
	ldr r6, [r1]
	movs r5, #0x5c
	movs r2, #0x3c
	adds r2, r2, r6
	mov r8, r2
	mov r7, ip
	adds r7, #0x3d
	ldr r0, _0803658C @ =gUnknown_030058D4
	mov sb, r0
_08036530:
	adds r3, r4, #1
	mov r2, ip
	adds r2, #0x42
	adds r2, r3, r2
	mov r1, ip
	ldrb r0, [r1, #2]
	muls r0, r5, r0
	adds r0, r4, r0
	adds r1, r6, #0
	adds r1, #0x44
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	mov r2, ip
	adds r2, #0x33
	adds r2, r3, r2
	mov r1, ip
	ldrb r0, [r1, #2]
	muls r0, r5, r0
	adds r0, r4, r0
	adds r1, r6, #0
	adds r1, #0x40
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	mov r2, ip
	ldrb r0, [r2, #2]
	muls r0, r5, r0
	adds r0, r4, r0
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _08036590
	cmp r3, #3
	bgt _08036590
	adds r0, r3, r7
	mov r2, sb
	adds r1, r4, r2
	ldrb r1, [r1]
	strb r1, [r0]
	b _080365A0
	.align 2, 0
_08036584: .4byte gUnknown_08090EBC
_08036588: .4byte gUnknown_08090EC0
_0803658C: .4byte gUnknown_030058D4
_08036590:
	adds r1, r3, r7
	mov r2, ip
	ldrb r0, [r2, #2]
	muls r0, r5, r0
	adds r0, r4, r0
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r1]
_080365A0:
	lsls r0, r3, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	bls _08036530
	b _080365D2
_080365AA:
	movs r4, #0
	ldr r0, _080365FC @ =gUnknown_08090EC0
	mov sl, r0
	adds r3, r2, #0
	adds r7, r3, #0
	adds r7, #0x3d
	ldr r6, _08036600 @ =gUnknown_085C77DC
	movs r5, #0x5c
_080365BA:
	adds r1, r4, #1
	adds r2, r1, r7
	ldrb r0, [r3, #2]
	muls r0, r5, r0
	adds r0, r4, r0
	adds r0, r0, r6
	ldrb r0, [r0]
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	cmp r4, #3
	bls _080365BA
_080365D2:
	mov r1, sl
	ldr r3, [r1]
	ldr r0, _08036604 @ =gUnknown_03003FC0
	ldrb r1, [r0, #2]
	movs r0, #0x5c
	muls r1, r0, r1
	adds r0, r3, #0
	adds r0, #0xc
	adds r0, r1, r0
	ldr r2, [r0]
	cmp r2, #0
	beq _08036608
	adds r0, r1, r3
	ldrh r0, [r0, #0x1a]
	cmp r0, #2
	bhi _08036608
	adds r0, r2, #0
	bl sub_080193B0
	b _0803660C
	.align 2, 0
_080365FC: .4byte gUnknown_08090EC0
_08036600: .4byte gUnknown_085C77DC
_08036604: .4byte gUnknown_03003FC0
_08036608:
	bl sub_080364E0
_0803660C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

