	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805B0AC
sub_0805B0AC: @ 0x0805B0AC
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
_0805B0D4:
	ldr r0, [sp, #8]
	adds r0, #1
	str r0, [sp, #8]
	add r0, sp, #4
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x14]
	mov r3, sl
	bl sub_0805B6A0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805B1BC
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	ldr r2, _0805B19C @ =gUnknown_030046D4
	ldr r2, [r2]
	ldr r3, _0805B1A0 @ =gUnknown_085766E0
	ldr r3, [r3]
	ldrb r3, [r3, #0xf]
	movs r4, #0
	str r4, [sp]
	ldr r5, _0805B1A4 @ =gUnknown_030013EC
	ldr r4, [r5]
	bl _call_via_r4
	bl sub_080583DC
	adds r4, r0, #0
	cmp r4, #0
	beq _0805B0D4
	bl sub_08058254
	adds r1, r4, #5
	cmp r0, r1
	bge _0805B0D4
	movs r1, #0
	ldr r2, _0805B1A8 @ =gUnknown_08499590
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r1, r0
	bge _0805B196
	mov r8, r2
	ldr r0, _0805B1AC @ =gUnknown_03003340
	mov sb, r0
_0805B12C:
	movs r4, #0
	mov r2, r8
	ldr r0, [r2]
	adds r5, r1, #1
	mov ip, r5
	ldrh r0, [r0]
	cmp r4, r0
	bge _0805B18A
	lsls r0, r1, #2
	mov r2, sb
	adds r7, r0, r2
	ldr r5, _0805B1A8 @ =gUnknown_08499590
	lsls r6, r1, #1
_0805B146:
	ldr r0, [r7]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805B180
	ldr r1, [r5]
	ldr r2, _0805B1B0 @ =0x0000417A
	adds r0, r1, r2
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r3, r0, r4
	ldr r2, _0805B1B4 @ =0x00001432
	adds r0, r1, r2
	adds r0, r0, r3
	ldrb r0, [r0]
	movs r2, #0x1f
	ands r2, r0
	cmp r2, #0xd
	beq _0805B174
	cmp r2, #0xb
	bne _0805B180
_0805B174:
	ldr r0, _0805B1B8 @ =0x00003C72
	adds r1, r1, r0
	adds r1, r1, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0805B180:
	adds r4, #1
	ldr r0, [r5]
	ldrh r0, [r0]
	cmp r4, r0
	blt _0805B146
_0805B18A:
	mov r1, ip
	mov r2, r8
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r1, r0
	blt _0805B12C
_0805B196:
	bl sub_0805B744
	b _0805B0D4
	.align 2, 0
_0805B19C: .4byte gUnknown_030046D4
_0805B1A0: .4byte gUnknown_085766E0
_0805B1A4: .4byte gUnknown_030013EC
_0805B1A8: .4byte gUnknown_08499590
_0805B1AC: .4byte gUnknown_03003340
_0805B1B0: .4byte 0x0000417A
_0805B1B4: .4byte 0x00001432
_0805B1B8: .4byte 0x00003C72
_0805B1BC:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

