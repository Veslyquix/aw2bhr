	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08034EA4
sub_08034EA4: @ 0x08034EA4
	push {lr}
	bl sub_0802817C
	ldr r0, _08034EB8 @ =gUnknown_03004080
	ldrh r0, [r0]
	cmp r0, #1
	bne _08034EC0
	ldr r1, _08034EBC @ =gUnknown_030032D8
	movs r0, #9
	b _08034EC4
	.align 2, 0
_08034EB8: .4byte gUnknown_03004080
_08034EBC: .4byte gUnknown_030032D8
_08034EC0:
	ldr r1, _08034ECC @ =gUnknown_030032D8
	movs r0, #8
_08034EC4:
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08034ECC: .4byte gUnknown_030032D8

