	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08007C04
sub_08007C04: @ 0x08007C04
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r7, _08007C9C @ =gUnknown_0808D7EC
	cmp r5, #0
	ble _08007C3A
	subs r6, r5, #1
	cmp r4, #0
	ble _08007C1E
	subs r0, r4, #1
	adds r1, r6, #0
	bl sub_08007BA4
_08007C1E:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08007BA4
	ldr r0, [r7]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _08007C3A
	adds r0, r4, #1
	adds r1, r6, #0
	bl sub_08007BA4
_08007C3A:
	cmp r4, #0
	ble _08007C46
	subs r0, r4, #1
	adds r1, r5, #0
	bl sub_08007BA4
_08007C46:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007BA4
	ldr r6, [r7]
	ldr r0, [r6]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _08007C62
	adds r0, r4, #1
	adds r1, r5, #0
	bl sub_08007BA4
_08007C62:
	ldr r0, [r6]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r5, r0
	bge _08007C94
	adds r5, #1
	cmp r4, #0
	ble _08007C7A
	subs r0, r4, #1
	adds r1, r5, #0
	bl sub_08007BA4
_08007C7A:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08007BA4
	ldr r0, [r6]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _08007C94
	adds r0, r4, #1
	adds r1, r5, #0
	bl sub_08007BA4
_08007C94:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08007C9C: .4byte gUnknown_0808D7EC

