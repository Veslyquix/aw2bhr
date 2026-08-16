	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080193B0
sub_080193B0: @ 0x080193B0
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_08013D40
	bl sub_08017E74
	bl sub_080198AC
	movs r0, #0
	bl sub_08019290
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080193FC
	ldr r3, _080193F8 @ =gUnknown_0200C528
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r0, r1, r3
	str r5, [r0]
	adds r2, r3, #0
	adds r2, #8
	adds r2, r1, r2
	movs r4, #0
	str r4, [r2]
	adds r3, #4
	adds r1, r1, r3
	str r5, [r1]
	strh r4, [r0, #0xc]
	b _080193FE
	.align 2, 0
_080193F8: .4byte gUnknown_0200C528
_080193FC:
	movs r0, #0
_080193FE:
	pop {r4, r5}
	pop {r1}
	bx r1

