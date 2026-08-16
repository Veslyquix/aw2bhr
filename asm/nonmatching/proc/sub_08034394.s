	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034394
sub_08034394: @ 0x08034394
	push {lr}
	bl sub_08034598
	ldr r0, _080343C4 @ =gUnknown_030046C0
	ldr r1, _080343C8 @ =sub_08034380
	bl sub_080309AC
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080343C0
	ldr r1, _080343CC @ =gUnknown_03004780
	movs r0, #3
	strh r0, [r1]
	ldr r1, _080343D0 @ =gUnknown_030045D4
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080343D4 @ =gUnknown_03003F60
	movs r0, #4
	strh r0, [r1]
_080343C0:
	pop {r0}
	bx r0
	.align 2, 0
_080343C4: .4byte gUnknown_030046C0
_080343C8: .4byte sub_08034380
_080343CC: .4byte gUnknown_03004780
_080343D0: .4byte gUnknown_030045D4
_080343D4: .4byte gUnknown_03003F60

