	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08024720
sub_08024720: @ 0x08024720
	push {r4, r5, r6, lr}
	ldr r0, _08024770 @ =gUnknown_03004008
	ldr r0, [r0]
	lsrs r5, r0, #2
	movs r0, #0xf
	ands r5, r0
	movs r4, #1
	ldr r6, _08024774 @ =gUnknown_08090A30
_08024730:
	ldr r0, [r6]
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x1b]
	cmp r0, #0
	beq _08024790
	adds r0, r4, #0
	bl sub_0804415C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802477C
	adds r0, r5, #0
	cmp r0, #0
	blt _0802477C
	ldr r1, _08024778 @ =gUnknown_0809139C
	lsls r0, r0, #1
	adds r0, r0, r1
	adds r1, r4, #0
	adds r1, #0xb
	lsls r1, r1, #5
	adds r1, #0x1e
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #2
	bl sub_0801368C
	b _08024790
	.align 2, 0
_08024770: .4byte gUnknown_03004008
_08024774: .4byte gUnknown_08090A30
_08024778: .4byte gUnknown_0809139C
_0802477C:
	adds r1, r4, #0
	adds r1, #0xb
	lsls r1, r1, #5
	adds r1, #0x1e
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, _080247A0 @ =gUnknown_0809139C
	movs r2, #2
	bl sub_0801368C
_08024790:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _08024730
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080247A0: .4byte gUnknown_0809139C

