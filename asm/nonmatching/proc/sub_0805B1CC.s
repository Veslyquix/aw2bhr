	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805B1CC
sub_0805B1CC: @ 0x0805B1CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
	bl sub_0805B4A8
	str r0, [sp, #4]
	mov r0, sp
	adds r0, #8
	str r0, [sp, #0x18]
	mov r2, sp
	adds r2, #0xc
	str r2, [sp, #0x14]
	add r5, sp, #0x10
	mov sl, r5
_0805B1F4:
	ldr r0, [sp, #8]
	adds r0, #1
	str r0, [sp, #8]
	add r0, sp, #4
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x14]
	mov r3, sl
	bl sub_0805B5BC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805B2DC
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	ldr r2, _0805B2BC @ =gUnknown_030046D4
	ldr r2, [r2]
	ldr r3, _0805B2C0 @ =gUnknown_085766E0
	ldr r3, [r3]
	ldrb r3, [r3, #0xf]
	movs r4, #0
	str r4, [sp]
	ldr r5, _0805B2C4 @ =gUnknown_030013EC
	ldr r4, [r5]
	bl _call_via_r4
	bl sub_080585D4
	adds r4, r0, #0
	cmp r4, #0
	beq _0805B1F4
	bl sub_0805848C
	adds r1, r4, #2
	cmp r0, r1
	bge _0805B1F4
	movs r1, #0
	ldr r2, _0805B2C8 @ =gUnknown_08499590
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r1, r0
	bge _0805B2B6
	mov r8, r2
	ldr r0, _0805B2CC @ =gUnknown_03003340
	mov sb, r0
_0805B24C:
	movs r4, #0
	mov r2, r8
	ldr r0, [r2]
	adds r5, r1, #1
	mov ip, r5
	ldrh r0, [r0]
	cmp r4, r0
	bge _0805B2AA
	lsls r0, r1, #2
	mov r2, sb
	adds r7, r0, r2
	ldr r5, _0805B2C8 @ =gUnknown_08499590
	lsls r6, r1, #1
_0805B266:
	ldr r0, [r7]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805B2A0
	ldr r1, [r5]
	ldr r2, _0805B2D0 @ =0x0000417A
	adds r0, r1, r2
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r3, r0, r4
	ldr r2, _0805B2D4 @ =0x00001432
	adds r0, r1, r2
	adds r0, r0, r3
	ldrb r0, [r0]
	movs r2, #0x1f
	ands r2, r0
	cmp r2, #0xd
	beq _0805B294
	cmp r2, #0xb
	bne _0805B2A0
_0805B294:
	ldr r0, _0805B2D8 @ =0x00003C72
	adds r1, r1, r0
	adds r1, r1, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0805B2A0:
	adds r4, #1
	ldr r0, [r5]
	ldrh r0, [r0]
	cmp r4, r0
	blt _0805B266
_0805B2AA:
	mov r1, ip
	mov r2, r8
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r1, r0
	blt _0805B24C
_0805B2B6:
	bl sub_0805B744
	b _0805B1F4
	.align 2, 0
_0805B2BC: .4byte gUnknown_030046D4
_0805B2C0: .4byte gUnknown_085766E0
_0805B2C4: .4byte gUnknown_030013EC
_0805B2C8: .4byte gUnknown_08499590
_0805B2CC: .4byte gUnknown_03003340
_0805B2D0: .4byte 0x0000417A
_0805B2D4: .4byte 0x00001432
_0805B2D8: .4byte 0x00003C72
_0805B2DC:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

