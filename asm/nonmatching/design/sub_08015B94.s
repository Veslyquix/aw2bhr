	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015B94
sub_08015B94: @ 0x08015B94
	push {r4, lr}
	movs r2, #0
	ldr r3, _08015BB8 @ =gUnknown_03001470
	movs r4, #1
_08015B9C:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #5
	adds r1, r0, r3
	ldr r0, [r1]
	cmp r0, #0
	beq _08015BBC
	ldrh r1, [r1, #0x12]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _08015BBC
	movs r0, #1
	b _08015BC8
	.align 2, 0
_08015BB8: .4byte gUnknown_03001470
_08015BBC:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x1d
	bls _08015B9C
	movs r0, #0
_08015BC8:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

