	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08019348
sub_08019348: @ 0x08019348
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08019260
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08019362
	adds r0, r4, #0
	bl sub_080193B0
	b _08019374
_0801935E:
	str r4, [r1]
	b _08019374
_08019362:
	movs r2, #0
	ldr r1, _0801937C @ =gUnknown_0200C508
_08019366:
	ldr r0, [r1]
	cmp r0, #0
	beq _0801935E
	adds r1, #4
	adds r2, #1
	cmp r2, #7
	ble _08019366
_08019374:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801937C: .4byte gUnknown_0200C508

