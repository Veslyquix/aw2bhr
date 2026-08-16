	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08061668
sub_08061668: @ 0x08061668
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	movs r4, #0
	movs r6, #0
	movs r5, #0xfe
	ldr r0, _080616D4 @ =0x0000270F
	strh r0, [r2]
	ldr r1, _080616D8 @ =gUnknown_0816DAFC
	ldr r0, [r1]
	ldr r3, [r0]
	ldrb r0, [r3]
	mov r8, r1
	cmp r0, #0xff
	beq _080616B8
	ldr r0, _080616DC @ =gUnknown_0857680F
	mov ip, r0
	ldr r7, _080616E0 @ =gUnknown_030046C0
	adds r1, r3, #0
_08061690:
	ldrb r0, [r1, #3]
	cmp r0, r5
	bhs _080616AE
	ldrb r0, [r7, #6]
	add r0, ip
	ldrb r0, [r0]
	ldrb r3, [r1, #2]
	cmp r0, r3
	bne _080616AE
	ldrb r0, [r1]
	strh r0, [r2]
	ldrb r0, [r1, #1]
	strh r0, [r2, #2]
	ldrb r5, [r1, #3]
	adds r6, r4, #0
_080616AE:
	adds r1, #4
	adds r4, #1
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _08061690
_080616B8:
	ldrh r1, [r2]
	ldr r0, _080616D4 @ =0x0000270F
	cmp r1, r0
	beq _080616E4
	mov r1, r8
	ldr r0, [r1]
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r1
	movs r1, #0xfe
	strb r1, [r0, #3]
	movs r0, #1
	b _080616E6
	.align 2, 0
_080616D4: .4byte 0x0000270F
_080616D8: .4byte gUnknown_0816DAFC
_080616DC: .4byte gUnknown_0857680F
_080616E0: .4byte gUnknown_030046C0
_080616E4:
	movs r0, #0
_080616E6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

