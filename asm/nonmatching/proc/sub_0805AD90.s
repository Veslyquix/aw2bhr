	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805AD90
sub_0805AD90: @ 0x0805AD90
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	bl sub_0805B4A8
	add r2, sp, #8
	add r1, sp, #4
	bl sub_0805B4D8
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805ADB0
	bl sub_0805F7B8
_0805ADB0:
	ldr r6, _0805AE64 @ =gUnknown_08499590
	ldr r0, [r6]
	ldr r1, _0805AE68 @ =0x00002852
	adds r0, r0, r1
	bl sub_0801F92C
	ldr r5, _0805AE6C @ =gUnknown_030013EC
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r2, _0805AE70 @ =gUnknown_030046D4
	ldr r2, [r2]
	ldr r3, _0805AE74 @ =gUnknown_085766E0
	ldr r3, [r3]
	ldrb r3, [r3, #0xf]
	movs r4, #0
	str r4, [sp]
	ldr r4, [r5]
	bl _call_via_r4
	movs r1, #0
	ldr r0, [r6]
	ldrh r0, [r0, #2]
	cmp r1, r0
	bge _0805AE50
	mov r8, r6
	ldr r2, _0805AE78 @ =gUnknown_03003340
	mov sb, r2
_0805ADE6:
	movs r4, #0
	mov r2, r8
	ldr r0, [r2]
	adds r2, r1, #1
	mov ip, r2
	ldrh r0, [r0]
	cmp r4, r0
	bge _0805AE44
	lsls r0, r1, #2
	mov r2, sb
	adds r7, r0, r2
	ldr r5, _0805AE64 @ =gUnknown_08499590
	lsls r6, r1, #1
_0805AE00:
	ldr r0, [r7]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805AE3A
	ldr r1, [r5]
	ldr r2, _0805AE7C @ =0x0000417A
	adds r0, r1, r2
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r3, r0, r4
	ldr r2, _0805AE80 @ =0x00001432
	adds r0, r1, r2
	adds r0, r0, r3
	ldrb r0, [r0]
	movs r2, #0x1f
	ands r2, r0
	cmp r2, #0xd
	beq _0805AE2E
	cmp r2, #0xb
	bne _0805AE3A
_0805AE2E:
	ldr r0, _0805AE84 @ =0x00003C72
	adds r1, r1, r0
	adds r1, r1, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0805AE3A:
	adds r4, #1
	ldr r0, [r5]
	ldrh r0, [r0]
	cmp r4, r0
	blt _0805AE00
_0805AE44:
	mov r1, ip
	mov r2, r8
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r1, r0
	blt _0805ADE6
_0805AE50:
	bl sub_0805B744
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805AE64: .4byte gUnknown_08499590
_0805AE68: .4byte 0x00002852
_0805AE6C: .4byte gUnknown_030013EC
_0805AE70: .4byte gUnknown_030046D4
_0805AE74: .4byte gUnknown_085766E0
_0805AE78: .4byte gUnknown_03003340
_0805AE7C: .4byte 0x0000417A
_0805AE80: .4byte 0x00001432
_0805AE84: .4byte 0x00003C72

