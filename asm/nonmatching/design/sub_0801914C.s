	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801914C
sub_0801914C: @ 0x0801914C
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _080191A4 @ =gUnknown_03002514
	ldrb r0, [r0]
	ldr r5, _080191A8 @ =gUnknown_0808E5A0
	cmp r0, #1
	beq _08019184
	ldr r2, [r5]
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, #4
	adds r0, r0, r2
	ldr r1, [r0]
	movs r2, #8
	ldrsh r0, [r1, r2]
	movs r2, #5
	cmp r0, #0
	beq _0801917A
	adds r2, r0, #0
_0801917A:
	subs r0, r2, #1
	ldr r1, _080191AC @ =gUnknown_03002F08
	ldrb r1, [r1]
	bl sub_0802D5CC
_08019184:
	ldr r2, [r5]
	lsls r0, r4, #0x10
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
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080191A4: .4byte gUnknown_03002514
_080191A8: .4byte gUnknown_0808E5A0
_080191AC: .4byte gUnknown_03002F08

