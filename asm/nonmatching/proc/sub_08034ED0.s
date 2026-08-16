	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034ED0
sub_08034ED0: @ 0x08034ED0
	push {lr}
	ldr r2, _08034EE8 @ =gUnknown_030032D8
	ldr r1, _08034EEC @ =gUnknown_030044DC
	ldrh r0, [r1]
	strh r0, [r2]
	movs r0, #0
	strh r0, [r1]
	bl sub_08028CF4
	pop {r0}
	bx r0
	.align 2, 0
_08034EE8: .4byte gUnknown_030032D8
_08034EEC: .4byte gUnknown_030044DC

