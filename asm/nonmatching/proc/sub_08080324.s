	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08080324
sub_08080324: @ 0x08080324
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	adds r6, r7, #0
	adds r6, #0x4c
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #3
	bgt _08080364
	ldr r5, _0808035C @ =gUnknown_03001FF8
	adds r3, r0, #0
	movs r4, #4
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #8
	bl Interpolate
	strh r0, [r5]
	ldr r5, _08080360 @ =gUnknown_030030A0
	movs r2, #8
	rsbs r2, r2, #0
	movs r1, #0
	ldrsh r3, [r6, r1]
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	b _0808046A
	.align 2, 0
_0808035C: .4byte gUnknown_03001FF8
_08080360: .4byte gUnknown_030030A0
_08080364:
	cmp r0, #7
	bgt _08080398
	ldr r5, _08080390 @ =gUnknown_03001FF8
	movs r0, #0
	ldrsh r3, [r6, r0]
	subs r3, #4
	movs r4, #4
	str r4, [sp]
	movs r0, #0
	movs r1, #8
	movs r2, #0
	bl Interpolate
	strh r0, [r5]
	ldr r5, _08080394 @ =gUnknown_030030A0
	movs r1, #8
	rsbs r1, r1, #0
	movs r0, #0
	ldrsh r3, [r6, r0]
	subs r3, #4
	b _08080464
	.align 2, 0
_08080390: .4byte gUnknown_03001FF8
_08080394: .4byte gUnknown_030030A0
_08080398:
	cmp r0, #9
	bgt _080803D0
	ldr r5, _080803C8 @ =gUnknown_03001FF8
	movs r1, #0
	ldrsh r3, [r6, r1]
	subs r3, #8
	movs r4, #2
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #4
	bl Interpolate
	strh r0, [r5]
	ldr r5, _080803CC @ =gUnknown_030030A0
	movs r2, #4
	rsbs r2, r2, #0
	movs r0, #0
	ldrsh r3, [r6, r0]
	subs r3, #8
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	b _0808046A
	.align 2, 0
_080803C8: .4byte gUnknown_03001FF8
_080803CC: .4byte gUnknown_030030A0
_080803D0:
	cmp r0, #0xb
	bgt _08080404
	ldr r5, _080803FC @ =gUnknown_03001FF8
	movs r1, #0
	ldrsh r3, [r6, r1]
	subs r3, #0xa
	movs r4, #2
	str r4, [sp]
	movs r0, #0
	movs r1, #4
	movs r2, #0
	bl Interpolate
	strh r0, [r5]
	ldr r5, _08080400 @ =gUnknown_030030A0
	movs r1, #4
	rsbs r1, r1, #0
	movs r0, #0
	ldrsh r3, [r6, r0]
	subs r3, #0xa
	b _08080464
	.align 2, 0
_080803FC: .4byte gUnknown_03001FF8
_08080400: .4byte gUnknown_030030A0
_08080404:
	cmp r0, #0xc
	bgt _0808043C
	ldr r5, _08080434 @ =gUnknown_03001FF8
	movs r1, #0
	ldrsh r3, [r6, r1]
	subs r3, #0xc
	movs r4, #1
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #2
	bl Interpolate
	strh r0, [r5]
	ldr r5, _08080438 @ =gUnknown_030030A0
	movs r2, #2
	rsbs r2, r2, #0
	movs r0, #0
	ldrsh r3, [r6, r0]
	subs r3, #0xc
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	b _0808046A
	.align 2, 0
_08080434: .4byte gUnknown_03001FF8
_08080438: .4byte gUnknown_030030A0
_0808043C:
	cmp r0, #0xe
	bgt _0808047C
	ldr r5, _08080474 @ =gUnknown_03001FF8
	movs r1, #0
	ldrsh r3, [r6, r1]
	subs r3, #0xd
	movs r4, #1
	str r4, [sp]
	movs r0, #0
	movs r1, #2
	movs r2, #0
	bl Interpolate
	strh r0, [r5]
	ldr r5, _08080478 @ =gUnknown_030030A0
	movs r1, #2
	rsbs r1, r1, #0
	movs r0, #0
	ldrsh r3, [r6, r0]
	subs r3, #0xd
_08080464:
	str r4, [sp]
	movs r0, #0
	movs r2, #0
_0808046A:
	bl Interpolate
	strh r0, [r5]
	b _08080486
	.align 2, 0
_08080474: .4byte gUnknown_03001FF8
_08080478: .4byte gUnknown_030030A0
_0808047C:
	movs r0, #0
	strh r0, [r6]
	adds r0, r7, #0
	bl Proc_Break
_08080486:
	adds r1, r7, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

