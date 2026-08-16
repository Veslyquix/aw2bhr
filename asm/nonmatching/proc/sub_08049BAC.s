	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08049BAC
sub_08049BAC: @ 0x08049BAC
	ldr r0, _08049BCC @ =gUnknown_03004008
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08049BC8
	ldr r1, _08049BD0 @ =gUnknown_0300200C
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r1, _08049BD4 @ =gUnknown_03002000
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_08049BC8:
	bx lr
	.align 2, 0
_08049BCC: .4byte gUnknown_03004008
_08049BD0: .4byte gUnknown_0300200C
_08049BD4: .4byte gUnknown_03002000

