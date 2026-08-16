	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08005154
sub_08005154: @ 0x08005154
	push {lr}
	bl sub_0801A168
	ldr r0, _08005174 @ =gUnknown_08487E8C
	movs r1, #0
	bl sub_080152EC
	ldr r0, _08005178 @ =gUnknown_0200B0B0
	ldr r1, [r0]
	movs r0, #7
	strh r0, [r1, #2]
	bl sub_08024268
	pop {r0}
	bx r0
	.align 2, 0
_08005174: .4byte gUnknown_08487E8C
_08005178: .4byte gUnknown_0200B0B0

