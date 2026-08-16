	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034F1C
sub_08034F1C: @ 0x08034F1C
	push {r4, lr}
	ldr r4, _08034F40 @ =gUnknown_03002F1C
	ldrh r0, [r4]
	cmp r0, #0
	beq _08034F32
	bl sub_0801A664
	bl sub_08034F7C
	movs r0, #0
	strh r0, [r4]
_08034F32:
	ldr r1, _08034F44 @ =gUnknown_030032D8
	movs r0, #0xd
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034F40: .4byte gUnknown_03002F1C
_08034F44: .4byte gUnknown_030032D8

