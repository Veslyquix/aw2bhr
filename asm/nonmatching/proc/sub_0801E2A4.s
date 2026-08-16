	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0801E2A4
sub_0801E2A4: @ 0x0801E2A4
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r7, _0801E330 @ =gUnknown_0808F0B4
_0801E2AA:
	movs r2, #0
	ldr r0, [r7]
	lsls r1, r6, #4
	adds r4, r1, r0
	ldrh r5, [r4, #6]
	movs r1, #6
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0801E2F2
	movs r2, #8
	ldrsh r0, [r4, r2]
	movs r2, #0
	ldrsh r1, [r4, r2]
	subs r0, r0, r1
	movs r2, #6
	ldrsh r1, [r4, r2]
	bl __divsi3
	ldrh r1, [r4]
	adds r1, r1, r0
	strh r1, [r4]
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	subs r0, r0, r1
	movs r2, #6
	ldrsh r1, [r4, r2]
	bl __divsi3
	ldrh r1, [r4, #2]
	adds r1, r1, r0
	strh r1, [r4, #2]
	subs r0, r5, #1
	strh r0, [r4, #6]
	movs r2, #1
_0801E2F2:
	ldrh r5, [r4, #0xc]
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0801E31A
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	movs r2, #4
	ldrsh r1, [r4, r2]
	subs r0, r0, r1
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	bl __divsi3
	ldrh r1, [r4, #4]
	adds r1, r1, r0
	strh r1, [r4, #4]
	subs r0, r5, #1
	strh r0, [r4, #0xc]
	movs r2, #1
_0801E31A:
	cmp r2, #0
	beq _0801E324
	adds r0, r6, #0
	bl sub_0801E18C
_0801E324:
	adds r6, #1
	cmp r6, #0x1f
	ble _0801E2AA
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E330: .4byte gUnknown_0808F0B4

