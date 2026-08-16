	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805B8F4
sub_0805B8F4: @ 0x0805B8F4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r4, _0805B944 @ =gUnknown_0816D9D0
	ldr r0, [r4]
	ldr r5, [r0]
	ldr r0, _0805B948 @ =gUnknown_030040D8
	ldr r0, [r0]
	bl sub_08058224
	adds r7, r0, #0
	ldr r0, _0805B94C @ =0x0000270F
	strh r0, [r6]
	movs r1, #2
	ldrsh r0, [r5, r1]
	movs r1, #1
	rsbs r1, r1, #0
	mov r8, r4
	cmp r0, r1
	beq _0805B95A
	adds r4, r1, #0
_0805B920:
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r0, r7
	bgt _0805B950
	ldrb r0, [r5]
	ldrb r1, [r5, #1]
	bl sub_0805BB8C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0805B950
	ldrb r0, [r5]
	strh r0, [r6]
	ldrb r0, [r5, #1]
	strh r0, [r6, #2]
	movs r0, #1
	b _0805B972
	.align 2, 0
_0805B944: .4byte gUnknown_0816D9D0
_0805B948: .4byte gUnknown_030040D8
_0805B94C: .4byte 0x0000270F
_0805B950:
	adds r5, #4
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r0, r4
	bne _0805B920
_0805B95A:
	mov r1, r8
	ldr r0, [r1]
	ldr r5, [r0]
	ldrh r1, [r6]
	ldr r0, _0805B97C @ =0x0000270F
	cmp r1, r0
	bne _0805B970
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_08059C00
_0805B970:
	movs r0, #0
_0805B972:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0805B97C: .4byte 0x0000270F

