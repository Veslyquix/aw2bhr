	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08084804
sub_08084804: @ 0x08084804
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r7, #0
	ldr r0, _0808482C @ =gUnknown_081D93D8
	mov r8, r0
	ldr r4, [r0]
	ldr r6, _08084830 @ =gUnknown_08616B00
	movs r5, #5
_08084816:
	ldr r0, [r6]
	bl _call_via_r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _08084834
	movs r0, #1
	strb r0, [r4]
	adds r7, #1
	b _08084836
	.align 2, 0
_0808482C: .4byte gUnknown_081D93D8
_08084830: .4byte gUnknown_08616B00
_08084834:
	strb r0, [r4]
_08084836:
	adds r4, #1
	adds r6, #4
	subs r5, #1
	cmp r5, #0
	bge _08084816
	cmp r7, #5
	bne _0808484C
	mov r0, r8
	ldr r1, [r0]
	movs r0, #1
	strb r0, [r1, #4]
_0808484C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

