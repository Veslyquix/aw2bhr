	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080424E4
sub_080424E4: @ 0x080424E4
	ldr r2, _080424F4 @ =gUnknown_03003F24
	ldr r1, _080424F8 @ =gUnknown_03003100
	ldrh r0, [r1]
	strh r0, [r2]
	ldrh r0, [r1, #2]
	strh r0, [r2, #2]
	bx lr
	.align 2, 0
_080424F4: .4byte gUnknown_03003F24
_080424F8: .4byte gUnknown_03003100

