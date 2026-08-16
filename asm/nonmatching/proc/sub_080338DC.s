	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080338DC
sub_080338DC: @ 0x080338DC
	ldr r0, _080338F4 @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080338F0
	ldr r1, _080338F8 @ =gUnknown_03001FF8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080338F0:
	bx lr
	.align 2, 0
_080338F4: .4byte gUnknown_03004008
_080338F8: .4byte gUnknown_03001FF8

