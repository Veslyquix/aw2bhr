	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080655B0
sub_080655B0: @ 0x080655B0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _080655D0 @ =gUnknown_0816E104
	ldr r0, [r1]
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r2, [r0]
	ldr r0, [r4, #0x2c]
	adds r6, r1, #0
	cmp r0, r2
	beq _080655E4
	cmp r2, #0
	bne _080655D8
	ldr r0, _080655D4 @ =gUnknown_08580C4E
	b _080655DA
	.align 2, 0
_080655D0: .4byte gUnknown_0816E104
_080655D4: .4byte gUnknown_08580C4E
_080655D8:
	ldr r0, _08065608 @ =gUnknown_08580C40
_080655DA:
	str r0, [r4, #0x3c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xe
	strh r0, [r1]
_080655E4:
	ldr r0, [r6]
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _08065610
	ldr r2, _0806560C @ =gUnknown_08580C5C
	adds r1, r4, #0
	adds r1, #0x44
	movs r3, #0
	ldrsh r0, [r1, r3]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r3, [r0, r2]
	adds r5, r1, #0
	b _08065628
	.align 2, 0
_08065608: .4byte gUnknown_08580C40
_0806560C: .4byte gUnknown_08580C5C
_08065610:
	ldr r1, _08065664 @ =gUnknown_08580C5C
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r0, #0xc0
	subs r3, r0, r1
	adds r5, r2, #0
_08065628:
	str r3, [r4, #0x24]
	movs r0, #0xc0
	subs r0, r0, r3
	cmp r0, #0
	bge _08065634
	adds r0, #0xf
_08065634:
	asrs r1, r0, #4
	adds r1, #0x14
	str r1, [r4, #0x28]
	ldr r2, [r4, #0x3c]
	adds r0, r3, #0
	movs r3, #0
	bl sub_0801BD00
	ldr r0, [r6]
	ldr r0, [r0]
	adds r0, #0x30
	ldrb r0, [r0]
	str r0, [r4, #0x2c]
	ldrh r1, [r5]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, #0
	beq _0806565C
	subs r0, r1, #1
	strh r0, [r5]
_0806565C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08065664: .4byte gUnknown_08580C5C

