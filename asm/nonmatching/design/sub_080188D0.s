	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080188D0
sub_080188D0: @ 0x080188D0
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _08018900 @ =gUnknown_03002514
	ldrb r0, [r0]
	ldr r5, _08018904 @ =gUnknown_0808E590
	cmp r0, #1
	beq _08018924
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
	cmp r0, #0
	bne _08018908
	movs r0, #5
	b _0801891A
	.align 2, 0
_08018900: .4byte gUnknown_03002514
_08018904: .4byte gUnknown_0808E590
_08018908:
	movs r0, #8
	ldrsh r1, [r1, r0]
	ldr r0, _08018944 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #0x1a]
_0801891A:
	subs r0, #1
	ldr r1, _08018948 @ =gUnknown_03002F08
	ldrb r1, [r1]
	bl sub_0802D5CC
_08018924:
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
_08018944: .4byte gUnknown_08499598
_08018948: .4byte gUnknown_03002F08

