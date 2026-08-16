	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032104
sub_08032104: @ 0x08032104
	push {r4, lr}
	ldr r4, _08032128 @ =gUnknown_0849B060
	ldr r0, [r4]
	ldrh r0, [r0]
	movs r1, #0xf
	movs r2, #2
	bl sub_080315E8
	ldr r1, [r4]
	strh r0, [r1]
	ldr r1, _0803212C @ =gUnknown_0300410C
	ldr r0, _08032130 @ =gUnknown_030040CC
	ldrh r0, [r0]
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032128: .4byte gUnknown_0849B060
_0803212C: .4byte gUnknown_0300410C
_08032130: .4byte gUnknown_030040CC

