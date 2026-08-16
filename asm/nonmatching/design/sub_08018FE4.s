	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018FE4
sub_08018FE4: @ 0x08018FE4
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	ldr r3, _08019014 @ =gUnknown_0808E598
	ldr r2, [r3]
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	movs r2, #8
	ldrsh r1, [r0, r2]
	ldr r0, _08019018 @ =gUnknown_03002514
	ldrb r0, [r0]
	adds r4, r3, #0
	cmp r0, #1
	beq _0801901C
	adds r0, r1, #0
	bl sub_0803B55C
	movs r3, #0
	b _0801901E
	.align 2, 0
_08019014: .4byte gUnknown_0808E598
_08019018: .4byte gUnknown_03002514
_0801901C:
	movs r3, #1
_0801901E:
	ldr r2, [r4]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #0x10
	str r0, [r1]
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1

