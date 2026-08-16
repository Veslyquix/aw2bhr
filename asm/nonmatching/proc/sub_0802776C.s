	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802776C
sub_0802776C: @ 0x0802776C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #1
	beq _08027794
	cmp r0, #1
	bgt _08027782
	cmp r0, #0
	beq _0802778C
	b _080277B4
_08027782:
	cmp r1, #2
	beq _0802779C
	cmp r1, #3
	beq _080277AC
	b _080277B4
_0802778C:
	ldr r0, _08027790 @ =sub_08027658
	b _0802779E
	.align 2, 0
_08027790: .4byte sub_08027658
_08027794:
	ldr r0, _08027798 @ =sub_080276D0
	b _0802779E
	.align 2, 0
_08027798: .4byte sub_080276D0
_0802779C:
	ldr r0, _080277A8 @ =sub_080276F0
_0802779E:
	movs r1, #0
	bl sub_0801F024
	b _080277B4
	.align 2, 0
_080277A8: .4byte sub_080276F0
_080277AC:
	ldr r0, _080277B8 @ =sub_08027710
	movs r1, #0
	bl sub_0801F024
_080277B4:
	pop {r0}
	bx r0
	.align 2, 0
_080277B8: .4byte sub_08027710

