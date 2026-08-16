	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043190
sub_08043190: @ 0x08043190
	push {r4, r5, r6, r7, lr}
	ldr r7, _080431D4 @ =gUnknown_085D3DD0
	ldr r4, _080431D8 @ =gUnknown_085D5ABC
	movs r3, #0x5c
	muls r3, r2, r3
	adds r6, r3, r4
	ldrb r3, [r6, #0x18]
	lsls r3, r3, #2
	lsls r5, r1, #4
	adds r5, r5, r1
	lsls r5, r5, #2
	adds r3, r3, r5
	lsls r4, r0, #6
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r3, r3, r4
	ldr r0, _080431DC @ =gUnknown_085D3E2C
	adds r3, r3, r0
	ldr r7, [r3]
	adds r0, r2, #0
	bl sub_080432E0
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, r0, r4
	ldr r1, _080431DC @ =gUnknown_085D3E2C
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _080431E0 @ =gUnknown_03003FC0
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _080431E4
	movs r0, #0
	b _080431FA
	.align 2, 0
_080431D4: .4byte gUnknown_085D3DD0
_080431D8: .4byte gUnknown_085D5ABC
_080431DC: .4byte gUnknown_085D3E2C
_080431E0: .4byte gUnknown_03003FC0
_080431E4:
	ldrb r0, [r6, #0x18]
	cmp r0, #0
	beq _080431F6
	movs r2, #4
	ldrsh r0, [r7, r2]
	movs r2, #4
	ldrsh r1, [r1, r2]
	adds r0, r0, r1
	b _080431FA
_080431F6:
	movs r1, #4
	ldrsh r0, [r7, r1]
_080431FA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

