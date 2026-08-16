	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805E5AC
sub_0805E5AC: @ 0x0805E5AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r5, _0805E6F0 @ =gUnknown_0816DA74
	ldr r0, [r5]
	mov r8, r0
	ldr r1, [r0]
	ldr r4, _0805E6F4 @ =gUnknown_0816DA78
	ldr r0, [r4]
	ldr r3, [r0]
	ldrb r7, [r3, #3]
	lsls r2, r7, #1
	ldr r6, _0805E6F8 @ =0x0000417A
	adds r0, r1, r6
	adds r0, r0, r2
	ldrh r0, [r0]
	ldrb r3, [r3, #2]
	adds r0, r0, r3
	ldr r2, _0805E6FC @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r2, [r1]
	movs r0, #0xe0
	ldr r1, _0805E700 @ =gUnknown_03004084
	ands r0, r2
	adds r6, r5, #0
	mov sl, r4
	ldrh r1, [r1]
	cmp r0, r1
	bne _0805E6E0
	ldr r1, _0805E704 @ =gUnknown_085767B8
	movs r0, #0x1f
	ands r0, r2
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _0805E6E0
	ldr r0, _0805E708 @ =gUnknown_030013EC
	str r1, [sp]
	ldr r4, [r0]
	adds r0, r3, #0
	adds r1, r7, #0
	movs r2, #1
	movs r3, #3
	bl _call_via_r4
	movs r3, #0
	mov r1, r8
	ldr r0, [r1]
	ldrh r0, [r0, #2]
	cmp r3, r0
	bge _0805E6E0
_0805E61A:
	movs r2, #0
	adds r4, r6, #0
	ldr r0, [r6]
	ldr r0, [r0]
	lsls r7, r3, #0x10
	ldrh r0, [r0]
	cmp r2, r0
	bge _0805E6CC
	ldr r1, _0805E70C @ =gUnknown_03003340
	asrs r0, r7, #0x10
	lsls r3, r0, #1
	mov sb, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r8, r0
_0805E638:
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	mov r3, r8
	ldr r1, [r3]
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r5, r0, #0
	cmp r1, #0
	blt _0805E6B6
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r3, _0805E6F8 @ =0x0000417A
	adds r0, r1, r3
	add r0, sb
	ldrh r0, [r0]
	adds r0, r0, r2
	adds r1, #0x12
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805E6B6
	ldr r2, _0805E710 @ =gUnknown_08499594
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, [r2]
	adds r4, r2, r0
	ldr r0, _0805E714 @ =gUnknown_03003F38
	ldrb r0, [r0]
	subs r2, r4, r2
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r2, r1, #4
	adds r1, r1, r2
	lsls r2, r1, #8
	adds r1, r1, r2
	lsls r2, r1, #0x10
	adds r1, r1, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0xe
	asrs r1, r1, #0x10
	bl sub_08026F9C
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805E6B6
	ldrb r0, [r4]
	cmp r0, #1
	bne _0805E6B6
	mov r1, sl
	ldr r0, [r1]
	ldr r1, [r0]
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	str r2, [sp]
	movs r2, #2
	movs r3, #0
	bl sub_0805D648
_0805E6B6:
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r5, r2
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	adds r4, r6, #0
	ldr r1, [r6]
	ldr r1, [r1]
	ldrh r1, [r1]
	cmp r0, r1
	blt _0805E638
_0805E6CC:
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r7, r3
	lsrs r3, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [r6]
	ldr r1, [r1]
	ldrh r1, [r1, #2]
	cmp r0, r1
	blt _0805E61A
_0805E6E0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805E6F0: .4byte gUnknown_0816DA74
_0805E6F4: .4byte gUnknown_0816DA78
_0805E6F8: .4byte 0x0000417A
_0805E6FC: .4byte 0x00001432
_0805E700: .4byte gUnknown_03004084
_0805E704: .4byte gUnknown_085767B8
_0805E708: .4byte gUnknown_030013EC
_0805E70C: .4byte gUnknown_03003340
_0805E710: .4byte gUnknown_08499594
_0805E714: .4byte gUnknown_03003F38

