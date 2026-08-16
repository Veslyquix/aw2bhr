	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08015CB4
sub_08015CB4: @ 0x08015CB4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _08015CC8 @ =gUnknown_03001470
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #5
	adds r2, r2, r3
	strb r1, [r2, #0x14]
	bx lr
	.align 2, 0
_08015CC8: .4byte gUnknown_03001470

