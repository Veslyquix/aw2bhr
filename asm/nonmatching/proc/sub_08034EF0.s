	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034EF0
sub_08034EF0: @ 0x08034EF0
	push {r4, lr}
	bl sub_08019260
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _08034F06
	bl sub_08037F80
	ldr r0, _08034F0C @ =gUnknown_030032D8
	strh r4, [r0]
_08034F06:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034F0C: .4byte gUnknown_030032D8

