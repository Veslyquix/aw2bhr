	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807614C
sub_0807614C: @ 0x0807614C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldrh r5, [r4, #0x36]
	strh r5, [r4, #0x32]
	ldrh r6, [r4, #0x38]
	strh r6, [r4, #0x34]
	ldr r2, _080761B8 @ =gUnknown_0202FDFC
	movs r0, #4
	ldrsh r1, [r2, r0]
	movs r3, #0
	ldrsh r0, [r2, r3]
	adds r1, r1, r0
	cmp r1, #0
	bge _0807616A
	adds r1, #7
_0807616A:
	asrs r3, r1, #3
	strh r3, [r4, #0x36]
	movs r7, #6
	ldrsh r1, [r2, r7]
	movs r7, #2
	ldrsh r0, [r2, r7]
	adds r1, r1, r0
	cmp r1, #0
	bge _0807617E
	adds r1, #7
_0807617E:
	asrs r1, r1, #3
	strh r1, [r4, #0x38]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	cmp r3, r0
	bne _08076192
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	beq _080761C2
_08076192:
	bl sub_08075EC4
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, r1
	beq _080761AA
	cmp r1, #0
	bne _080761BC
_080761AA:
	adds r0, r4, #0
	bl sub_08075F44
	adds r0, r4, #0
	bl sub_0807606C
	b _080761C2
	.align 2, 0
_080761B8: .4byte gUnknown_0202FDFC
_080761BC:
	adds r0, r4, #0
	bl Proc_Break
_080761C2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

