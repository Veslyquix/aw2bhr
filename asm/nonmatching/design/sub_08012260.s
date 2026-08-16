	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012260
sub_08012260: @ 0x08012260
	push {r4, r5, r6, lr}
	ldr r0, _080122B0 @ =0x04000130
	ldrh r1, [r0]
	ldr r2, _080122B4 @ =0x000003FF
	adds r0, r2, #0
	adds r4, r0, #0
	eors r4, r1
	ldr r6, _080122B8 @ =gUnknown_03002F04
	strh r4, [r6]
	ldr r1, _080122BC @ =gUnknown_030024C8
	ldr r2, _080122C0 @ =gUnknown_0808E524
	ldr r0, [r2]
	ldrh r3, [r0]
	adds r0, r4, #0
	bics r0, r3
	strh r0, [r1]
	ldr r5, _080122C4 @ =gUnknown_030030B0
	ldr r0, [r1]
	str r0, [r5]
	adds r1, r4, #0
	cmp r1, #0
	beq _080122D0
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bne _080122D0
	ldr r1, _080122C8 @ =gUnknown_03000042
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080122D8
	ldr r0, [r6]
	str r0, [r5]
	ldr r0, _080122CC @ =gUnknown_03000046
	ldrh r0, [r0]
	strh r0, [r1]
	b _080122D8
	.align 2, 0
_080122B0: .4byte 0x04000130
_080122B4: .4byte 0x000003FF
_080122B8: .4byte gUnknown_03002F04
_080122BC: .4byte gUnknown_030024C8
_080122C0: .4byte gUnknown_0808E524
_080122C4: .4byte gUnknown_030030B0
_080122C8: .4byte gUnknown_03000042
_080122CC: .4byte gUnknown_03000046
_080122D0:
	ldr r0, _080122E4 @ =gUnknown_03000042
	ldr r1, _080122E8 @ =gUnknown_03000044
	ldrh r1, [r1]
	strh r1, [r0]
_080122D8:
	ldr r0, [r2]
	strh r4, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080122E4: .4byte gUnknown_03000042
_080122E8: .4byte gUnknown_03000044

