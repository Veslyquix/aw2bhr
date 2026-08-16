	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804599C
sub_0804599C: @ 0x0804599C
	push {r4, lr}
	ldr r0, _080459CC @ =gUnknown_08499590
	ldr r2, [r0]
	ldr r0, _080459D0 @ =gUnknown_030040D8
	ldr r3, [r0]
	ldrb r1, [r3, #3]
	lsls r1, r1, #1
	ldr r4, _080459D4 @ =0x0000417A
	adds r0, r2, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrb r1, [r3, #2]
	adds r0, r0, r1
	ldr r1, _080459D8 @ =0x00001432
	adds r2, r2, r1
	adds r2, r2, r0
	ldrb r1, [r2]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #8
	beq _080459DC
	movs r0, #0
	b _080459DE
	.align 2, 0
_080459CC: .4byte gUnknown_08499590
_080459D0: .4byte gUnknown_030040D8
_080459D4: .4byte 0x0000417A
_080459D8: .4byte 0x00001432
_080459DC:
	movs r0, #1
_080459DE:
	pop {r4}
	pop {r1}
	bx r1

