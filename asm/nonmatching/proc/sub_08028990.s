	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08028990
sub_08028990: @ 0x08028990
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _080289B0 @ =gUnknown_03003FC0
	ldrb r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080289B4
	adds r0, r2, #0
	bl sub_080271CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080289B6
	.align 2, 0
_080289B0: .4byte gUnknown_03003FC0
_080289B4:
	movs r0, #1
_080289B6:
	pop {r1}
	bx r1
	.align 2, 0

