	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08066874
sub_08066874: @ 0x08066874
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r5, #0
	ldr r2, _080668E4 @ =gUnknown_0816E150
	ldr r3, [r2]
	ldr r0, [r3]
	adds r1, r0, #0
	adds r1, #0x25
	ldrb r1, [r1]
	adds r0, #0x32
	strb r1, [r0]
	movs r4, #0
	ldr r0, [r3]
	mov r8, r2
	ldrb r0, [r0, #8]
	cmp r4, r0
	bge _080668CA
	adds r7, r3, #0
	movs r2, #1
	rsbs r2, r2, #0
	ldr r3, _080668E8 @ =gUnknown_03002040
	movs r6, #2
_080668A2:
	ldrh r1, [r3, #4]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080668AE
	adds r5, #1
_080668AE:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r0, #0x70
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r2
	beq _080668EC
	adds r3, #0x14
	adds r4, #1
	ldrb r1, [r1, #8]
	cmp r4, r1
	blt _080668A2
_080668CA:
	mov r0, r8
	ldr r2, [r0]
	ldr r1, [r2]
	ldrb r0, [r1, #8]
	cmp r0, #2
	bne _08066900
	adds r0, r1, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #1
	bne _080668F0
	b _08066904
	.align 2, 0
_080668E4: .4byte gUnknown_0816E150
_080668E8: .4byte gUnknown_03002040
_080668EC:
	movs r5, #0
	b _080668CA
_080668F0:
	ldr r0, _080668FC @ =gUnknown_08580D54
	movs r1, #4
	bl sub_080152EC
	b _08066A0C
	.align 2, 0
_080668FC: .4byte gUnknown_08580D54
_08066900:
	cmp r5, #0
	beq _08066964
_08066904:
	ldr r0, _08066944 @ =gUnknown_08580D0C
	bl sub_0806377C
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	adds r0, #0x26
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08066948 @ =gUnknown_08580AF0
	ldr r4, _0806694C @ =sub_08066200
	adds r1, r4, #0
	bl sub_08063A00
	ldr r0, _08066950 @ =gUnknown_08580B90
	adds r1, r4, #0
	bl sub_08063A00
	ldr r0, _08066954 @ =gUnknown_08580BC8
	adds r1, r4, #0
	bl sub_08063A00
	ldr r0, _08066958 @ =gUnknown_08580A38
	ldr r4, _0806695C @ =sub_08066210
	adds r1, r4, #0
	bl sub_08063A00
	ldr r0, _08066960 @ =gUnknown_08580A08
	adds r1, r4, #0
	bl sub_08063A00
	b _08066A0C
	.align 2, 0
_08066944: .4byte gUnknown_08580D0C
_08066948: .4byte gUnknown_08580AF0
_0806694C: .4byte sub_08066200
_08066950: .4byte gUnknown_08580B90
_08066954: .4byte gUnknown_08580BC8
_08066958: .4byte gUnknown_08580A38
_0806695C: .4byte sub_08066210
_08066960: .4byte gUnknown_08580A08
_08066964:
	movs r4, #0
	ldrb r1, [r1, #8]
	cmp r4, r1
	bge _080669AA
	adds r6, r2, #0
	ldr r5, _08066A18 @ =gUnknown_03002040
_08066970:
	ldr r1, [r6]
	adds r0, r1, #0
	adds r0, #0x70
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0806699E
	ldrh r3, [r5, #2]
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x25
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	bne _08066996
	movs r2, #1
_08066996:
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_080660BC
_0806699E:
	adds r5, #0x14
	adds r4, #1
	ldr r0, [r6]
	ldrb r0, [r0, #8]
	cmp r4, r0
	blt _08066970
_080669AA:
	bl sub_0806666C
	mov r0, r8
	ldr r5, [r0]
	ldr r0, [r5]
	adds r1, r0, #0
	adds r1, #0x25
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, #0x70
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080669D0
	bl sub_08066078
_080669D0:
	movs r4, #0
	ldr r0, [r5]
	ldrb r2, [r0, #8]
	cmp r4, r2
	bge _080669F8
	adds r1, r0, #0
	adds r1, #0x70
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080669F8
_080669E6:
	adds r4, #1
	cmp r4, r2
	bge _080669F8
	adds r0, r1, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080669E6
_080669F8:
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r0, [r0, #8]
	cmp r4, r0
	bne _08066A0C
	ldr r0, _08066A1C @ =gUnknown_08580D54
	movs r1, #4
	bl sub_080152EC
_08066A0C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08066A18: .4byte gUnknown_03002040
_08066A1C: .4byte gUnknown_08580D54

