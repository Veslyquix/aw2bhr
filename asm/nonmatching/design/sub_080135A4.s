	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080135A4
sub_080135A4: @ 0x080135A4
	push {r4, lr}
	ldr r0, _080135C4 @ =gUnknown_030030CC
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080135CC
	ldr r0, _080135C8 @ =gUnknown_030020C0
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #3
	bl sub_08011C68
	b _080135E6
	.align 2, 0
_080135C4: .4byte gUnknown_030030CC
_080135C8: .4byte gUnknown_030020C0
_080135CC:
	ldr r4, _080135EC @ =gUnknown_03000048
	ldrb r0, [r4]
	cmp r0, #0
	bne _080135E6
	ldr r0, _080135F0 @ =gUnknown_030020C0
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #3
	bl sub_08011E54
	movs r0, #1
	strb r0, [r4]
_080135E6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080135EC: .4byte gUnknown_03000048
_080135F0: .4byte gUnknown_030020C0

