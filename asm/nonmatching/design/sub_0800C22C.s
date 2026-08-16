	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800C22C
sub_0800C22C: @ 0x0800C22C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r7, _0800C2CC @ =gUnknown_0808D870
	cmp r6, #0
	ble _0800C268
	subs r5, r6, #1
	cmp r4, #0
	ble _0800C248
	subs r0, r4, #1
	adds r1, r5, #0
	movs r2, #0
	bl sub_0800C2D0
_0800C248:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_0800C2D0
	ldr r0, [r7]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800C268
	adds r0, r4, #1
	adds r1, r5, #0
	movs r2, #0
	bl sub_0800C2D0
_0800C268:
	cmp r4, #0
	ble _0800C276
	subs r0, r4, #1
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800C2D0
_0800C276:
	ldr r7, [r7]
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800C28C
	adds r0, r4, #1
	adds r1, r6, #0
	movs r2, #1
	bl sub_0800C2D0
_0800C28C:
	ldr r0, [r7]
	ldrh r0, [r0, #2]
	subs r0, #1
	cmp r6, r0
	bge _0800C2C4
	adds r5, r6, #1
	cmp r4, #0
	ble _0800C2A6
	subs r0, r4, #1
	adds r1, r5, #0
	movs r2, #0
	bl sub_0800C2D0
_0800C2A6:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #1
	bl sub_0800C2D0
	ldr r0, [r7]
	ldrh r0, [r0]
	subs r0, #1
	cmp r4, r0
	bge _0800C2C4
	adds r0, r4, #1
	adds r1, r5, #0
	movs r2, #0
	bl sub_0800C2D0
_0800C2C4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C2CC: .4byte gUnknown_0808D870

