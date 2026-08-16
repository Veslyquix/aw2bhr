	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804B088
sub_0804B088: @ 0x0804B088
	push {lr}
	ldr r0, _0804B0A4 @ =gUnknown_03001FF8
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0804B0A8 @ =gUnknown_030030A0
	strh r1, [r0]
	ldr r0, _0804B0AC @ =gUnknown_084C3D6C
	bl sub_0801537C
	ldr r0, _0804B0B0 @ =gUnknown_084C3D8C
	bl sub_0801537C
	pop {r0}
	bx r0
	.align 2, 0
_0804B0A4: .4byte gUnknown_03001FF8
_0804B0A8: .4byte gUnknown_030030A0
_0804B0AC: .4byte gUnknown_084C3D6C
_0804B0B0: .4byte gUnknown_084C3D8C

