	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805A5E0
sub_0805A5E0: @ 0x0805A5E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	ldr r0, _0805A6BC @ =0x00007FFF
	mov ip, r0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7]
	ldr r1, _0805A6C0 @ =gUnknown_0816D998
	ldr r0, [r1]
	ldrh r4, [r0]
	adds r0, r4, #0
	adds r0, #0x40
	cmp r4, r0
	bge _0805A6AE
	ldr r0, _0805A6C4 @ =gUnknown_08499594
	ldr r0, [r0]
	ldr r1, _0805A6C8 @ =gUnknown_084995A8
	mov sl, r1
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r2, r1, r0
	adds r6, r2, #0
	ldr r3, _0805A6CC @ =gUnknown_030040D8
	mov sb, r3
	ldr r0, _0805A6D0 @ =gUnknown_03003340
	mov r8, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r5, r0, #0
_0805A630:
	ldrb r0, [r2]
	cmp r0, #0
	beq _0805A69C
	adds r3, r0, #0
	mov r1, sl
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805A69C
	ldrb r1, [r2, #1]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0805A69C
	ldrb r1, [r2, #9]
	movs r0, #7
	ands r0, r1
	cmp r0, #1
	bne _0805A69C
	mov r1, sb
	ldr r0, [r1]
	cmp r6, r0
	beq _0805A69C
	ldrb r0, [r2, #3]
	lsls r0, r0, #2
	add r0, r8
	ldrb r1, [r2, #2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805A69C
	ldr r0, _0805A6D4 @ =gUnknown_08576828
	adds r0, r3, r0
	ldrb r0, [r0]
	movs r1, #5
	subs r1, r1, r0
	lsls r1, r1, #0x14
	lsrs r1, r1, #0x10
	ldrb r0, [r2, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	adds r0, r0, r1
	lsls r1, r0, #0x10
	mov r3, ip
	lsls r0, r3, #0x10
	cmp r1, r0
	bge _0805A69C
	asrs r0, r5, #2
	str r0, [r7]
	lsrs r1, r1, #0x10
	mov ip, r1
_0805A69C:
	adds r5, #4
	adds r2, #0xc
	adds r6, #0xc
	adds r4, #1
	ldr r0, _0805A6D8 @ =gUnknown_03003F2C
	ldrh r0, [r0]
	adds r0, #0x40
	cmp r4, r0
	blt _0805A630
_0805A6AE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A6BC: .4byte 0x00007FFF
_0805A6C0: .4byte gUnknown_0816D998
_0805A6C4: .4byte gUnknown_08499594
_0805A6C8: .4byte gUnknown_084995A8
_0805A6CC: .4byte gUnknown_030040D8
_0805A6D0: .4byte gUnknown_03003340
_0805A6D4: .4byte gUnknown_08576828
_0805A6D8: .4byte gUnknown_03003F2C

