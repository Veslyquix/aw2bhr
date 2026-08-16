	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080375D4
sub_080375D4: @ 0x080375D4
	push {lr}
	adds r2, r0, #0
	ldrh r1, [r2, #0x1e]
	adds r0, r1, #1
	strh r0, [r2, #0x1e]
	movs r0, #0x3f
	ands r0, r1
	cmp r0, #1
	beq _080375FE
	cmp r0, #1
	bgt _080375F0
	cmp r0, #0
	beq _080375F6
	b _0803760C
_080375F0:
	cmp r0, #0x16
	beq _08037606
	b _0803760C
_080375F6:
	ldr r0, [r2, #0x18]
	bl sub_0801B6EC
	b _0803760C
_080375FE:
	ldr r0, [r2, #0x18]
	bl sub_0801B6FC
	b _0803760C
_08037606:
	ldr r0, [r2, #0x18]
	bl sub_08037A78
_0803760C:
	pop {r0}
	bx r0

