	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039F58
sub_08039F58: @ 0x08039F58
	push {lr}
	ldr r0, _08039F74 @ =gUnknown_03001FF8
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08039F78 @ =gUnknown_03001418
	strh r1, [r0]
	ldr r0, _08039F7C @ =gUnknown_030033EC
	ldrh r0, [r0]
	bl sub_08044144
	bl sub_08024268
	pop {r0}
	bx r0
	.align 2, 0
_08039F74: .4byte gUnknown_03001FF8
_08039F78: .4byte gUnknown_03001418
_08039F7C: .4byte gUnknown_030033EC

