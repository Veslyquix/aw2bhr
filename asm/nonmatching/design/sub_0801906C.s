	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801906C
sub_0801906C: @ 0x0801906C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	ldr r5, _080190E4 @ =gUnknown_0808E59C
	ldr r2, [r5]
	lsrs r1, r0, #0x10
	mov r8, r1
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r7, r1, r2
	ldr r0, [r7]
	movs r1, #8
	ldrsh r4, [r0, r1]
	movs r1, #0xa
	ldrsh r0, [r0, r1]
	movs r1, #0x18
	bl DivRem
	ldr r3, [r7]
	ldr r6, [r3, #0xc]
	ldr r1, _080190E8 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r1, [r1, #0x1d]
	cmp r1, r0
	beq _080190BE
	cmp r6, #0
	ble _080190BE
	adds r0, r7, #0
_080190B4:
	adds r3, #0x10
	subs r6, #1
	cmp r6, #0
	bgt _080190B4
	str r3, [r0]
_080190BE:
	ldr r2, [r5]
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #0x10
	str r0, [r1]
	movs r0, #1
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080190E4: .4byte gUnknown_0808E59C
_080190E8: .4byte gUnknown_08499598

