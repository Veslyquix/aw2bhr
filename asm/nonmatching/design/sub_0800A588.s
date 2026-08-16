	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800A588
sub_0800A588: @ 0x0800A588
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r6, #0
	ble _0800A5CC
	subs r4, r6, #1
	adds r1, r4, #0
	bl sub_08009B38
	cmp r0, #0
	beq _0800A5CC
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0800A95C
	adds r2, r0, #0
	cmp r2, #0
	bge _0800A5B8
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl sub_08007F68
	b _0800A5CC
_0800A5B8:
	cmp r2, #0
	ble _0800A5CC
	adds r0, r5, #0
	adds r1, r4, #0
	bl MakeTileSimple
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0800A098
_0800A5CC:
	ldr r1, _0800A604 @ =gUnknown_0808D840
	ldr r0, [r1]
	ldr r0, [r0]
	ldrh r0, [r0, #2]
	subs r0, #1
	adds r7, r1, #0
	cmp r6, r0
	bge _0800A61C
	adds r4, r6, #1
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08009B38
	cmp r0, #0
	beq _0800A61C
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0800A95C
	adds r2, r0, #0
	cmp r2, #0
	bge _0800A608
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #1
	bl sub_08007F68
	b _0800A61C
	.align 2, 0
_0800A604: .4byte gUnknown_0808D840
_0800A608:
	cmp r2, #0
	ble _0800A61C
	adds r0, r5, #0
	adds r1, r4, #0
	bl MakeTileSimple
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0800A098
_0800A61C:
	cmp r5, #0
	ble _0800A65C
	subs r4, r5, #1
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08009B38
	cmp r0, #0
	beq _0800A65C
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_0800A95C
	adds r2, r0, #0
	cmp r2, #0
	bge _0800A648
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_08007F68
	b _0800A65C
_0800A648:
	cmp r2, #0
	ble _0800A65C
	adds r0, r4, #0
	adds r1, r6, #0
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_0800A098
_0800A65C:
	ldr r0, [r7]
	ldr r0, [r0]
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	bge _0800A6A4
	adds r4, r5, #1
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08009B38
	cmp r0, #0
	beq _0800A6A4
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_0800A95C
	adds r2, r0, #0
	cmp r2, #0
	bge _0800A690
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #1
	bl sub_08007F68
	b _0800A6A4
_0800A690:
	cmp r2, #0
	ble _0800A6A4
	adds r0, r4, #0
	adds r1, r6, #0
	bl MakeTileSimple
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_0800A098
_0800A6A4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

