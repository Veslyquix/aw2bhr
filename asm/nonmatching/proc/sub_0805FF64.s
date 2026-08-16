	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805FF64
sub_0805FF64: @ 0x0805FF64
	push {r4, lr}
	ldr r0, _0805FF90 @ =gUnknown_030040D8
	ldr r0, [r0]
	bl sub_08035584
	bl sub_080258CC
	ldr r0, _0805FF94 @ =gUnknown_030046CC
	ldr r4, _0805FF98 @ =gUnknown_03003110
	adds r1, r4, #0
	bl sub_0803442C
	adds r0, r4, #0
	bl sub_08025BB4
	ldr r1, _0805FF9C @ =gUnknown_030045D4
	movs r0, #2
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805FF90: .4byte gUnknown_030040D8
_0805FF94: .4byte gUnknown_030046CC
_0805FF98: .4byte gUnknown_03003110
_0805FF9C: .4byte gUnknown_030045D4

