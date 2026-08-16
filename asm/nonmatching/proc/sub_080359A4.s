	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080359A4
sub_080359A4: @ 0x080359A4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x44
	movs r1, #0
	ldrsh r0, [r4, r1]
	mov ip, r0
	ldr r1, _08035ACC @ =gUnknown_08090EA8
	ldr r0, [r1]
	ldr r3, [r0]
	movs r2, #6
	ldrsh r0, [r3, r2]
	mov r2, ip
	subs r0, r2, r0
	adds r0, #8
	mov sb, r1
	cmp r0, #0xa8
	bhi _08035ABE
	adds r0, r6, #0
	adds r0, #0x42
	movs r1, #0
	ldrsh r7, [r0, r1]
	movs r2, #4
	ldrsh r1, [r3, r2]
	subs r2, r7, r1
	movs r1, #8
	rsbs r1, r1, #0
	mov r8, r0
	cmp r2, r1
	blt _08035ABE
	cmp r2, #0xf0
	bgt _08035ABE
	subs r0, #0xd
	ldrb r0, [r0]
	adds r5, r4, #0
	cmp r0, #2
	bne _08035A10
	ldr r0, _08035AD0 @ =gUnknown_03003FC0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08035A06
	ldr r0, _08035AD4 @ =gUnknown_030032D8
	ldrh r0, [r0]
	cmp r0, #0x13
	beq _08035A10
_08035A06:
	adds r0, r7, #0
	mov r1, ip
	bl sub_080358C4
	adds r5, r4, #0
_08035A10:
	ldr r0, _08035AD8 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _08035ADC @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r0, #0x1c]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08035A6A
	mov r3, sb
	ldr r0, [r3]
	ldr r3, [r0]
	movs r4, #0
	ldrsh r0, [r5, r4]
	adds r1, r0, #0
	adds r1, #8
	cmp r1, #0
	bge _08035A3E
	adds r1, #0xf
_08035A3E:
	asrs r1, r1, #4
	lsls r1, r1, #1
	ldr r2, _08035AE0 @ =0x0000417A
	adds r0, r3, r2
	adds r0, r0, r1
	ldrh r1, [r0]
	mov r4, r8
	movs r0, #0
	ldrsh r2, [r4, r0]
	adds r0, r2, #0
	adds r0, #8
	cmp r0, #0
	bge _08035A5A
	adds r0, #0xf
_08035A5A:
	asrs r0, r0, #4
	adds r0, r1, r0
	ldr r2, _08035AE4 @ =0x0000234A
	adds r1, r3, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08035ABE
_08035A6A:
	ldr r0, [r6, #0x30]
	mov r3, r8
	movs r4, #0
	ldrsh r2, [r3, r4]
	adds r1, r2, #0
	adds r1, #8
	cmp r1, #0
	bge _08035A7C
	adds r1, #0xf
_08035A7C:
	asrs r1, r1, #4
	movs r2, #0
	ldrsh r3, [r5, r2]
	adds r2, r3, #0
	adds r2, #8
	cmp r2, #0
	bge _08035A8C
	adds r2, #0xf
_08035A8C:
	asrs r2, r2, #4
	bl sub_080255F4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08035ABE
	ldr r0, [r6, #0x2c]
	mov r3, r8
	movs r4, #0
	ldrsh r1, [r3, r4]
	mov r3, sb
	ldr r2, [r3]
	ldr r3, [r2]
	movs r4, #4
	ldrsh r2, [r3, r4]
	subs r1, r1, r2
	adds r1, #8
	movs r4, #0
	ldrsh r2, [r5, r4]
	movs r4, #6
	ldrsh r3, [r3, r4]
	subs r2, r2, r3
	adds r2, #5
	bl sub_0801C254
_08035ABE:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035ACC: .4byte gUnknown_08090EA8
_08035AD0: .4byte gUnknown_03003FC0
_08035AD4: .4byte gUnknown_030032D8
_08035AD8: .4byte gUnknown_030033EC
_08035ADC: .4byte gUnknown_08499598
_08035AE0: .4byte 0x0000417A
_08035AE4: .4byte 0x0000234A

