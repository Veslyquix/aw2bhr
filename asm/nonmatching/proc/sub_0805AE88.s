	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805AE88
sub_0805AE88: @ 0x0805AE88
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
	str r0, [sp, #0x14]
	mov r2, sp
	adds r2, #0xc
	str r2, [sp, #0x18]
	add r0, sp, #0x10
	mov sl, r0
_0805AEB0:
	ldr r0, [sp, #8]
	adds r0, #1
	str r0, [sp, #8]
	add r0, sp, #4
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	mov r3, sl
	bl sub_0805B5BC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805AECC
	bl sub_0805AF90
_0805AECC:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	ldr r2, _0805AF74 @ =gUnknown_085766E0
	ldr r2, [r2]
	ldrb r3, [r2, #0xf]
	movs r2, #0
	str r2, [sp]
	ldr r2, _0805AF78 @ =gUnknown_030013EC
	ldr r4, [r2]
	movs r2, #1
	bl _call_via_r4
	bl sub_08058318
	adds r4, r0, #0
	bl sub_0805848C
	cmp r4, r0
	bge _0805AEB0
	movs r1, #0
	ldr r2, _0805AF7C @ =gUnknown_08499590
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r1, r0
	bge _0805AF6E
	mov r8, r2
	ldr r0, _0805AF80 @ =gUnknown_03003340
	mov sb, r0
_0805AF04:
	movs r4, #0
	mov r2, r8
	ldr r0, [r2]
	adds r2, r1, #1
	mov ip, r2
	ldrh r0, [r0]
	cmp r4, r0
	bge _0805AF62
	lsls r0, r1, #2
	mov r2, sb
	adds r7, r0, r2
	ldr r5, _0805AF7C @ =gUnknown_08499590
	lsls r6, r1, #1
_0805AF1E:
	ldr r0, [r7]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805AF58
	ldr r1, [r5]
	ldr r2, _0805AF84 @ =0x0000417A
	adds r0, r1, r2
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r3, r0, r4
	ldr r2, _0805AF88 @ =0x00001432
	adds r0, r1, r2
	adds r0, r0, r3
	ldrb r0, [r0]
	movs r2, #0x1f
	ands r2, r0
	cmp r2, #0xd
	beq _0805AF4C
	cmp r2, #0xb
	bne _0805AF58
_0805AF4C:
	ldr r0, _0805AF8C @ =0x00003C72
	adds r1, r1, r0
	adds r1, r1, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0805AF58:
	adds r4, #1
	ldr r0, [r5]
	ldrh r0, [r0]
	cmp r4, r0
	blt _0805AF1E
_0805AF62:
	mov r1, ip
	mov r2, r8
	ldr r0, [r2]
	ldrh r0, [r0, #2]
	cmp r1, r0
	blt _0805AF04
_0805AF6E:
	bl sub_0805B744
	b _0805AEB0
	.align 2, 0
_0805AF74: .4byte gUnknown_085766E0
_0805AF78: .4byte gUnknown_030013EC
_0805AF7C: .4byte gUnknown_08499590
_0805AF80: .4byte gUnknown_03003340
_0805AF84: .4byte 0x0000417A
_0805AF88: .4byte 0x00001432
_0805AF8C: .4byte 0x00003C72

