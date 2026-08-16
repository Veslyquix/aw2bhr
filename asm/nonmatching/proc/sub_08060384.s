	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08060384
sub_08060384: @ 0x08060384
	push {lr}
	ldr r2, _080603C0 @ =gUnknown_030033E4
	ldr r1, _080603C4 @ =gUnknown_030046C0
	ldrb r0, [r1, #6]
	strh r0, [r2]
	ldrb r0, [r1, #7]
	strh r0, [r2, #2]
	movs r0, #2
	bl sub_08023274
	ldr r1, _080603C8 @ =gUnknown_030046D4
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, [r1]
	cmp r0, #0x1e
	bgt _080603B4
	ldr r0, _080603CC @ =gUnknown_03002EE0
	ldr r0, [r0]
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080603BA
_080603B4:
	ldr r1, _080603D0 @ =gUnknown_030045D4
	movs r0, #4
	strh r0, [r1]
_080603BA:
	pop {r0}
	bx r0
	.align 2, 0
_080603C0: .4byte gUnknown_030033E4
_080603C4: .4byte gUnknown_030046C0
_080603C8: .4byte gUnknown_030046D4
_080603CC: .4byte gUnknown_03002EE0
_080603D0: .4byte gUnknown_030045D4

