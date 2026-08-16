	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800BEE4
sub_0800BEE4: @ 0x0800BEE4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r7, _0800BF74 @ =gUnknown_0808D868
	cmp r6, #0
	ble _0800BF1A
	subs r5, r6, #1
	cmp r4, #0
	ble _0800BEFE
	subs r0, r4, #1
	adds r1, r5, #0
	bl sub_0800BEB8
_0800BEFE:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800BEB8
	ldr r0, [r7]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800BF1A
	adds r0, r4, #1
	adds r1, r5, #0
	bl sub_0800BEB8
_0800BF1A:
	cmp r4, #0
	ble _0800BF26
	subs r0, r4, #1
	adds r1, r6, #0
	bl sub_0800BEB8
_0800BF26:
	ldr r7, [r7]
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800BF3A
	adds r0, r4, #1
	adds r1, r6, #0
	bl sub_0800BEB8
_0800BF3A:
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r6, r0
	bge _0800BF6C
	adds r5, r6, #1
	cmp r4, #0
	ble _0800BF52
	subs r0, r4, #1
	adds r1, r5, #0
	bl sub_0800BEB8
_0800BF52:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0800BEB8
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800BF6C
	adds r0, r4, #1
	adds r1, r5, #0
	bl sub_0800BEB8
_0800BF6C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800BF74: .4byte gUnknown_0808D868

