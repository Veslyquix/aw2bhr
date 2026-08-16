	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08029FC4
sub_08029FC4: @ 0x08029FC4
	ldr r2, _08029FDC @ =gUnknown_03001470
	ldr r0, _08029FE0 @ =gUnknown_03001FBC
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r2
	movs r1, #1
	strh r1, [r0, #0x38]
	bx lr
	.align 2, 0
_08029FDC: .4byte gUnknown_03001470
_08029FE0: .4byte gUnknown_03001FBC

