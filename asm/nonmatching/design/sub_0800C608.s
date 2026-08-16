	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800C608
sub_0800C608: @ 0x0800C608
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r0, _0800C690 @ =gUnknown_08499590
	ldr r1, [r0]
	lsls r2, r6, #1
	ldr r3, _0800C694 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r7
	ldr r2, _0800C698 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r4, [r1]
	adds r0, r4, #0
	bl sub_0800C7E8
	cmp r0, #2
	bne _0800C636
	adds r0, r4, #0
	bl sub_0800C7A4
_0800C636:
	movs r4, #0
	ldr r1, _0800C69C @ =gUnknown_03003150
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _0800C68A
	ldr r3, _0800C6A0 @ =gUnknown_084995A0
	mov ip, r3
	ldr r5, _0800C6A4 @ =gUnknown_0200B0B0
	adds r3, r1, #0
_0800C648:
	ldrb r0, [r3]
	cmp r0, #0
	beq _0800C67C
	ldrb r0, [r3, #1]
	cmp r0, r7
	bne _0800C67C
	ldrb r0, [r3, #2]
	cmp r0, r6
	bne _0800C67C
	mov r0, ip
	ldr r1, [r0]
	lsls r0, r4, #3
	adds r0, r0, r1
	movs r2, #0
	strb r2, [r0]
	strb r2, [r3]
	ldr r1, [r5]
	ldrb r0, [r1, #0x12]
	subs r0, #1
	strb r0, [r1, #0x12]
	ldr r1, [r5]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0800C67C
	strb r2, [r1, #0x12]
_0800C67C:
	adds r3, #4
	adds r4, #1
	cmp r4, #0x5b
	bgt _0800C68A
	ldrb r0, [r3]
	cmp r0, #0xff
	bne _0800C648
_0800C68A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C690: .4byte gUnknown_08499590
_0800C694: .4byte 0x0000417A
_0800C698: .4byte 0x00001432
_0800C69C: .4byte gUnknown_03003150
_0800C6A0: .4byte gUnknown_084995A0
_0800C6A4: .4byte gUnknown_0200B0B0

