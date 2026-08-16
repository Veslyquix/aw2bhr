	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805A008
sub_0805A008: @ 0x0805A008
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r3, r0, #0
	movs r6, #0
	ldr r1, _0805A01C @ =gUnknown_08499590
	ldr r0, [r1]
	b _0805A0B8
	.align 2, 0
_0805A01C: .4byte gUnknown_08499590
_0805A020:
	movs r4, #0
	ldr r1, _0805A0D0 @ =gUnknown_08499590
	ldr r0, [r1]
	adds r2, r6, #1
	mov r8, r2
	ldrh r0, [r0]
	cmp r4, r0
	bge _0805A0B2
	lsls r0, r6, #2
	ldr r7, _0805A0D4 @ =gUnknown_03003340
	adds r5, r0, r7
	ldr r0, _0805A0D8 @ =gUnknown_08499594
	mov sl, r0
	lsls r1, r6, #1
	mov ip, r1
	ldr r2, _0805A0DC @ =gUnknown_03003F2C
	mov sb, r2
_0805A042:
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0805A0A6
	ldr r7, _0805A0D0 @ =gUnknown_08499590
	ldr r0, [r7]
	ldr r2, _0805A0E0 @ =0x0000417A
	adds r1, r0, r2
	add r1, ip
	ldrh r1, [r1]
	adds r1, r1, r4
	adds r0, #0x12
	adds r0, r0, r1
	ldrb r2, [r0]
	cmp r2, #0
	beq _0805A0A6
	movs r0, #0xc0
	ands r0, r2
	mov r7, sb
	ldrh r7, [r7]
	cmp r0, r7
	bne _0805A0A6
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	mov r7, sl
	ldr r1, [r7]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0x17
	bne _0805A0A6
	movs r0, #0x3f
	ands r2, r0
	ldr r1, _0805A0E4 @ =gUnknown_03004730
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805A0A6
	strb r4, [r3]
	strb r6, [r3, #1]
	ldr r0, [r5]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r3, #2]
	adds r3, #4
_0805A0A6:
	adds r4, #1
	ldr r2, _0805A0D0 @ =gUnknown_08499590
	ldr r0, [r2]
	ldrh r0, [r0]
	cmp r4, r0
	blt _0805A042
_0805A0B2:
	mov r6, r8
	ldr r7, _0805A0D0 @ =gUnknown_08499590
	ldr r0, [r7]
_0805A0B8:
	ldrh r0, [r0, #2]
	cmp r6, r0
	blt _0805A020
	ldr r0, _0805A0E8 @ =0x0000FFFF
	strh r0, [r3, #2]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A0D0: .4byte gUnknown_08499590
_0805A0D4: .4byte gUnknown_03003340
_0805A0D8: .4byte gUnknown_08499594
_0805A0DC: .4byte gUnknown_03003F2C
_0805A0E0: .4byte 0x0000417A
_0805A0E4: .4byte gUnknown_03004730
_0805A0E8: .4byte 0x0000FFFF

