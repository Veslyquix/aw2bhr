	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080440A8
sub_080440A8: @ 0x080440A8
	push {r4, r5, lr}
	adds r5, r0, #0
	cmp r1, #1
	beq _080440B4
	cmp r1, #2
	beq _080440BC
_080440B4:
	adds r0, r5, #0
	bl sub_080441D4
	b _080440C2
_080440BC:
	adds r0, r5, #0
	bl sub_08044208
_080440C2:
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_08044094
	subs r4, r0, r4
	cmp r4, #0
	bge _080440D2
	movs r4, #0
_080440D2:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08044080
	pop {r4, r5}
	pop {r0}
	bx r0

