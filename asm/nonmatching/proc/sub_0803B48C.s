	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803B48C
sub_0803B48C: @ 0x0803B48C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r4, _0803B4D4 @ =gUnknown_030005CC
	ldrh r0, [r4]
	cmp r0, #0
	beq _0803B4CC
	lsls r0, r1, #0x10
	cmp r0, #0
	beq _0803B4A6
	lsrs r0, r0, #0x10
	bl sub_08070478
_0803B4A6:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _0803B4CC
	ldr r4, _0803B4D8 @ =gUnknown_0849E710
	adds r0, r4, #0
	bl sub_08015BD0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0803B4CC
	adds r0, r4, #0
	movs r1, #0
	bl sub_080152EC
_0803B4CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803B4D4: .4byte gUnknown_030005CC
_0803B4D8: .4byte gUnknown_0849E710

