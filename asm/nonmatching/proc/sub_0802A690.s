	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802A690
sub_0802A690: @ 0x0802A690
	ldr r2, _0802A6A8 @ =gUnknown_03001470
	ldr r0, _0802A6AC @ =gUnknown_03001FBC
	movs r3, #0
	ldrsh r1, [r0, r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r2
	movs r1, #0
	strh r1, [r0, #0x38]
	bx lr
	.align 2, 0
_0802A6A8: .4byte gUnknown_03001470
_0802A6AC: .4byte gUnknown_03001FBC

