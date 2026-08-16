	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080293A0
sub_080293A0: @ 0x080293A0
	push {lr}
	ldr r2, _080293BC @ =gUnknown_03003F40
	movs r1, #0
	str r1, [r2]
	ldr r3, _080293C0 @ =gUnknown_030033E4
	ldr r2, _080293C4 @ =gUnknown_03003100
	ldrh r1, [r2]
	strh r1, [r3]
	ldrh r1, [r2, #2]
	strh r1, [r3, #2]
	bl sub_08028ED0
	pop {r0}
	bx r0
	.align 2, 0
_080293BC: .4byte gUnknown_03003F40
_080293C0: .4byte gUnknown_030033E4
_080293C4: .4byte gUnknown_03003100

